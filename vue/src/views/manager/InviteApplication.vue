<template>
    <div>
        <div class="search">
            <!-- <el-input placeholder="审核状态" style="width: 200px" v-model="status"></el-input> -->
            <el-select v-model="status" slot="prepend" placeholder="审核状态" style="width: 130px;" clearable>
                <el-option label="待审核" value="PENDING"></el-option>
                <el-option label="审核通过" value="APPROVED"></el-option>
                <el-option label="驳回审核" value="REJECTED"></el-option>
            </el-select>
            <el-button type="info" plain style="margin-left: 10px" @click="load(1)" class="el-icon-search">
                查询</el-button>
            <el-button type="warning" plain style="margin-left: 10px" @click="reset" class="el-icon-refresh-left">
                重置</el-button>
        </div>

        <div class="operation">
            <!-- <el-button type="primary" plain @click="handleAdd" class="el-icon-plus"> 新增</el-button> -->
            <el-button type="danger" plain @click="delBatch" class="el-icon-delete-solid">
                批量删除
                <span class="export-tip">（已选{{ selectedRows.length }}条）</span>
            </el-button>
        </div>

        <div class="table">
            <el-table :data="tableData" border strip @selection-change="handleSelectionChange" :row-key=getRowKey
                ref="myTable">
                <el-table-column type="selection" width="55" align="center" :reserve-selection="true"></el-table-column>
                <!-- <el-table-column prop="id" label="序号" width="70" align="center" sortable></el-table-column> -->
                <el-table-column prop="applicantEmail" label="申请邮箱" width="250" sortable></el-table-column>
                <el-table-column prop="applyReason" label="申请原因" width="250" show-overflow-tooltip=""></el-table-column>
                <el-table-column prop="status" label="申请状态">
                    <template slot-scope="scope">
                        <el-tag type="infp" v-if="scope.row.status === 'PENDING'">待审核</el-tag>
                        <el-tag type="success" v-else-if="scope.row.status === 'APPROVED'">审核通过</el-tag>
                        <el-tag type="danger" v-else-if="scope.row.status === 'REJECTED'">驳回审核</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="inviteCode" label="邀请码" width="250"></el-table-column>
                <el-table-column prop="reviewerName" label="审核人"></el-table-column>
                <el-table-column prop="reviewComment" label="审核意见"></el-table-column>
                <el-table-column prop="createdAt" label="申请时间" :formatter="formatDate"></el-table-column>
                <el-table-column prop="updatedAt" label="审核时间" :formatter="formatDate"></el-table-column>
                <el-table-column label="操作" align="center" width="180">
                    <template v-slot="scope">
                        <el-button size="mini" type="success" plain @click="handleEdit(scope.row)"
                            class="el-icon-document-checked">
                            审核</el-button>
                        <el-button size="mini" type="danger" plain @click="del(scope.row.id)" class="el-icon-delete">
                            删除</el-button>
                    </template>
                </el-table-column>
            </el-table>

            <div class="pagination">
                <el-pagination background @current-change="handleCurrentChange" :current-page="pageNum"
                    :page-sizes="[5, 10, 20]" :page-size="pageSize" layout="total, prev, pager, next" :total="total">
                </el-pagination>
            </div>
        </div>

        <el-dialog title="审核" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
            <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
                <el-form-item label="审核人" prop="reviewerName">
                    <el-input v-model="form.reviewerName" placeholder="申请人" disabled></el-input>
                </el-form-item>
                <el-form-item label="审核意见" prop="reviewComment">
                    <el-input v-model="form.reviewComment" type="textarea" placeholder="请填写审核意见"></el-input>
                </el-form-item>
            </el-form>

            <div slot="footer" class="dialog-footer">
                <el-button @click="fromVisible = false">取 消</el-button>
                <el-button type="primary" @click="opprove">同 意</el-button>
                <el-button type="warning" @click="reject">驳 回</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';       // 必须引入 utc 插件
import timezone from 'dayjs/plugin/timezone';

dayjs.extend(utc);
dayjs.extend(timezone);
dayjs.tz.setDefault('Asia/Shanghai');

