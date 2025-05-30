<template>
  <div class="manager-container">
    <!--  头部  -->
    <div class="manager-header">
      <div class="manager-header-left">
        <img src="@/assets/imgs/采购流程.png" />
        <div class="title">采购流程系统</div>
      </div>

      <div class="manager-header-center">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ path: $route.path }">{{
            $route.meta.name
          }}</el-breadcrumb-item>
        </el-breadcrumb>
      </div>

      <div class="manager-header-right">
        <el-dropdown placement="bottom">
          <div class="avatar">
            <img :src="user.avatar ||
              'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
              " />
            <div>{{ user.username || "管理员" }}</div>
          </div>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item @click.native="goToPerson">个人信息</el-dropdown-item>
            <el-dropdown-item @click.native="$router.push('/password')">修改密码</el-dropdown-item>
            <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!--  主体  -->
    <div class="manager-main">
      <!--  侧边栏  -->
      <div class="manager-main-left">
        <!-- <el-aside>
          <div class="toggle-button" @click="toggleCollapse"> |||</div>
        </el-aside> -->
        <el-menu :default-openeds="['info', 'user']" router style="border: none" :default-active="$route.path"
          :collapse="isCollapse">
          <!-- 添加一个顶部占位元素 -->
          <!-- <div style="height: 30px;"></div> -->
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">系统首页</span>
          </el-menu-item>
          
          <el-menu-item index="/data_matching">
            <i class="el-icon-s-data"></i>
            <span slot="title">数据匹配信息</span>
          </el-menu-item>

          <el-menu-item index="/procurement_needs">
            <i class="el-icon-s-order"></i>
            <span slot="title">采购需求信息</span>
          </el-menu-item>

          <el-menu-item index="/purchase_order">
            <i class="el-icon-s-ticket"></i>
            <span slot="title">采购单信息</span>
          </el-menu-item>

          <el-menu-item index="/inviteApplication">
            <i class="el-icon-s-claim"></i>
            <span slot="title">邀请码申请信息</span>
          </el-menu-item>

          <el-menu-item index="/inviteCode">
            <i class="el-icon-share"></i>
            <span slot="title">邀请码信息</span>
          </el-menu-item>

          <el-menu-item index="/admin">
            <i class="el-icon-s-custom"></i>
            <span slot="title">管理员信息</span>
          </el-menu-item>

          <!-- <el-submenu index="info">
            <template slot="title">
              <i class="el-icon-menu"></i><span>信息管理</span>
            </template>
            <el-menu-item index="/notice">公告信息</el-menu-item>
            <el-menu-item index="/data_matching">数据匹配信息</el-menu-item>
            <el-menu-item index="/procurement_needs">采购需求信息</el-menu-item>
            <el-menu-item index="/purchase_order">采购单信息</el-menu-item>
          </el-submenu> -->

          <!-- <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-menu"></i><span>用户管理</span>
            </template>
            <el-menu-item index="/admin">管理员信息</el-menu-item>
          </el-submenu> -->
        </el-menu>
      </div>

      <!--  数据表格  -->
      <div class="manager-main-right">
        <router-view @update:user="updateUser" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Manager",
  data() {
    return {
      user: JSON.parse(localStorage.getItem("xm-user") || "{}"),
      isCollapse: false,
    };
  },
  created() {
    if (!this.user.token) {
      this.$router.push("/login-page");
    }
  },
  methods: {
    updateUser() {
      this.user = JSON.parse(localStorage.getItem("xm-user") || "{}"); // 重新获取下用户的最新信息
    },
    goToPerson() {
      if (this.user.role === "ADMIN") {
        this.$router.push("/adminPerson");
      }
    },
    logout() {
      localStorage.removeItem("xm-user");
      localStorage.removeItem("xm-token");
      this.$router.push("/login-page");
    },
    toggleCollapse() {
      this.isCollapse = !this.isCollapse;
    },
  },
};
</script>

<style scoped>
@import "@/assets/css/manager.css";

.toggle-button {
  background: rgb(66, 109, 131);
  font-size: 10px;
  line-height: 24px;
  color: white;
  text-align: center;
  letter-spacing: 0.2rem;
  cursor: pointer;
}

.toggle-button:hover {
  background: rgb(76, 127, 152);
}

.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
</style>
