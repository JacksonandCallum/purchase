<template>
    <div>
        <div class="search">
            <!-- <el-input placeholder="请输入SKU" style="width: 200px" v-model="sku"></el-input> -->
            <el-autocomplete popper-class="my-autocomplete" :popper-append-to-body="false" v-model="sku"
                :fetch-suggestions="querySearch" placeholder="请输入/选择SKU" @select="handleSelect" clearable>
                <!-- <i class="el-icon-edit el-input__icon" slot="suffix" @click="handleIconClick">
                </i> -->
                <template slot-scope="{ item }">
                    <div class="value1">{{ item.value1 }}</div>
                    <span class="value2">{{ item.value2 }}</span>
                </template>
            </el-autocomplete>
            <el-select v-model="hasFull" slot="prepend" placeholder="是否整箱" style="width: 100px;margin-left: 5px;" clearable>
                <el-option label="是" :value="true"></el-option>
                <el-option label="否" :value="false"></el-option>
            </el-select>
            <el-select v-model="hasNew" slot="prepend" placeholder="是否新增" style="width: 100px;margin-left: 5px;" clearable>
                <el-option label="是" :value="true"></el-option>
                <el-option label="否" :value="false"></el-option>
            </el-select>
            <el-select v-model="hasUrgent" slot="prepend" placeholder="是否加急" style="width: 100px;margin-left: 5px;" clearable>
                <el-option label="是" :value="true"></el-option>
                <el-option label="否" :value="false"></el-option>
            </el-select>
            <el-select v-model="hasFullProcurement" slot="prepend" placeholder="完全采购"
                style="width: 100px;margin-left: 5px;" clearable>
                <el-option label="是" :value="true"></el-option>
                <el-option label="否" :value="false"></el-option>
            </el-select>
            <el-select v-model="hasAllItemsArrived" slot="prepend" placeholder="全部到货"
                style="width: 100px;margin-left: 5px;" clearable>
                <el-option label="是" :value="true"></el-option>
                <el-option label="否" :value="false"></el-option>
            </el-select>
            <el-button type="info" plain style="margin-left: 10px" @click="load(1)" class="el-icon-search">
                查询</el-button>
            <el-button type="warning" plain style="margin-left: 10px" @click="reset" class="el-icon-refresh-left">
                重置</el-button>
        </div>

        <div class="operation">
            <el-button type="primary" plain @click="handleAdd" class="el-icon-plus"> 新增</el-button>
            <el-button type="danger" plain @click="delBatch" class="el-icon-delete-solid">
                批量删除
                <span class="export-tip">（已选{{ selectedRows.length }}条）</span>
            </el-button>
            <el-button type="success" plain @click="expAll()" class="el-icon-document"> 全部数据 => 导出报表</el-button>
            <el-button type="success" plain @click="exp2()" class="el-icon-download">
                选择数据 => 导出报表
                <span class="export-tip">（已选{{ selectedRows.length }}条）</span>
            </el-button>
            <el-upload action="http://localhost:9090/procurement-needs/import"
                style="display: inline-block; margin-left: 10px" :on-success="successUpload" :show-file-list="false">
                <el-button size="small" type="info" plain class="el-icon-upload2"> 批量导入</el-button>
            </el-upload>
            <el-upload action="http://localhost:9090/procurement-needs/import-by-sku"
                style="display: inline-block; margin-left: 10px" :on-success="successUpload1" :show-file-list="false"
                :before-upload="beforeUpload" :headers="{ token: user.token }">
                <el-button size="small" type="info" plain class="el-icon-upload"> [ 根据sku匹配 ] 导入</el-button>
            </el-upload>
        </div>

        <div class="table">
            <el-table :data="tableData" border style="width: 100%" strip @selection-change="handleSelectionChange"
                :row-key="getRowKey" ref="myTable">
                <el-table-column type="selection" width="55" align="center" :reserve-selection="true"></el-table-column>
                <!-- <el-table-column fixed prop="id" label="id" width="70" sortable>
                </el-table-column> -->
                <el-table-column prop="inputDate" label="数据输入日期" width="150" sortable>
                </el-table-column>
                <el-table-column prop="planId" label="计划编号" width="300">
                </el-table-column>
                <el-table-column prop="planAuxiliaryId" label="计划编号辅助列" width="300">
                </el-table-column>
                <el-table-column prop="sku" label="SKU" width="300" fixed>
                </el-table-column>
                <el-table-column prop="productName" label="品名" width="200">
                </el-table-column>
                <el-table-column prop="attribute" label="颜色及规格" width="200">
                </el-table-column>
                <el-table-column prop="expectedArrivalTime" label="期望到货时间" width="120">
                </el-table-column>
                <el-table-column prop="factory" label="工厂" width="120">
                </el-table-column>
                <el-table-column prop="warehouse" label="仓库" width="120">
                </el-table-column>
                <el-table-column prop="shop" label="店铺" width="120">
                </el-table-column>
                <el-table-column prop="purchaseVolume" label="采购量" width="150">
                </el-table-column>
                <el-table-column prop="cartonNumber" label="装箱数" width="120">
                </el-table-column>
                <el-table-column prop="hasFull" label="是否整箱" width="120">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.hasFull">是</el-tag>
                        <el-tag type="danger" v-else>否</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="hasNew" label="是否新增" width="120">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.hasNew">是</el-tag>
                        <el-tag type="danger" v-else>否</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="hasUrgent" label="是否加急" width="120">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.hasUrgent">是</el-tag>
                        <el-tag type="danger" v-else>否</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="operationRemark" label="运营备注" width="300" show-overflow-tooltip>
                </el-table-column>
                <el-table-column prop="deliveryDateResponse" label="交期答复1" width="300" show-overflow-tooltip>
                </el-table-column>
                <el-table-column prop="deliveryDateResponseFeishu" label="交期答复2（飞书）" width="300" show-overflow-tooltip>
                </el-table-column>
                <el-table-column prop="orderedQuantity" label="已下单数量" width="120">
                </el-table-column>
                <el-table-column prop="pendingArrivalQuantity" label="待到货数量" width="120">
                </el-table-column>
                <el-table-column prop="receivedQuantity" label="已到货量" width="150">
                </el-table-column>
                <el-table-column prop="remainingUnprocuredQuantity" label="剩余未采购量" width="120">
                </el-table-column>
                <el-table-column prop="hasFullProcurement" label="完全采购" width="120">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.hasFullProcurement">是</el-tag>
                        <el-tag type="danger" v-else>否</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="hasAllItemsArrived" label="全部到货" width="120">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.hasAllItemsArrived">是</el-tag>
                        <el-tag type="danger" v-else>否</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="purchaseNotes" label="采购备注" width="300" show-overflow-tooltip>
                </el-table-column>
                <el-table-column prop="deliverOrProductTime" label="交货/生产时长" width="120">
                </el-table-column>
                <el-table-column prop="expectArrivalTimeCountdown" label="期望到货时间倒计时" width="130">
                </el-table-column>
                <el-table-column fixed="right" label="操作" width="120">
                    <template slot-scope="scope">
                        <el-button @click="handleEdit(scope.row)" type="text" size="small" class="el-icon-edit">
                            编辑</el-button>
                        <el-button type="text" size="small" @click="del(scope.row.id)" class="el-icon-delete">
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

        <el-dialog title="编辑采购需求" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false"
            destroy-on-close>
            <el-form :model="form" label-width="140px" style="padding-right: 50px" :rules="rules" ref="formRef">
                <el-form-item label="数据输入日期" prop="inputDate">
                    <el-date-picker v-model="form.inputDate" type="date" placeholder="数据输入日期"
                        :picker-options="pickerOptions" format="yyyy 年 MM 月 dd 日" value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item label="计划编号" prop="planId">
                    <el-input v-model="form.planId" placeholder="计划编号"></el-input>
                </el-form-item>
                <el-form-item label="计划编号辅助列" prop="planAuxiliaryId">
                    <el-input v-model="form.planAuxiliaryId" placeholder="计划编号辅助列"></el-input>
                </el-form-item>
                <el-form-item label="SKU" prop="sku">
                    <el-input v-model="form.sku" placeholder="SKU" @blur="loadMatchingData"></el-input>
                </el-form-item>
                <el-form-item label="品名" prop="productName">
                    <el-input v-model="form.productName" placeholder="品名"></el-input>
                </el-form-item>
                <el-form-item label="颜色及规格" prop="attribute">
                    <el-input v-model="form.attribute" placeholder="颜色及规格"></el-input>
                </el-form-item>
                <el-form-item label="期望到货时间" prop="expectedArrivalTime">
                    <el-date-picker v-model="form.expectedArrivalTime" type="date" placeholder="期望到货时间"
                        :picker-options="pickerOptions1" format="yyyy 年 MM 月 dd 日" value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item label="工厂" prop="factory">
                    <el-input v-model="form.factory" placeholder="工厂"></el-input>
                </el-form-item>
                <el-form-item label="仓库" prop="warehouse">
                    <el-input v-model="form.warehouse" placeholder="仓库"></el-input>
                </el-form-item>
                <el-form-item label="店铺" prop="shop">
                    <el-input v-model="form.shop" placeholder="店铺"></el-input>
                </el-form-item>
                <el-form-item label="采购量" prop="purchaseVolume">
                    <el-input v-model="form.purchaseVolume" placeholder="采购量"></el-input>
                </el-form-item>
                <el-form-item label="装箱数" prop="cartonNumber">
                    <el-input v-model="form.cartonNumber" placeholder="装箱数"></el-input>
                </el-form-item>
                <el-form-item label="是否整箱" prop="hasFull">
                    <el-radio-group v-model="form.hasFull">
                        <el-radio :label="true" border style="padding-right: 10px"
                            v-disable-radio="isFieldDisabled('hasFull')"
                            :class="{ 'disabled-style': isFieldDisabled('hasFull') }">是</el-radio>
                        <el-radio :label="false" border v-disable-radio="isFieldDisabled('hasFull')"
                            :class="{ 'disabled-style': isFieldDisabled('hasFull') }">否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="是否新增" prop="hasNew">
                    <el-radio-group v-model="form.hasNew">
                        <el-radio :label="true" border style="padding-right: 10px">是</el-radio>
                        <el-radio :label="false" border>否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="是否加急" prop="hasUrgent">
                    <el-radio-group v-model="form.hasUrgent">
                        <el-radio :label="true" border style="padding-right: 10px">是</el-radio>
                        <el-radio :label="false" border>否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="运营备注" prop="operationRemark">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.operationRemark"
                        placeholder="运营备注"></el-input>
                </el-form-item>
                <el-form-item label="交期答复1" prop="deliveryDateResponse">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.deliveryDateResponse"
                        placeholder="交期答复1"></el-input>
                </el-form-item>
                <el-form-item label="交期答复2（飞书）" prop="deliveryDateResponseFeishu">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.deliveryDateResponseFeishu"
                        placeholder="交期答复2（飞书）"></el-input>
                </el-form-item>
                <el-form-item label="已下单数量" prop="orderedQuantity">
                    <el-input v-model="form.orderedQuantity" placeholder="已下单数量"></el-input>
                </el-form-item>
                <el-form-item label="待到货数量" prop="pendingArrivalQuantity">
                    <el-input v-model="form.pendingArrivalQuantity" placeholder="待到货数量"></el-input>
                </el-form-item>
                <el-form-item label="已到货量" prop="receivedQuantity">
                    <el-input v-model="form.receivedQuantity" placeholder="已到货量"></el-input>
                </el-form-item>
                <el-form-item label="剩余未采购量" prop="remainingUnprocuredQuantity">
                    <el-input v-model="form.remainingUnprocuredQuantity" placeholder="剩余未采购量"></el-input>
                </el-form-item>
                <el-form-item label="完全采购" prop="hasFullProcurement">
                    <el-radio-group v-model="form.hasFullProcurement">
                        <el-radio :label="true" border style="padding-right: 10px">是</el-radio>
                        <el-radio :label="false" border>否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="全部到货" prop="hasAllItemsArrived">
                    <el-radio-group v-model="form.hasAllItemsArrived">
                        <el-radio :label="true" border style="padding-right: 10px">是</el-radio>
                        <el-radio :label="false" border>否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="采购备注" prop="purchaseNotes">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.purchaseNotes"
                        placeholder="采购备注"></el-input>
                </el-form-item>
                <el-form-item label="交货/生产时长" prop="deliverOrProductTime">
                    <el-input v-model="form.deliverOrProductTime" placeholder="交货/生产时长"></el-input>
                </el-form-item>
                <el-form-item label="期望到货时间倒计时" prop="expectArrivalTimeCountdown">
                    <el-input v-model="form.expectArrivalTimeCountdown" placeholder="期望到货时间倒计时"></el-input>
                </el-form-item>
            </el-form>

            <div slot="footer" class="dialog-footer">
                <el-button @click="fromVisible = false">取 消</el-button>
                <el-button type="primary" @click="save">确 定</el-button>
            </div>
        </el-dialog>

        <el-dialog title="添加采购需求" :visible.sync="fromVisible1" width="40%" :close-on-click-modal="false"
            destroy-on-close>
        </el-dialog>
    </div>