export default {
    name: "InviteApplication",
    data() {
        return {
            tableData: [], // 所有的数据
            pageNum: 1, // 当前的页码
            pageSize: 13, // 每页显示的个数
            total: 0,
            status: null,
            fromVisible: false,
            form: {},
            user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
            rules: {
                sku: [{ required: true, message: "请输入SKU", trigger: "blur" }],
            },
            ids: [],
            selectedRows: [], // 存储选中的行数据
        };
    },
    created() {
        this.load(1);
    },
    computed: {
        defaultReviewerId() {
            return this.user.id || '';
        }
    },
    methods: {
        handleAdd() {
            // 新增数据
            this.form = {}; // 新增数据的时候清空数据
            this.fromVisible = true; // 打开弹窗
        },
        handleEdit(row) {
            // 编辑数据
            this.form = JSON.parse(JSON.stringify(row)); // 给form对象赋值  注意要深拷贝数据

            this.form = {
                id: row.id,
                reviewerId: this.user.id, // 设置审核人ID
                reviewerName: this.user.name, // 设置审核人姓名
                reviewComment: row.reviewComment || '', // 初始化审核意见
            }
            this.fromVisible = true; // 打开弹窗
        },
        opprove() {
            if (!this.form.id) {
                return this.$message.error('申请 ID 缺失');
            }
            this.$request.post(`/invite/approve/${this.form.id}`, {
                comment: this.form.reviewComment,
                reviewerId: this.user.id, // 设置审核人ID
            }).then((res) => {
                if (res.code === "200") {
                    this.$notify({
                        title: '审核通过',
                        message: '申请已成功审核通过',
                        type: 'success',
                        duration: 3000, // 可选，设置通知持续时间
                        position: 'top-right', // 可选，设置通知位置
                    });
                    this.load(1);
                    this.fromVisible = false;
                } else {
                    this.$notify({
                        title: '审核失败',
                        message: res.msg,
                        type: 'error',
                        duration: 3000, // 可选，设置通知持续时间
                        position: 'top-right', // 可选，设置通知位置
                    });
                }
            });
        },
        reject() {
            if (!this.form.id) {
                return this.$message.error('申请 ID 缺失');
            }
            this.$request.post(`/invite/reject/${this.form.id}`, {
                comment: this.form.reviewComment,
                reviewerId: this.form.reviewerId
            }).then((res) => {
                if (res.code === "200") {
                    this.$notify({
                        title: '审批完成',
                        message: '申请已成功审核驳回',
                        type: 'warning',
                        duration: 3000, // 可选，设置通知持续时间
                        position: 'top-right', // 可选，设置通知位置
                    });
                    this.load(1);
                    this.fromVisible = false;
                } else {
                    this.$notify({
                        title: '审核失败',
                        message: res.msg,
                        type: 'error',
                        duration: 3000, // 可选，设置通知持续时间
                        position: 'top-right', // 可选，设置通知位置
                    });
                }
            });
        },
        del(id) {
            // 单个删除
            this.$confirm("您确定删除吗？", "确认删除", { type: "warning" })
                .then((response) => {
                    this.$request.delete("/invite-application/delete/" + id).then((res) => {
                        if (res.code === "200") {
                            // 表示操作成功
                            this.$message.success("操作成功");
                            this.load(1);
                        } else {
                            this.$message.error(res.msg); // 弹出错误的信息
                        }
                    });
                })
                .catch(() => { });
        },
        handleSelectionChange(rows) {
            // 当前选中的所有的行数据
            this.ids = rows.map((v) => v.id);  // 用于批量删除
            this.selectedRows = rows;  // 用于导出
        },
        delBatch() {
            // 批量删除
            if (!this.ids.length) {
                this.$message.warning("请选择数据");
                return;
            }
            this.$confirm("您确定批量删除这些数据吗？", "确认删除", {
                type: "warning",
            })
                .then((response) => {
                    this.$request
                        .delete("/invite-application/delete/batch", { data: this.ids })
                        .then((res) => {
                            if (res.code === "200") {
                                // 表示操作成功
                                this.$message.success("操作成功");
                                this.$refs.myTable.clearSelection(); // 清空选中
                                this.load(1);
                            } else {
                                this.$message.error(res.msg); // 弹出错误的信息
                            }
                        });
                })
                .catch(() => { });
        },
        load(pageNum) {
            // 分页查询
            if (pageNum) this.pageNum = pageNum;
            this.$request
                .get("/invite-application/selectPage", {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        status: this.status,
                    },
                })
                .then((res) => {
                    this.tableData = res.data?.list;
                    this.total = res.data?.total;
                });
        },
        reset() {
            this.status = null;
            this.load(1);
        },
        handleCurrentChange(pageNum) {
            this.load(pageNum);
        },

        successUpload(res) {
            if (res.code === '200') {
                this.$message.success("批量导入成功");
                this.load(1);
            } else {
                this.$message.error(res.msg);
            }
        },
        getRowKey(row) {
            return row.id;
        },
        formatDate(row, column, cellValue) {
            // console.log('row 结构:', row); // 应包含所有行字段
            // console.log('cellValue 类型:', typeof cellValue); // 应为 'string'

            const dateStr = cellValue;
            if (!dateStr) return ''; // 如果没有日期字符串，返回空字符串

            try {
                const date = dayjs(dateStr);
                if (!date.isValid()) {
                    console.error('无效日期格式:', dateStr);
                    return dateStr; // 或返回默认文本
                }

                // 使用 utc() 解析并转换为上海时区
                return dayjs.utc(dateStr).tz('Asia/Shanghai').format('YYYY 年 MM 月 DD 日 HH:mm:ss');
            } catch (error) {
                console.error('日期格式化错误:', error);
                return dateStr;
            }
        }
    },
};
</script>

<style scoped>
.export-tip {
    color: #666;
    font-size: 12px;
    margin-left: 5px;
    font-weight: bold;
}
</style>
