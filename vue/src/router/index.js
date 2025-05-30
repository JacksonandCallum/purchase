import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

// 解决导航栏或者底部导航tabBar中的vue-router在3.0版本以上频繁点击菜单报错的问题。
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    name: 'Manager',
    component: () => import('../views/Manager.vue'),
    redirect: '/home',  // 重定向到主页
    children: [
      { path: '403', name: 'NoAuth', meta: { name: '无权限' }, component: () => import('../views/manager/403') },
      { path: 'home', name: 'Home', meta: { name: '系统首页' }, component: () => import('../views/manager/Home') },
      { path: 'admin', name: 'Admin', meta: { name: '管理员信息' }, component: () => import('../views/manager/Admin') },
      { path: 'adminPerson', name: 'AdminPerson', meta: { name: '个人信息' }, component: () => import('../views/manager/AdminPerson') },
      { path: 'password', name: 'Password', meta: { name: '修改密码' }, component: () => import('../views/manager/Password') },
      { path: 'notice', name: 'Notice', meta: { name: '公告信息' }, component: () => import('../views/manager/Notice') },
      { path: 'data_matching', name: 'Data_matching', meta: { name: '数据匹配信息' }, component: () => import('../views/manager/Data_matching.vue') },
      { path: 'procurement_needs', name: 'Procurement_needs', meta: { name: '采购需求信息' }, component: () => import('../views/manager/Procurement_needs.vue') },
      { path: 'purchase_order', name: 'Purchase_order', meta: { name: '采购单信息' }, component: () => import('../views/manager/Purchase_order.vue') },
      { path: 'inviteApplication', name: 'InviteApplication', meta: { name: '邀请码申请信息' }, component: () => import('../views/manager/InviteApplication.vue') },
      { path: 'inviteCode', name: 'InviteCode', meta: { name: '邀请码信息' }, component: () => import('../views/manager/InviteCode.vue') },
    ]
  },
  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/Front.vue'),
    children: [
      { path: 'fhome', name: 'fHome', meta: { name: '系统首页' }, component: () => import('../views/front/Home') },
      { path: 'person', name: 'Person', meta: { name: '个人信息' }, component: () => import('../views/front/Person') },
    ]
  },
  { path: '/login', name: 'Login', meta: { name: '登录' }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { name: '注册' }, component: () => import('../views/Register.vue') },
  { path: '/register-page', name: 'RegisterPage', meta: { name: '注册页' }, component: () => import('../views/RegisterPage.vue') },
  { path: '/login-page', name: 'LoginPage', meta: { name: '登录页' }, component: () => import('../views/LoginPage.vue') },
  { path: '*', name: 'NotFound', meta: { name: '无法访问' }, component: () => import('../views/404.vue') },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 路由守卫
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('xm-token');
  const isRegisterPage = to.path === '/register-page'; // 示例条件：判断是否为注册页
  console.log('-------------------------');
  console.log('当前访问路径:', to.path);
  console.log('token是否存在:', !!token);
  // console.log('token值:', token);
  // console.log('-------------------------');

  if (to.path === '/login-page' || to.path === '/register-page' || token) {
    next(); // 允许访问登录页、注册页或已登录用户访问其他页面
  } else {
    next(isRegisterPage ? '/register-page' : '/login-page'); // 重定向到登录页
  }
});

export default router
