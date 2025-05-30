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
            <el-upload action="http://localhost:9090/purchase-order/import"
                style="display: inline-block; margin-left: 10px" :on-success="successUpload" :show-file-list="false">
                <el-button size="small" type="info" plain class="el-icon-upload2"> 批量导入</el-button>
            </el-upload>
        </div>

        <div class="table">
            <el-table :data="tableData" border style="width: 100%" strip @selection-change="handleSelectionChange"
                :row-key="getRowKey" :span-method="spanMethod" ref="myTable">
                <el-table-column type="selection" width="55" align="center" :reserve-selection="true"></el-table-column>
                <!-- <el-table-column fixed prop="id" label="id" width="70" sortable>
                </el-table-column> -->
                <el-table-column fixed prop="amPlanId" label="AM计划号" width="150" sortable>
                </el-table-column>
                <el-table-column prop="auxiliaryColumn" label="辅助列" width="400">
                </el-table-column>
                <el-table-column prop="purchaseOrderId" label="采购单号" width="120">
                </el-table-column>
                <el-table-column prop="procurementStatus" label="采购状态" width="100">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.procurementStatus === '已完成'">已完成</el-tag>
                        <el-tag type="info" v-else-if="scope.row.procurementStatus === '待提交'">待提交</el-tag>
                        <el-tag type="danger" v-else-if="scope.row.procurementStatus === '待审批'">待审批</el-tag>
                        <el-tag type="warning" v-else-if="scope.row.procurementStatus === '待到货'">待到货</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="purchasingWarehouse" label="采购仓库" width="100">
                </el-table-column>
                <el-table-column prop="productDimension" label="产品维度" width="150">
                </el-table-column>
                <el-table-column prop="planId" label="计划编号" width="120">
                </el-table-column>
                <el-table-column prop="productName" label="品名" width="200">
                </el-table-column>
                <el-table-column prop="sku" label="SKU" width="200"> </el-table-column>
                <el-table-column prop="shop" label="店铺" width="200">
                </el-table-column>
                <el-table-column prop="procurementVolume" label="采购量" width="100">
                </el-table-column>
                <el-table-column prop="amTrackId" label="AM单号" width="120">
                </el-table-column>
                <el-table-column prop="procurementWarehouseDetails" label="采购仓库（明细）" width="150">
                </el-table-column>
                <el-table-column prop="pendingArrivalQuantity" label="待到货量" width="100">
                </el-table-column>
                <el-table-column prop="expectedDeliveryTime" label="预计到货时间" width="120">
                </el-table-column>
                <el-table-column prop="arrivalQuantity" label="到货量" width="100">
                </el-table-column>
                <el-table-column prop="auxiliaryColumn1" label="辅助列" width="300">
                </el-table-column>
                <el-table-column prop="finalPurchaseOrderId" label="最终采购单号" width="300">
                </el-table-column>
                <el-table-column prop="newArrivalsQuantity" label="新到货数量" width="120">
                </el-table-column>
                <el-table-column prop="actualTotalArrivalQuantity" label="实际总到货量" width="120">
                </el-table-column>
                <el-table-column prop="notes" label="备注" width="150" show-overflow-tooltip>
                </el-table-column>
                <el-table-column fixed="right" label="操作" width="120">
                    <template slot-scope="scope">
                        <!-- <el-button @click="handleEdit(scope.row)" type="text" size="small">编辑</el-button> -->
                        <el-button @click="preview(scope.row)" type="text" size="small"
                            class="el-icon-circle-plus-outline"> 查看</el-button>
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

        <!-- 编辑对话框 -->
        <el-dialog title="编辑采购单" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
            <el-form :model="form" label-width="140px" style="padding-right: 50px" :rules="rules" ref="formRef">
                <el-form-item label="AM计划号" prop="amPlanId">
                    <el-input v-model="form.amPlanId" placeholder="AM计划号"></el-input>
                </el-form-item>
                <el-form-item label="辅助列" prop="auxiliaryColumn">
                    <el-input v-model="form.auxiliaryColumn" placeholder="辅助列"></el-input>
                </el-form-item>
                <el-form-item label="采购单号" prop="purchaseOrderId">
                    <el-input v-model="form.purchaseOrderId" placeholder="采购单号"></el-input>
                </el-form-item>
                <el-form-item label="采购状态" prop="procurementStatus">
                    <el-radio-group v-model="form.procurementStatus">
                        <el-radio :label="'已完成'" border style="padding-right: 10px">已完成</el-radio>
                        <el-radio :label="'待提交'" border>待提交</el-radio>
                        <el-radio :label="'待审批'" border>待审批</el-radio>
                        <el-radio :label="'待到货'" border>待到货</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="采购仓库" prop="purchasingWarehouse">
                    <el-input v-model="form.purchasingWarehouse" placeholder="采购仓库"></el-input>
                </el-form-item>
                <el-form-item label="产品维度" prop="productDimension">
                    <el-input v-model="form.productDimension" placeholder="产品维度"></el-input>
                </el-form-item>
                <el-form-item label="计划编号" prop="planId">
                    <el-input v-model="form.planId" placeholder="计划编号"></el-input>
                </el-form-item>
                <el-form-item label="品名" prop="productName">
                    <el-input v-model="form.productName" placeholder="品名"></el-input>
                </el-form-item>
                <el-form-item label="SKU" prop="sku">
                    <el-input v-model="form.sku" placeholder="SKU"></el-input>
                </el-form-item>
                <el-form-item label="店铺" prop="shop">
                    <el-input v-model="form.shop" placeholder="店铺"></el-input>
                </el-form-item>
                <el-form-item label="采购量" prop="procurementVolume">
                    <el-input v-model="form.procurementVolume" placeholder="采购量"></el-input>
                </el-form-item>
                <el-form-item label="AM单号" prop="amTrackId">
                    <el-input v-model="form.amTrackId" placeholder="AM单号"></el-input>
                </el-form-item>
                <el-form-item label="采购仓库（明细）" prop="procurementWarehouseDetails">
                    <el-input v-model="form.procurementWarehouseDetails" placeholder="采购仓库（明细）"></el-input>
                </el-form-item>
                <el-form-item label="待到货量" prop="pendingArrivalQuantity">
                    <el-input v-model="form.pendingArrivalQuantity" placeholder="待到货量"></el-input>
                </el-form-item>
                <el-form-item label="预计到货时间" prop="expectedDeliveryTime">
                    <el-date-picker v-model="form.expectedDeliveryTime" type="date" placeholder="预计到货时间"
                        :picker-options="pickerOptions" format="yyyy 年 MM 月 dd 日"
                        value-format="yyyy-MM-dd"></el-date-picker>
                </el-form-item>
                <el-form-item label="到货量" prop="arrivalQuantity">
                    <el-input v-model="form.arrivalQuantity" placeholder="到货量"></el-input>
                </el-form-item>
                <el-form-item label="辅助列" prop="auxiliaryColumn1">
                    <el-input v-model="form.auxiliaryColumn1" placeholder="辅助列"></el-input>
                </el-form-item>
                <el-form-item label="最终采购单号" prop="finalPurchaseOrderId">
                    <el-input v-model="form.finalPurchaseOrderId" placeholder="最终采购单号"></el-input>
                </el-form-item>
                <el-form-item label="新到货数量" prop="newArrivalsQuantity">
                    <el-input v-model="form.newArrivalsQuantity" placeholder="新到货数量"></el-input>
                </el-form-item>
                <el-form-item label="实际总到货量" prop="actualTotalArrivalQuantity">
                    <el-input v-model="form.actualTotalArrivalQuantity" placeholder="实际总到货量"></el-input>
                </el-form-item>
                <el-form-item label="备注" prop="notes">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.notes"
                        placeholder="备注"></el-input>
                </el-form-item>
            </el-form>

            <div slot="footer" class="dialog-footer">
                <el-button @click="fromVisible = false">取 消</el-button>
                <el-button type="primary" @click="save">确 定</el-button>
            </div>
        </el-dialog>

        <!-- 查看对话框 -->
        <el-dialog title="采购单" :visible.sync="fromVisible1" width="40%" :close-on-click-modal="false" destroy-on-close>
            <el-form :model="form" label-width="140px" style="padding-right: 50px" :rules="rules" ref="formRef">
                <el-form-item label="AM计划号" prop="amPlanId">
                    <el-input v-model="form.amPlanId" placeholder="AM计划号" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="辅助列" prop="auxiliaryColumn">
                    <el-input v-model="form.auxiliaryColumn" placeholder="辅助列" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="采购单号" prop="purchaseOrderId">
                    <el-input v-model="form.purchaseOrderId" placeholder="采购单号" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="采购状态" prop="procurementStatus">
                    <!-- class="no-disabled-style" :disabled="isReadOnly" -->
                    <el-radio-group v-model="form.procurementStatus" @click.native.prevent="handleRadioClick">
                        <el-radio :label="'已完成'" border style="padding-right: 10px">已完成</el-radio>
                        <el-radio :label="'待提交'" border>待提交</el-radio>
                        <el-radio :label="'待审批'" border>待审批</el-radio>
                        <el-radio :label="'待到货'" border>待到货</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="采购仓库" prop="purchasingWarehouse">
                    <el-input v-model="form.purchasingWarehouse" placeholder="采购仓库" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="产品维度" prop="productDimension">
                    <el-input v-model="form.productDimension" placeholder="产品维度" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="计划编号" prop="planId">
                    <el-input v-model="form.planId" placeholder="计划编号" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="品名" prop="productName">
                    <el-input v-model="form.productName" placeholder="品名" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="SKU" prop="sku">
                    <el-input v-model="form.sku" placeholder="SKU" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="店铺" prop="shop">
                    <el-input v-model="form.shop" placeholder="店铺" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="采购量" prop="procurementVolume">
                    <el-input v-model="form.procurementVolume" placeholder="采购量" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="AM单号" prop="amTrackId">
                    <el-input v-model="form.amTrackId" placeholder="AM单号" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="采购仓库（明细）" prop="procurementWarehouseDetails">
                    <el-input v-model="form.procurementWarehouseDetails" placeholder="采购仓库（明细）"
                        :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="待到货量" prop="pendingArrivalQuantity">
                    <el-input v-model="form.pendingArrivalQuantity" placeholder="待到货量"
                        :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="预计到货时间" prop="expectedDeliveryTime">
                    <el-date-picker v-model="form.expectedDeliveryTime" type="date" placeholder="预计到货时间"
                        :picker-options="pickerOptions" format="yyyy 年 MM 月 dd 日" value-format="yyyy-MM-dd"
                        :readonly="isReadOnly"></el-date-picker>
                </el-form-item>
                <el-form-item label="到货量" prop="arrivalQuantity">
                    <el-input v-model="form.arrivalQuantity" placeholder="到货量" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="辅助列" prop="auxiliaryColumn1">
                    <el-input v-model="form.auxiliaryColumn1" placeholder="辅助列" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="最终采购单号" prop="finalPurchaseOrderId">
                    <el-input v-model="form.finalPurchaseOrderId" placeholder="最终采购单号"
                        :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="新到货数量" prop="newArrivalsQuantity">
                    <el-input v-model="form.newArrivalsQuantity" placeholder="新到货数量" :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="实际总到货量" prop="actualTotalArrivalQuantity">
                    <el-input v-model="form.actualTotalArrivalQuantity" placeholder="实际总到货量"
                        :readonly="isReadOnly"></el-input>
                </el-form-item>
                <el-form-item label="备注" prop="notes">
                    <el-input type="textarea" maxlength="200" show-word-limit v-model="form.notes" placeholder="备注"
                        :readonly="isReadOnly"></el-input>
                </el-form-item>
            </el-form>

            <div slot="footer" class="dialog-footer">
                <el-button @click="fromVisible1 = false">退 出</el-button>
                <!-- <el-button type="primary" @click="save">确 定</el-button> -->
            </div>
        </el-dialog>
    </div>
