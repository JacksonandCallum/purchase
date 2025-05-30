<template>
    <div>
        <div class="search">
            <el-autocomplete popper-class="my-autocomplete" ref="autocomplete" :popper-append-to-body="false"
                v-model="bindEmail" :fetch-suggestions="querySearch" placeholder="请输入/选择邮箱" @select="handleSelect"
                @visible-change="handleSuggestVisible" clearable>
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
            <el-button type="info" plain style="margin-left: 10px" @click="load(1)" class="el-icon-search">
                查询</el-button>
            <el-button type="warning" plain style="margin-left: 10px" @click="reset" class="el-icon-refresh-left">
                重置</el-button>
        </div>

        <div class="operation">
            <div style="font-weight: bold;font-style: italic; color: #409eff;margin-left: 10px;">
                邀请码的最大使用次数：默认有且只有<div class="pulse-text">1</div>次使用机会
            </div>
        </div>

        <div class="table">
            <el-table :data="tableData" border strip>
                <!-- <el-table-column prop="id" label="序号" width="70" align="center" sortable></el-table-column> -->
                <el-table-column prop="code" label="邀请码" sortable></el-table-column>
                <el-table-column prop="generator" label="生成器">
                    <template slot-scope="scope">
                        <el-tag type="infp" v-if="scope.row.generator === 'SYSTEM'">系统</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="status" label="状态">
                    <template slot-scope="scope">
                        <el-tag type="infp" v-if="scope.row.status === 0">未使用</el-tag>
                        <el-tag type="danger" v-else-if="scope.row.status === 1">已使用</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="createTime" label="生成时间" :formatter="formatDate"></el-table-column>
                <el-table-column prop="expireTime" label="过期时间" :formatter="formatDate"></el-table-column>
                <el-table-column prop="useCount" label="最大使用次数"></el-table-column>
                <el-table-column prop="usedCount" label="已使用次数"></el-table-column>
                <el-table-column prop="userType" label="允许注册的用户类型">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.userType === 'ADMIN'">管理员</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="bindEmail" label="绑定邮箱"></el-table-column>
            </el-table>

            <div class="pagination">
                <el-pagination background @current-change="handleCurrentChange" :current-page="pageNum"
                    :page-sizes="[5, 10, 20]" :page-size="pageSize" layout="total, prev, pager, next" :total="total">
                </el-pagination>
            </div>
        </div>

    </div>
</template>

<script>
import * as XLSX from "xlsx";
import FileSaver from "file-saver";
import _ from 'lodash'

import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';       // 必须引入 utc 插件
import timezone from 'dayjs/plugin/timezone';

dayjs.extend(utc);
dayjs.extend(timezone);
dayjs.tz.setDefault('Asia/Shanghai');

export default {
    name: "InviteCode",
    data() {
        return {
            tableData: [], // 所有的数据
            pageNum: 1, // 当前的页码
            pageSize: 10, // 每页显示的个数
            total: 0,
            bindEmail: null,
            bindEmails: [], // 用于存储 bindEmail 数据
            fromVisible: false,
            form: {},
            user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
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
    methods: {
        formatDate(row, column, cellValue) {
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
        },
        load(pageNum) {
            // 分页查询
            if (pageNum) this.pageNum = pageNum;
            this.$request
                .get("/invite-code/selectPage", {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        bindEmail: this.bindEmail,
                    },
                })
                .then((res) => {
                    this.tableData = res.data?.list;
                    this.total = res.data?.total;
                });
        },
        reset() {
            this.bindEmail = null;
            this.load(1);
        },
        handleCurrentChange(pageNum) {
            this.load(pageNum);
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
                    this.bindEmails = [];
                    this.hasMore = true;
                    this.lastQuery = currentSearch;
                }

                if (this.isLoading) {
                    console.log('%c⏸ 正在加载中，跳过请求', 'color: #9E9E9E');
                    return cb(this.bindEmails);
                }
                if (!this.hasMore) {
                    console.log('%c⏹ 没有更多数据', 'color: #F44336');
                    return cb(this.bindEmails);
                }

                this.isLoading = true;
                console.log('%c⏳ 发起请求', 'color: #2196F3', {
                    page: this.currentPage,
                    size: this.pageSize
                });

                // 添加加载提示（第二页开始）
                if (this.currentPage > 1) {
                    console.log('➕ 添加加载提示项');
                    this.bindEmails = [...this.bindEmails, { isLoading: true }];
                    cb(this.bindEmails);
                    await this.$nextTick();
                }

                const res = await this.$request.get("/invite-code/selectPage", {
                    params: {
                        bindEmail: currentSearch,
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
                        .filter(item => item?.bindEmail)
                        .map(item => ({
                            value1: item.bindEmail,
                            value2: dayjs.utc(item.createTime).tz('Asia/Shanghai').format('YYYY 年 MM 月 DD 日 HH:mm:ss'),
                            rawData: item
                        }));

                    console.log('🔄 合并数据', {
                        before: this.bindEmails.length,
                        new: newData.length
                    });

                    this.bindEmails = [
                        ...this.bindEmails.filter(item => !item.isLoading),
                        ...newData
                    ];

                    this.hasMore = this.currentPage * this.pageSize < res.data.total;
                    this.currentPage++;

                    console.log('%c🆕 更新后状态', 'color: #009688', {
                        page: this.currentPage,
                        hasMore: this.hasMore,
                        totalItems: this.bindEmails.length
                    });
                }

                cb(this.bindEmails);
            } catch (error) {
                console.error('%c❌ 请求失败', 'color: #F44336; font-weight: bold', error);
                cb([]);
            } finally {
                setTimeout(() => {
                    this.isLoading = false;
                    this.bindEmails = this.bindEmails.filter(item => !item.isLoading);
                    console.log('%c🔄 清理加载状态', 'color: #9C27B0', {
                        isLoading: this.isLoading,
                        items: this.bindEmails.length
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
        handleSelect(item) {
            this.bindEmail = item.value1; // 选择后将 bindEmail 设置为选中的值
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

/**
** 2 秒内完成从 100% → 120% → 100% 的缩放循环
**/
@keyframes pulse {
    0% { 
        transform: scale(1);
        color: #409eff;
        transform-origin: center center; /* 缩放中心点 */
        will-change: transform; /* 提前告知浏览器优化 */ 
    }
    50% { 
        transform: scale(3.5); 
        color: #409eff; 
        will-change: transform;
    }
    100% { 
        transform: scale(1);
        color: #409eff; 
        transform-origin: center center; /* 缩放中心点 */
        will-change: transform; /* 提前告知浏览器优化 */
    }
}

.pulse-text {
    display: inline-block;
    animation: pulse 2s infinite ease-in-out;
    animation-timing-function: linear; /* 匀速动画，避免抖动 */
    display: inline-block;
}
</style>