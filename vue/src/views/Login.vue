<template>
  <div class="container">
    <div style="width: 400px; padding: 30px; background-color: white; border-radius: 5px;">
      <div style="text-align: center; font-size: 20px; margin-bottom: 20px; color: #333">欢迎使用</div>
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item prop="username">
          <el-input prefix-icon="el-icon-user" placeholder="请输入账号" v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input prefix-icon="el-icon-lock" placeholder="请输入密码" show-password v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button style="width: 100%; background-color: #333; border-color: #333; color: white" @click="login">登
            录</el-button>
        </el-form-item>
        <div style="display: flex; align-items: center">
          <div style="flex: 1"></div>
          <div style="flex: 1; text-align: right">
            还没有账号？请 <a href="/register">注册</a>
          </div>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      form: { role: 'ADMIN' },
      rules: {
        username: [
          { required: true, message: '请输入账号', trigger: 'blur' },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
        ]
      }
    }
  },
  created() {

  },
  methods: {
    // login() {
    //   this.$refs['formRef'].validate((valid) => {
    //     if (valid) {
    //       // 验证通过
    //       this.$request.post('/login', this.form).then(res => {
    //         if (res.code === '200') {
    //           console.log('完整登录响应:', res.data) // 调试用

    //           // 提取用户信息 和 token
    //           const userData = res.data['WHO ARE YOU'];  // 使用方括号语法访问特殊属性名
    //           const token = res.data.Token

    //           // 存储用户信息 和 token 到 localStorage
    //           localStorage.setItem("xm-user", JSON.stringify(userData));
    //           localStorage.setItem("xm-token", token);

    //           console.log('存储的用户数据:', JSON.parse(localStorage.getItem("xm-user")));
    //           console.log('存储的 token:', localStorage.getItem("xm-token"));

    //           this.$router.push('/')  // 跳转根路径触发路由守卫
    //         } else {
    //           this.$message.error(res.msg)
    //         }
    //       })
    //     }
    //   })
    // }

    async login() { // 使用 async/await 简化异步处理
      try {
        const valid = await this.$refs['formRef'].validate();
        if (!valid) return;

        const res = await this.$request.post('/login', this.form);
        if(res.code === '200'){
          this.$message.success('登录成功');
        }else{
          return this.$message.error(res.msg || '登录失败');
        }

        // 存储数据
        const userData = res.data['WHO ARE YOU'];
        const token = res.data.Token;
        localStorage.setItem('xm-user', JSON.stringify(userData));
        localStorage.setItem('xm-token', token);

        // 跳转（直接跳转子路由避免重定向问题）
        this.$router.push('/home'); // 临时跳转子路由测试
        // 或保留跳根路径：this.$router.push('/');
      } catch (error) {
        console.error('登录请求失败:', error);
        this.$message.error('网络错误，请重试');
      }
    }
  }
}
</script>

<style scoped>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("@/assets/imgs/bg.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}

a {
  color: #2a60c9;
}
</style>