</template>

<script>
import FileSaver from "file-saver";
import * as XLSX from "xlsx";

export default {
    name: "Procurement_needs",
    data() {
        return {
            tableData: [], // 所有的数据
            pageNum: 1, // 当前的页码
            pageSize: 12, // 每页显示的个数
            total: 0,
            sku: null,
            skus: [],
            fromVisible: false,
            fromVisible1: false,
            list: {},
            form: {},
            user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
            rules: {
                // sku: [{ required: true, message: "请输入SKU", trigger: "blur" }],
            },
            ids: [],
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() < Date.now();
                },
            },
            spanMap: {}, // 合并配置缓存
            selectedRows: [], // 存储选中的行数据
            exportHeaders: [
                // 自定义导出表头配置
                { field: "amPlanId", label: "AM计划号" },
                { field: "auxiliaryColumn", label: "辅助列" },
                { field: "purchaseOrderId", label: "采购单号" },
                { field: "procurementStatus", label: "采购状态" },
                { field: "purchasingWarehouse", label: "采购仓库" },
                { field: "productDimension", label: "产品维度" },
                { field: "planId", label: "计划编号" },
                { field: "productName", label: "品名" },
                { field: "sku", label: "SKU" },
                { field: "shop", label: "店铺" },
                { field: "procurementVolume", label: "采购量" },
                { field: "amTrackId", label: "AM单号" },
                { field: "procurementWarehouseDetails", label: "采购仓库（明细）" },
                { field: "pendingArrivalQuantity", label: "待到货量" },
                { field: "expectedDeliveryTime", label: "预计到货时间" },
                { field: "arrivalQuantity", label: "到货量" },
                { field: "auxiliaryColumn1", label: "辅助列" },
                { field: "finalPurchaseOrderId", label: "最终采购单号" },
                { field: "newArrivalsQuantity", label: "新到货数量" },
                { field: "actualTotalArrivalQuantity", label: "实际总到货量" },
                { field: "notes", label: "备注" },
                // 可根据需要增删改导出的列
            ],
            isReadOnly: true,
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
            this.ids = rows.map((v) => v.id); // 用于批量删除
            this.load(1);
            this.selectedRows = rows; // 用于导出
        },
        getRowKey(row) {
            return row.id;
        },
        handleAdd() {
            // 新增数据
            this.form = {}; // 新增数据的时候清空数据
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
                            ? "/purchase-order/update"
                            : "/purchase-order/add",
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
                    this.$request.delete("/purchase-order/delete/" + id).then((res) => {
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
                .get("/purchase-order/selectPage", {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        sku: this.sku,
                    },
                })
                .then((res) => {
                    this.tableData = res.data?.list;
                    this.generateSpanMap(); // 数据更新后重新计算合并
                    this.total = res.data?.total;
                });
        },
        reset() {
            this.sku = null;
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
                        .delete("/purchase-order/delete/batch", { data: this.ids })
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
            this.$request.get("/purchase-order/findAll")
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
                        loadingNotification.close(); // 关闭加载通知
                    }, 2000); // 2秒后关闭
                });
        },

        exportFullData(allData) {
            // 生成合并配置
            const spanMap = this.generateFullSpanMap(allData);

            // 生成表头和数据
            const data = [this.exportHeaders.map(h => h.label)];
            allData.forEach(row => {
                const rowData = this.exportHeaders.map(h => {
                    if (h.field === "procurementStatus") {
                        return this.getStatusLabel(row[h.field]);
                    }
                    return row[h.field] || "";
                });
                data.push(rowData);
            });

            // 创建 Excel
            const worksheet = XLSX.utils.aoa_to_sheet(data);
            const workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "全部采购单数据");

            // 处理合并区域
            const merges = [];
            const fieldColumns = {
                purchaseOrderId: this.exportHeaders.findIndex(h => h.field === 'purchaseOrderId'),
                procurementStatus: this.exportHeaders.findIndex(h => h.field === 'procurementStatus'),
                purchasingWarehouse: this.exportHeaders.findIndex(h => h.field === 'purchasingWarehouse'),
            };

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
            FileSaver.saveAs(blob, `全部采购单数据_${new Date().toLocaleDateString()}.xlsx`);

            // 显示导出成功提示
            setTimeout(() => {
                this.$notify({
                    title: "导出成功",
                    message: "全部采购单数据已成功导出！",
                    type: "success",
                    duration: 2000,
                });
            }, 3000);
        },
        // 生成全量数据的合并配置
        generateFullSpanMap(allData) {
            const spanMap = {};
            const mergeFields = ["purchaseOrderId", "procurementStatus", "purchasingWarehouse"];

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
            location.href = "http://localhost:9090/purchase-order/export";
        },
        // exp2() {
        //     if (this.selectedRows.length === 0) {
        //         this.$message.warning("请先选择要导出的数据");
        //         return;
        //     }

        //     // 处理数据格式
        //     const data = [this.exportHeaders.map((h) => h.label)]; // 表头
        //     this.selectedRows.forEach((row) => {
        //         const rowData = this.exportHeaders.map((h) => {
        //             // 特殊处理状态标签
        //             if (h.field === "procurementStatus") {
        //                 return this.getStatusLabel(row[h.field]);
        //             }
        //             return row[h.field] || "";
        //         });
        //         data.push(rowData);
        //     });

        //     // 创建 workbook工作簿
        //     const worksheet = XLSX.utils.aoa_to_sheet(data);
        //     const workbook = XLSX.utils.book_new();
        //     XLSX.utils.book_append_sheet(workbook, worksheet, "采购单数据");

        //     // 生成文件并保存
        //     const excelBuffer = XLSX.write(workbook, {
        //         bookType: "xlsx",
        //         type: "array",
        //     });
        //     const blob = new Blob([excelBuffer], {
        //         type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        //     });

        //     FileSaver.saveAs(
        //         blob,
        //         `采购单数据_${new Date().toLocaleDateString()}.xlsx`
        //     );

        //     this.$refs.myTable.clearSelection(); // 清空选中
        // },

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

            // 对选中的行按原tableData中的顺序排序，基于id
            const selectedRowsSorted = this.selectedRows.slice().sort((a, b) => {
                const indexA = this.tableData.findIndex(row => row.id === a.id);
                const indexB = this.tableData.findIndex(row => row.id === b.id);
                return indexA - indexB;
            });

            // 处理数据格式
            const data = [this.exportHeaders.map((h) => h.label)]; // 表头
            selectedRowsSorted.forEach((row) => {
                const rowData = this.exportHeaders.map((h) => {
                    if (h.field === "procurementStatus") {
                        return this.getStatusLabel(row[h.field]);
                    }
                    return row[h.field] || "";
                });
                data.push(rowData);
            });

            // 创建 workbook工作簿
            const worksheet = XLSX.utils.aoa_to_sheet(data);
            const workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "采购单数据");

            // 处理合并区域
            const merges = [];
            const fieldColumns = {
                purchaseOrderId: this.exportHeaders.findIndex(h => h.field === 'purchaseOrderId'),
                procurementStatus: this.exportHeaders.findIndex(h => h.field === 'procurementStatus'),
                purchasingWarehouse: this.exportHeaders.findIndex(h => h.field === 'purchasingWarehouse'),
            };

            Object.keys(fieldColumns).forEach(field => {
                const col = fieldColumns[field];
                if (col === -1) return; // 如果列不存在，跳过

                for (let i = 0; i < this.tableData.length; i++) {
                    const currentRow = this.tableData[i];
                    const isSelected = selectedRowsSorted.some(row => row.id === currentRow.id);
                    if (isSelected) {
                        const spanValue = this.spanMap[field][i];
                        if (spanValue > 0) {
                            // 检查从i到i + spanValue -1 是否都被选中
                            let allSelected = true;
                            for (let j = i; j < i + spanValue; j++) {
                                if (j >= this.tableData.length || !selectedRowsSorted.some(row => row.id === this.tableData[j].id)) {
                                    allSelected = false;
                                    break;
                                }
                            }
                            if (allSelected) {
                                const startIndexInExport = selectedRowsSorted.findIndex(row => row.id === currentRow.id);
                                const endRowInExport = startIndexInExport + spanValue;
                                merges.push({
                                    s: { r: startIndexInExport + 1, c: col }, // 数据行从1开始（表头占0行）
                                    e: { r: endRowInExport, c: col }
                                });
                            }
                        }
                    }
                }
            });

            // 应用合并区域到worksheet
            worksheet['!merges'] = merges;

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
                `采购单数据_${new Date().toLocaleDateString()}.xlsx`
            );

            setTimeout(() => {
                loadingNotification.close(); // 关闭加载中弹窗
            }, 2000);

            setTimeout(() => {
                this.$notify({
                    title: "导出成功",
                    message: "选中的采购单数据已成功导出！",
                    type: "success",
                    duration: 2000,
                });
            }, 3000);

            this.$refs.myTable.clearSelection(); // 清空选中
        },

        // 辅助方法：状态转文本
        getStatusLabel(status) {
            const map = {
                已完成: "已完成",
                待提交: "待提交",
                待审批: "待审批",
                待到货: "待到货",
            };
            return map[status] || status;
        },

        // 日期格式化
        formatDate(date) {
            return `${date.getFullYear()}${(date.getMonth() + 1)
                .toString()
                .padStart(2, "0")}${date.getDate().toString().padStart(2, "0")}`;
        },

        // 合并单元格计算方法
        spanMethod({ row, column, rowIndex, columnIndex }) {
            if (
                [
                    "purchaseOrderId",
                    "procurementStatus",
                    "purchasingWarehouse",
                ].includes(column.property)
            ) {
                return this.getSpan(rowIndex, column.property);
            }
        },

        // 生成合并配置
        // generateSpanMap() {
        //     const spanMap = {};
        //     const mergeFields = [
        //         "purchaseOrderId",
        //         "procurementStatus",
        //         "purchasingWarehouse",
        //     ];

        //     mergeFields.forEach((field) => {
        //         spanMap[field] = [];
        //         let count = 0;
        //         this.tableData.forEach((item, index) => {
        //             if (index === 0) {
        //                 spanMap[field].push(1);
        //                 count = 1;
        //             } else {
        //                 if (item[field] === this.tableData[index - 1][field]) {
        //                     spanMap[field][index - count] += 1;
        //                     spanMap[field].push(0);
        //                     count++;
        //                 } else {
        //                     spanMap[field].push(count);
        //                     count = 1;
        //                 }
        //             }
        //         });
        //     });
        //     this.spanMap = spanMap;
        // },

        generateSpanMap() {
            // 防御性检查：确保 tableData 是有效的数组
            if (!Array.isArray(this.tableData)) {
                console.error("tableData 不是数组:", this.tableData);
                return;
            }

            const spanMap = {};
            const mergeFields = [
                "purchaseOrderId",
                "procurementStatus",
                "purchasingWarehouse",
            ];

            mergeFields.forEach((field) => {
                spanMap[field] = [];
                let count = 0;
                this.tableData.forEach((item, index) => {
                    if (index === 0) {
                        spanMap[field].push(1);
                        count = 1;
                    } else {
                        if (item[field] === this.tableData[index - 1][field]) {
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

            this.spanMap = spanMap;
        },

        // 获取合并配置
        getSpan(rowIndex, field) {
            const spanArr = this.spanMap[field] || [];
            if (spanArr[rowIndex] > 0) {
                return { rowspan: spanArr[rowIndex], colspan: 1 };
            } else {
                return { rowspan: 0, colspan: 0 };
            }
        },

        successUpload(res) {
            if (res.code === "200") {
                this.$message.success("批量导入成功");
                this.load(1);
            } else {
                this.$message.error(res.msg);
            }
        },
        handleCurrentChange(pageNum) {
            this.load(pageNum);
        },
        selectAll() {
            this.$request.get("/purchase-order/findAll").then((res) => {
                if (res.code === "200") {
                    this.list = res.data || {};
                } else {
                    this.$message.error(res.msg);
                }
            });
        },
        preview(row) {
            this.form = row;
            this.fromVisible1 = true;
        },
        // 拦截点击事件
        handleRadioClick(e) {
            if (this.isReadOnly) {
                e.preventDefault(); // 阻止默认行为
                e.stopPropagation(); // 阻止事件冒泡
            }
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
                const res = await this.$request.get("/purchase-order/selectAll");
                if (res.code === "200" && res.data) {
                    // 格式化数据：将 sku 映射为 value1，并构造 value2
                    return res.data.map(item => ({
                        value1: item.sku,
                        value2: `${item.productName}`, // 示例：${item.procurementWarehouseDetails} - ${item.productName} 公司仓 - 量勺9件套
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
};
</script>

<style scoped>
.export-tip {
    color: #666;
    font-size: 12px;
    margin-left: 5px;
    font-weight: bold;
}

.export-tip:hover {
    color: #ffffff;
    cursor: pointer;
}

/* 覆盖禁用状态样式 */
.no-disabled-style :deep(.el-radio.is-disabled) {
    opacity: 1;
    /* 保持不透明 */
    cursor: not-allowed;
    /* 鼠标显示禁用图标 */
}

.no-disabled-style :deep(.el-radio.is-disabled .el-radio__input) {
    cursor: not-allowed;
}

.no-disabled-style :deep(.el-radio.is-disabled .el-radio__label) {
    color: inherit;
    /* 保持原有文字颜色 */
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