</template>

<script>
import * as XLSX from "xlsx";
import FileSaver from "file-saver";

export default {
    name: "Procurement_needs",
    data() {
        return {
            tableData: [], // 所有的数据
            pageNum: 1, // 当前的页码
            pageSize: 10, // 每页显示的个数
            total: 0,
            sku: null,
            skus: [],
            hasFull: null,
            hasNew: null,
            hasUrgent: null,
            hasFullProcurement: null,
            hasAllItemsArrived: null,
            fromVisible: false,
            fromVisible1: false,
            list: {},
            form: {},
            user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
            rules: {
                sku: [{ required: true, message: "请输入SKU", trigger: "blur" }],
            },
            ids: [],
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now() || time.getTime() < Date.now();
                },
            },
            pickerOptions1: {
                disabledDate(time) {
                    return time.getTime() < Date.now();
                },
            },
            selectedRows: [], // 存储选中的行数据
            exportHeaders: [
                // 自定义导出表头配置
                { field: "inputDate", label: "数据输入日期" },
                { field: "planId", label: "计划编号" },
                { field: "planAuxiliaryId", label: "计划编号辅助列" },
                { field: "sku", label: "SKU" },
                { field: "productName", label: "品名" },
                { field: "attribute", label: "颜色及规格" },
                { field: "expectedArrivalTime", label: "期望到货时间" },
                { field: "factory", label: "工厂" },
                { field: "warehouse", label: "仓库" },
                { field: "shop", label: "店铺" },
                { field: "purchaseVolume", label: "采购量" },
                { field: "cartonNumber", label: "装箱数" },
                { field: "hasFull", label: "是否整箱" },
                { field: "hasNew", label: "是否新增" },
                { field: "hasUrgent", label: "是否加急" },
                { field: "operationRemark", label: "运营备注" },
                { field: "deliveryDateResponse", label: "交期答复1" },
                { field: "deliveryDateResponseFeishu", label: "交期答复2（飞书）" },
                { field: "orderedQuantity", label: "已下单数量" },
                { field: "pendingArrivalQuantity", label: "待到货数量" },
                { field: "receivedQuantity", label: "已到货量" },
                { field: "remainingUnprocuredQuantity", label: "剩余未采购量" },
                { field: "hasFullProcurement", label: "完全采购" },
                { field: "hasAllItemsArrived", label: "全部到货" },
                { field: "purchaseNotes", label: "采购备注" },
                { field: "deliverOrProductTime", label: "交货/生产时长" },
                { field: "expectArrivalTimeCountdown", label: "期望到货时间倒计时" },
                // 可根据需要增删改导出的列
            ],
            disabledFields: ['hasFull'] // 把需要禁用的字段名称添加到这个数组中
        };
    },
    created() {
        this.load(1);
        // this.selectAll();
    },
    async mounted() {
        this.skus = await this.loadSkus();
    },
    methods: {
        handleClick(row) {
            console.log(row);
        },
        handleSelectionChange(rows) {
            // 当前选中的所有的行数据
            this.ids = rows.map((v) => v.id);  // 用于批量删除
            this.selectedRows = rows;  // 用于导出
        },
        getRowKey(row) {
            return row.id;
        },
        handleAdd() {
            // 新增数据
            this.form = {
                sku: "",
                msku: "",
                fnsku: "",
                productName: "",
                attribute: "",
                factory: "",
                cartonsNumber: null,
            }; // 新增数据的时候清空数据
            this.fromVisible = true; // 打开弹窗
        },
        handleEdit(row) {
            // 编辑数据
            this.form = JSON.parse(JSON.stringify(row)); // 给form对象赋值  注意要深拷贝数据
            this.fromVisible = true; // 打开弹窗
        },
        save() {
            // 保存按钮触发的逻辑  它会触发新增或者更新
            this.$refs.formRef.validate((valid) => {
                if (valid) {
                    this.$request({
                        url: this.form.id
                            ? "/procurement-needs/update"
                            : "/procurement-needs/add",
                        method: this.form.id ? "PUT" : "POST",
                        data: this.form,
                    }).then((res) => {
                        if (res.code === "200") {
                            // 表示成功保存
                            this.$message.success("保存成功");
                            this.load(1);
                            this.fromVisible = false;
                        } else {
                            this.$message.error(res.msg); // 弹出错误的信息
                        }
                    });
                }
            });
        },
        del(id) {
            // 单个删除
            this.$confirm("您确定删除吗？", "确认删除", { type: "warning" })
                .then((response) => {
                    this.$request
                        .delete("/procurement-needs/delete/" + id)
                        .then((res) => {
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
        load(pageNum) {
            // 分页查询
            if (pageNum) this.pageNum = pageNum;
            this.$request
                .get("/procurement-needs/selectPage", {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        sku: this.sku,
                        hasFull: this.hasFull,
                        hasNew: this.hasNew,
                        hasUrgent: this.hasUrgent,
                        hasFullProcurement: this.hasFullProcurement,
                        hasAllItemsArrived: this.hasAllItemsArrived,
                    },
                })
                .then((res) => {
                    this.tableData = res.data?.list;
                    this.total = res.data?.total;
                });
        },
        reset() {
            this.sku = null;
            this.hasFull = null;
            this.hasNew = null;
            this.hasUrgent = null;
            this.hasFullProcurement = null;
            this.hasAllItemsArrived = null;
            this.load(1);
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
                        .delete("/procurement-needs/delete/batch", { data: this.ids })
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
        expAll() {
            // 显示自定义加载通知
            const loadingNotification = this.$notify({
                title: '数据导出中',
                message: `
                    <div style="display: flex; align-items: center;">
                        <i class="el-icon-loading" style="margin-right: 10px; font-size: 18px;"></i>
                        正在导出全部数据，请稍候...
                    </div>
                    `,
                duration: 0, // 不自动关闭
                type: 'info',
                dangerouslyUseHTMLString: true // 允许HTML内容
            });

            // 请求所有数据
            this.$request.get("/procurement-needs/selectAll")
                .then(res => {
                    if (res.code === "200") {
                        const allData = res.data || [];
                        this.exportFullData(allData); // 处理导出逻辑
                    } else {
                        this.$message.error(res.msg);
                    }
                })
                .catch(err => {
                    this.$message.error("数据加载失败");
                })
                .finally(() => {
                    setTimeout(() => {
                        loadingNotification.close(); // 关闭通知
                    }, 2000); // 2秒后关闭通知
                });
        },

        exportFullData(allData) {
            // 生成合并配置
            const spanMap = this.generateFullSpanMap(allData);

            // 生成表头和数据
            const data = [this.exportHeaders.map(h => h.label)];
            allData.forEach(row => {
                const rowData = this.exportHeaders.map(h => {
                    return row[h.field] || "";
                });
                data.push(rowData);
            });

            // 创建 Excel
            const worksheet = XLSX.utils.aoa_to_sheet(data);
            const workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "全部采购需求数据");

            // 处理合并区域
            const merges = [];
            const fieldColumns = {};

            // 遍历生成合并指令
            Object.keys(fieldColumns).forEach(field => {
                const col = fieldColumns[field];
                if (col === -1) return;

                let spanStart = 0;
                for (let i = 0; i < allData.length; i++) {
                    if (i === allData.length - 1 || allData[i][field] !== allData[i + 1][field]) {
                        const spanCount = i - spanStart + 1;
                        if (spanCount > 1) {
                            merges.push({
                                s: { r: spanStart + 1, c: col }, // 数据行从第2行开始
                                e: { r: i + 1, c: col }
                            });
                        }
                        spanStart = i + 1;
                    }
                }
            });

            worksheet['!merges'] = merges;

            // 保存文件
            const excelBuffer = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
            const blob = new Blob([excelBuffer], {
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            });
            FileSaver.saveAs(blob, `全部采购需求数据_${new Date().toLocaleDateString()}.xlsx`);

            // 显示导出成功提示
            setTimeout(() => {
                this.$notify({
                    title: "导出成功",
                    message: "全部采购需求数据已成功导出！",
                    type: "success",
                    duration: 2000,
                });
            }, 3000); // 1秒后提示
        },
        // 生成全量数据的合并配置
        generateFullSpanMap(allData) {
            const spanMap = {};
            const mergeFields = [];

            mergeFields.forEach(field => {
                spanMap[field] = [];
                let count = 0;
                allData.forEach((item, index) => {
                    if (index === 0) {
                        spanMap[field].push(1);
                        count = 1;
                    } else {
                        if (item[field] === allData[index - 1][field]) {
                            spanMap[field][index - count] += 1;
                            spanMap[field].push(0);
                            count++;
                        } else {
                            spanMap[field].push(count);
                            count = 1;
                        }
                    }
                });
            });

            return spanMap;
        },

        exp1() {
            // let user = localStorage.getItem("user");
            location.href = "http://localhost:9090/procurement-needs/export";
        },

        exp2() {
            if (this.selectedRows.length === 0) {
                this.$message.warning("请先选择要导出的数据");
                return;
            }

            const loadingNotification = this.$notify({
                title: '数据导出中',
                message: `
                    <div style="display: flex; align-items: center;">
                        <i class="el-icon-loading" style="margin-right: 10px; font-size: 18px;"></i>
                        正在导出选中数据，请稍候...
                    </div>
                `,
                duration: 0, // 不自动关闭
                type: 'info',
                dangerouslyUseHTMLString: true // 允许HTML内容
            });

            // 处理数据格式
            const data = [this.exportHeaders.map((h) => h.label)]; // 表头
            this.selectedRows.forEach((row) => {
                const rowData = this.exportHeaders.map((h) => {
                    // 特殊处理状态标签
                    if (h.field === "hasFull" || h.field === "hasNew" || h.field === "hasUrgent" || h.field === "hasFullProcurement" || h.field === "hasAllItemsArrived") {
                        return this.getStatusLabel(row[h.field]);
                    }
                    return row[h.field] || "";
                });
                data.push(rowData);
            });

            // 创建 workbook工作簿
            const worksheet = XLSX.utils.aoa_to_sheet(data);
            const workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "采购需求数据");

            // 生成文件并保存
            const excelBuffer = XLSX.write(workbook, {
                bookType: "xlsx",
                type: "array",
            });
            const blob = new Blob([excelBuffer], {
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            });

            FileSaver.saveAs(
                blob,
                `采购需求数据_${new Date().toLocaleDateString()}.xlsx`
            );

            setTimeout(() => {
                loadingNotification.close(); // 关闭加载中弹窗
            }, 2000);

            setTimeout(() => {
                this.$notify({
                    title: "导出成功",
                    message: "选中的采购需求数据已成功导出！",
                    type: "success",
                    duration: 2000,
                });
            }, 3000);

            this.$refs.myTable.clearSelection(); // 清空选中
        },

        // 辅助方法：状态转文本
        getStatusLabel(status) {
            const map = {
                是: "是",
                否: "否",
            };
            return map[status] || status;
        },

        // 日期格式化
        formatDate(date) {
            return `${date.getFullYear()}${(date.getMonth() + 1)
                .toString()
                .padStart(2, "0")}${date.getDate().toString().padStart(2, "0")}`;
        },

        successUpload(res) {
            if (res.code === "200") {
                this.$message.success("批量导入成功");
                this.load(1);
            } else {
                this.$message.error(res.msg);
            }
        },
        successUpload1(res) {
            if (res.code === "200") {
                this.$message.success("[ 根据sku匹配 ] 导入成功");
                this.load(1);
            } else {
                this.$message.error(res.msg);
            }
        },
        handleCurrentChange(pageNum) {
            this.load(pageNum);
        },
        selectAll() {
            this.$request.get("/procurement-needs/findAll").then((res) => {
                if (res.code === "200") {
                    this.list = res.data || {};
                } else {
                    this.$message.error(res.msg);
                }
            });
        },
        preview(content) {
            this.content = JSON.parse(content || "[]");
            this.fromVisible = true;
        },
        async loadMatchingData() {
            const sku = this.form.sku;
            // 清空已填充的字段（SKU为空时）
            if (!sku) {
                this.form.productName = "";
                this.form.attribute = "";
                this.form.factory = "";
                this.form.cartonNumber = null;
                return;
            }

            try {
                const res = await this.$request.get("/data-match/selectBySku", {
                    params: { sku },
                });
                console.log("接口响应", res); // 调试用，确认响应结构

                if (res.code === "200" && res.data && res.data) {
                    const data_matching = res.data;
                    // 填充字段
                    this.form.productName = data_matching.productName;
                    this.form.attribute = data_matching.attribute;
                    this.form.factory = data_matching.factory;
                    this.form.cartonNumber = data_matching.cartonsNumber;
                } else {
                    this.$message.warning("未找到该SKU的匹配数据");
                    // 清空可能的错误填充
                    this.form.productName = "";
                    this.form.attribute = "";
                    this.form.factory = "";
                    this.form.cartonNumber = null;
                }
            } catch (error) {
                console.error("请求失败", error);
                this.$message.error("数据匹配失败，请重试");
            }
        },
        async beforeUpload(file) {
            const reader = new FileReader();
            reader.onload = async (e) => {
                // 读取文件内容为 ArrayBuffer
                const data = e.target.result;
                // 使用 XLSX 解析文件
                const workbook = XLSX.read(data, { type: "array" });
                const firstSheetName = workbook.SheetNames[0];
                const worksheet = workbook.Sheets[firstSheetName];
                // 将表格转换为 JSON 数据
                const jsonData = XLSX.utils.sheet_to_json(worksheet);

                for (const row of jsonData) {
                    // Excel 中 SKU 列的表头为 SKU
                    const sku = row.SKU;
                    if (sku) {
                        try {
                            // 获取匹配数据
                            const res = await this.$request.get("/data-match/selectBySku", {
                                params: { sku },
                            });
                            if (res.code === "200" && res.data) {
                                const data_matching = res.data;
                                row.品名 = data_matching.productName;
                                row.颜色及规格 = data_matching.attribute;
                                row.工厂 = data_matching.factory;
                                row.装箱数 = data_matching.cartonsNumber;
                            }
                        } catch (error) {
                            console.error("数据匹配失败", error);
                            this.$message.error("SKU: " + sku + " 匹配失败");
                        }
                    }
                }

                // 生成新的 Excel 文件
                const newWorkbook = XLSX.utils.book_new();
                const newWorksheet = XLSX.utils.json_to_sheet(jsonData);
                XLSX.utils.book_append_sheet(newWorkbook, newWorksheet, "Sheet1");
                const newData = XLSX.write(newWorkbook, {
                    bookType: "xlsx",
                    type: "array",
                });

                // 检查生成的数据是否正确
                console.log("生成的新 Excel 数据:", newData);

                // 创建新文件并上传
                const blob = new Blob([newData], {
                    type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                });
                const newFile = new File([blob], file.name, { type: file.type });

                // 检查生成的新文件是否正确
                console.log("生成的新文件:", newFile);

                const formData = new FormData();
                formData.append("file", newFile);

                // 检查 FormData 内容
                for (let pair of formData.entries()) {
                    console.log(pair[0] + ", " + pair[1]);
                }
            };
            reader.readAsArrayBuffer(file);
            return false; // 阻止默认上传行为
        },
        isFieldDisabled(prop) {
            return this.disabledFields.includes(prop);  // disabledFields 如 ['hasFull']
        },
        querySearch(queryString, cb) {
            const skus = this.skus;
            const results = queryString ? skus.filter(this.createFilter(queryString)) : skus;
            // 调用 callback 返回建议列表的数据
            cb(results || []);
        },
        createFilter(queryString) {
            return (item) => {
                return item.value1.toLowerCase().indexOf(queryString.toLowerCase()) === 0;
            };
        },
        async loadSkus() {
            try {
                const res = await this.$request.get("/procurement-needs/selectAll");
                if (res.code === "200" && res.data) {
                    // 格式化数据：将 sku 映射为 value1，并构造 value2
                    return res.data.map(item => ({
                        value1: item.sku,
                        value2: `${item.factory} - ${item.productName}`, // 示例：YJ - 量勺9件套
                        rawData: item // 保留原始数据（可选）
                    }));
                } else {
                    return [];
                }
            } catch (error) {
                console.error("加载 SKU 失败", error);
                return [];
            }
        },
        handleSelect(item) {
            this.sku = item.value1; // 选择后将 SKU 设置为选中的值
            console.log("选中数据：", item.value1 + "  " + item.value2);
        },
        handleIconClick(ev) {
            console.log(ev);
        }
    },
    directives: {
        disableRadio: {
            inserted(el, binding) {
                const input = el.querySelector('.el-radio__input');
                const originalClick = input?.onclick;

                // 重写点击事件
                input.onclick = function (e) {
                    if (binding.value) {
                        e.preventDefault();
                        e.stopPropagation();
                        return false;
                    }
                    originalClick?.call(this, e);
                };

                // 强制更新样式类（解决动态切换延迟问题）
                const updateClass = () => {
                    el.classList[binding.value ? 'add' : 'remove']('disabled-style');
                };
                updateClass(); // 初始化
                binding.arg = updateClass; // 绑定到更新函数
            },
            updated(el, binding) {
                binding.arg?.(); // 父组件数据更新时触发样式更新
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

/* 使用 ::v-deep 穿透 scoped 样式 */
::v-deep .disabled-style {
    cursor: not-allowed !important;
    /* !important 确保优先级 */
    opacity: 0.7;
    /* 移除 pointer-events 避免影响 cursor 渲染 */
    /* pointer-events: none; */
}

/* 单独控制输入框和标签的指针事件（保留 cursor 样式） */
::v-deep .disabled-style .el-radio__input,
::v-deep .disabled-style .el-radio__label {
    pointer-events: none !important;
    /* 仅阻止交互，不影响视觉 */
}

/* 鼠标悬停时显示手指光标 */
::v-deep .el-autocomplete .el-input__inner {
    cursor: pointer !important;
}

::v-deep .el-autocomplete-suggestion li {
    line-height: normal;
    padding: 7px;
    list-style: none;
    white-space: nowrap;
    text-align: center !important;
}

::v-deep .el-autocomplete-suggestion li:hover {
    background-color: #f5f5f5 !important;
    color: #333 !important;
}

.value1 {
    font-size: 14px !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
}

.value2 {
    font-size: 12px !important;
    color: #b4b4b4 !important;
}

/* 增加样式权重 */
::v-deep .el-autocomplete-suggestion li.loading-more {
  display: flex !important;
  align-items: center;
  justify-content: center;
  height: 40px !important;
}

/* 修复图标动画 */
::v-deep .el-icon-loading {
  animation: rotating 2s linear infinite !important;
  margin-right: 8px;
  font-size: 16px !important;
  color: #409eff !important;
}

@keyframes rotating {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}
</style>