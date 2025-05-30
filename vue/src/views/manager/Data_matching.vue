<template>
  <div>
    <div class="search">
      <!-- <el-input placeholder="请输入SKU" style="width: 200px" v-model="sku"></el-input> -->
      <el-autocomplete popper-class="my-autocomplete" ref="autocomplete" :popper-append-to-body="false" v-model="sku"
        :fetch-suggestions="querySearch" placeholder="请输入/选择SKU" @select="handleSelect"
        @visible-change="handleSuggestVisible" clearable>
        <!-- <i class="el-icon-edit el-input__icon" slot="suffix">
        </i> -->
        <template slot-scope="{ item }">
          <div v-if="item.isLoading" class="loading-more">
            <i class="el-icon-loading"></i> 加载中...
          </div>
          <template v-else>
            <div class="value1">{{ item.value1 }}</div>
            <span class="value2">{{ item.value2 }}</span>
          </template>
        </template>
      </el-autocomplete>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)" class="el-icon-search"> 查询</el-button>
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
      <el-upload action="http://localhost:9090/data-match/import" style="display: inline-block;margin-left: 10px;"
        :on-success="successUpload" :show-file-list="false">
        <el-button size="small" type="info" plain class="el-icon-upload2"> 批量导入</el-button>
      </el-upload>
    </div>

    <div class="table">
      <el-table :data="tableData" border strip @selection-change="handleSelectionChange" :row-key=getRowKey
        ref="myTable">
        <el-table-column type="selection" width="55" align="center" :reserve-selection="true"></el-table-column>
        <!-- <el-table-column prop="id" label="序号" width="70" align="center" sortable></el-table-column> -->
        <el-table-column prop="sku" label="SKU" width="250" sortable></el-table-column>
        <el-table-column prop="msku" label="MSKU" width="250"></el-table-column>
        <el-table-column prop="fnsku" label="FNSKU"></el-table-column>
        <el-table-column prop="productName" label="品名" width="250"></el-table-column>
        <el-table-column prop="attribute" label="属性"></el-table-column>
        <el-table-column prop="factory" label="工厂"></el-table-column>
        <el-table-column prop="cartonsNumber" label="装箱数"></el-table-column>
        <el-table-column label="操作" align="center" width="180">
          <template v-slot="scope">
            <el-button size="mini" type="primary" plain @click="handleEdit(scope.row)" class="el-icon-edit">
              编辑</el-button>
            <el-button size="mini" type="danger" plain @click="del(scope.row.id)" class="el-icon-delete"> 删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination">
        <el-pagination background @current-change="handleCurrentChange" :current-page="pageNum"
          :page-sizes="[5, 10, 20]" :page-size="pageSize" layout="total, prev, pager, next" :total="total">
        </el-pagination>
      </div>
    </div>

    <el-dialog title="编辑匹配数据" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="SKU" prop="sku">
          <el-input v-model="form.sku" placeholder="SKU"></el-input>
        </el-form-item>
        <el-form-item label="MSKU" prop="msku">
          <el-input v-model="form.msku" placeholder="MSKU"></el-input>
        </el-form-item>
        <el-form-item label="FNSKU" prop="fnsku">
          <el-input v-model="form.fnsku" placeholder="FNSKU"></el-input>
        </el-form-item>
        <el-form-item label="品名" prop="productName">
          <el-input v-model="form.productName" placeholder="品名"></el-input>
        </el-form-item>
        <el-form-item label="属性" prop="attribute">
          <el-input v-model="form.attribute" placeholder="属性"></el-input>
        </el-form-item>
        <el-form-item label="工厂" prop="factory">
          <el-input v-model="form.factory" placeholder="属性"></el-input>
        </el-form-item>
        <el-form-item label="装箱数" prop="cartonsNumber">
          <el-input v-model="form.cartonsNumber" placeholder="装箱数"></el-input>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="fromVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import * as XLSX from "xlsx";
import FileSaver from "file-saver";
import _ from 'lodash'

export default {
  name: "Data_Matching",
  data() {
    return {
      tableData: [], // 所有的数据
      pageNum: 1, // 当前的页码
      pageSize: 13, // 每页显示的个数
      total: 0,
      sku: null,
      skus: [], // 用于存储 SKU 数据
      fromVisible: false,
      form: {},
      user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
      rules: {
        sku: [{ required: true, message: "请输入SKU", trigger: "blur" }],
      },
      ids: [],
      selectedRows: [], // 存储选中的行数据
      exportHeaders: [
        { label: "SKU", field: "sku" },
        { label: "MSKU", field: "msku" },
        { label: "FNSKU", field: "fnsku" },
        { label: "品名", field: "productName" },
        { label: "属性", field: "attribute" },
        { label: "工厂", field: "factory" },
        { label: "装箱数", field: "cartonsNumber" },
      ],
      currentPage: 1,
      isLoading: false,
      hasMore: true,
      lastQuery: '',
      scrollHandler: null,
    };
  },
  created() {
    this.load(1);
  },
  async mounted() {
    // this.skus = await this.loadSkus();
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
      this.fromVisible = true; // 打开弹窗
    },
    save() {
      // 保存按钮触发的逻辑  它会触发新增或者更新
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          this.$request({
            url: this.form.id ? "/data-match/update" : "/data-match/add",
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
          this.$request.delete("/data-match/delete/" + id).then((res) => {
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
            .delete("/data-match/delete/batch", { data: this.ids })
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
        .get("/data-match/selectPage", {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            sku: this.sku,
          },
        })
        .then((res) => {
          this.tableData = res.data?.list;
          this.total = res.data?.total;
        });
    },
    reset() {
      this.sku = null;
      this.load(1);
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum);
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
      this.$request.get("/data-match/selectAll")
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
          // 确保弹窗至少显示 1 秒（优化用户体验）
          setTimeout(() => {
            loadingNotification.close(); // 关闭加载中弹窗
          }, 2000);
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
      XLSX.utils.book_append_sheet(workbook, worksheet, "全部匹配数据");

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
      FileSaver.saveAs(blob, `全部匹配数据_${new Date().toLocaleDateString()}.xlsx`);

      // 显示导出成功提示
      setTimeout(() => {
        this.$notify({
          title: "导出成功",
          message: "全部匹配数据已成功导出！",
          type: "success",
          duration: 3000,
        });
      }, 2000);
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
      location.href = 'http://localhost:9090/data-match/export';
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
          return row[h.field] || "";
        });
        data.push(rowData);
      });

      // 创建 workbook工作簿
      const worksheet = XLSX.utils.aoa_to_sheet(data);
      const workbook = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(workbook, worksheet, "数据匹配");

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
        `数据匹配_${new Date().toLocaleDateString()}.xlsx`
      );

      setTimeout(() => {
        loadingNotification.close(); // 关闭加载中弹窗
      }, 2000);

      setTimeout(() => {
        this.$notify({
          title: "导出成功",
          message: "选中的数据匹配已成功导出！",
          type: "success",
          duration: 2000,
        });
      }, 3000);

      this.$refs.myTable.clearSelection(); // 清空选中
    },

    // 日期格式化
    formatDate(date) {
      return `${date.getFullYear()}${(date.getMonth() + 1)
        .toString()
        .padStart(2, "0")}${date.getDate().toString().padStart(2, "0")}`;
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
    // 新增 visible-change 处理
    handleSuggestVisible(visible) {
      if (visible) {
        console.log('%c👀 下拉框显示', 'color: #2196F3');
        setTimeout(() => {
          this.bindScrollListener();
          console.log('%c⏰ 延迟后绑定滚动', 'color: #FF9800');
        }, 300);
      } else {
        console.log('%c👋 下拉框隐藏', 'color: #9E9E9E');
        this.removeScrollListener();
      }
    },
    async querySearch(queryString, cb) {
      try {
        console.log('%c🚀 开始搜索查询', 'color: #4CAF50; font-weight: bold');
        console.log('📌 当前参数:', {
          query: queryString,
          page: this.currentPage,
          hasMore: this.hasMore,
          loading: this.isLoading
        });

        const currentSearch = (queryString || '').trim();

        // 搜索条件变化时重置
        if (this.lastQuery !== currentSearch) {
          console.log('%c🔄 搜索词变化', 'color: #FF9800', {
            old: this.lastQuery,
            new: currentSearch
          });
          this.currentPage = 1;
          this.skus = [];
          this.hasMore = true;
          this.lastQuery = currentSearch;
        }

        if (this.isLoading) {
          console.log('%c⏸ 正在加载中，跳过请求', 'color: #9E9E9E');
          return cb(this.skus);
        }
        if (!this.hasMore) {
          console.log('%c⏹ 没有更多数据', 'color: #F44336');
          return cb(this.skus);
        }

        this.isLoading = true;
        console.log('%c⏳ 发起请求', 'color: #2196F3', {
          page: this.currentPage,
          size: this.pageSize
        });

        // 添加加载提示（第二页开始）
        if (this.currentPage > 1) {
          console.log('➕ 添加加载提示项');
          this.skus = [...this.skus, { isLoading: true }];
          cb(this.skus);
          await this.$nextTick();
        }

        const res = await this.$request.get("/data-match/selectPage", {
          params: {
            sku: currentSearch,
            pageNum: this.currentPage,
            pageSize: this.pageSize,
            _t: Date.now()
          }
        });

        console.log('%c✅ 收到响应', 'color: #4CAF50', {
          code: res.code,
          count: res.data?.list?.length || 0,
          total: res.data?.total || 0
        });

        if (res.code === "200" && res.data) {
          const newData = res.data.list
            .filter(item => item?.sku)
            .map(item => ({
              value1: item.sku,
              value2: `${item.factory} - ${item.productName}`,
              rawData: item
            }));

          console.log('🔄 合并数据', {
            before: this.skus.length,
            new: newData.length
          });

          this.skus = [
            ...this.skus.filter(item => !item.isLoading),
            ...newData
          ];

          this.hasMore = this.currentPage * this.pageSize < res.data.total;
          this.currentPage++;

          console.log('%c🆕 更新后状态', 'color: #009688', {
            page: this.currentPage,
            hasMore: this.hasMore,
            totalItems: this.skus.length
          });
        }

        cb(this.skus);
      } catch (error) {
        console.error('%c❌ 请求失败', 'color: #F44336; font-weight: bold', error);
        cb([]);
      } finally {
        setTimeout(() => {
          this.isLoading = false;
          this.skus = this.skus.filter(item => !item.isLoading);
          console.log('%c🔄 清理加载状态', 'color: #9C27B0', {
            isLoading: this.isLoading,
            items: this.skus.length
          });
          console.log('-----------------------------------');
        }, 300);
      }
    },
    // 绑定滚动监听
    bindScrollListener() {
      this.removeScrollListener();
      console.log('%c🎯 开始绑定滚动监听', 'color: #3F51B5');

      this.$nextTick(() => {
        this.$nextTick(() => {
          const container = this.getScrollContainer();
          if (!container) {
            console.error('%c⚠️ 未找到滚动容器', 'color: #FF9800');
            return;
          }

          console.log('%c🔍 找到滚动容器', 'color: #4CAF50', {
            scrollHeight: container.scrollHeight,
            clientHeight: container.clientHeight
          });

          this.scrollHandler = _.throttle(() => {
            const { scrollTop, scrollHeight, clientHeight } = container;
            const remaining = scrollHeight - (scrollTop + clientHeight);

            console.group('%c🖱 滚动事件', 'color: #00BCD4');
            console.log('📏 滚动位置:', { scrollTop, clientHeight, scrollHeight, remaining });

            if (remaining < 50 && this.hasMore && !this.isLoading) {
              console.log('%c🚀 触发滚动加载', 'color: #FF5722');
              this.querySearch(this.lastQuery);
            }
            console.groupEnd();
          }, 200);

          container.addEventListener('scroll', this.scrollHandler);
          console.log('%c🔗 滚动监听已绑定', 'color: #4CAF50');

          // 主动触发初始检查
          this.scrollHandler();
        });
      });
    },
    // 获取滚动容器
    getScrollContainer() {
      const container = this.$refs.autocomplete?.$el
        ?.querySelector('.el-autocomplete-suggestion__wrap')
        ?.querySelector('.el-scrollbar__wrap');

      console.log('%c🔍 查询滚动容器', 'color: #9C27B0', {
        exist: !!container,
        refs: !!this.$refs.autocomplete
      });

      return container;
    },
    // 移除旧监听
    removeScrollListener() {
      const container = this.getScrollContainer();
      if (container && this.scrollHandler) {
        console.log('%c🗑 移除滚动监听', 'color: #795548');
        container.removeEventListener('scroll', this.scrollHandler);
      }
    },
    // 防抖滚动处理（新增 debug 日志）
    handleScroll: _.debounce(function (e) {
      const list = e.target;
      if (!list) return;

      const { scrollTop, scrollHeight, clientHeight } = list;
      console.log('[Scroll Debug]', {
        scrollTop,
        scrollHeight,
        clientHeight,
        threshold: scrollHeight - (scrollTop + clientHeight)
      });

      // 滚动到底部阈值 30px 时加载
      if (scrollHeight - (scrollTop + clientHeight) < 30) {
        if (this.hasMore && !this.isLoading) {
          console.log('[Load Next Page]', this.currentPage + 1);
          this.currentPage++;
          this.querySearch(this.lastQuery);
        }
      }
    }, 200),
    // 组件销毁时清理
    beforeDestroy() {
      this.removeScrollListener()
    },
    createFilter(queryString) {
      return (item) => {
        return item.value1.toLowerCase().indexOf(queryString.toLowerCase()) === 0;
      };
    },
    async loadSkus() {
      try {
        const res = await this.$request.get("/data-match/selectAll");
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
    },
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

/* 鼠标悬停时显示手指光标 */
::v-deep .el-autocomplete .el-input__inner {
  cursor: pointer !important;
}

::v-deep .el-autocomplete-suggestion li {
  line-height: normal;
  padding: 7px;
  text-align: center !important;
}

::v-deep .el-autocomplete-suggestion li:hover {
  background-color: #f5f5f5 !important;
  color: #333 !important;
}

::v-deep .value1 {
  font-size: 14px !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
}

::v-deep .value2 {
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