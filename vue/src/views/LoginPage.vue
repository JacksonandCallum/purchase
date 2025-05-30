<template>
    <div class="container">
        <div class="login-box">
            <div class="title">欢迎登录</div>
            <el-form :model="user" :rules="rules" ref="formRef">
                <el-form-item prop="username">
                    <el-input size="medium" prefix-icon="el-icon-user" placeholder="请输入账号（即用户名，非邮箱账号或者真实姓名）"
                        v-model="user.username" @blur="checkRole()" clearable></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input size="medium" prefix-icon="el-icon-lock" placeholder="请输入密码" show-password
                        v-model="user.password" clearable></el-input>
                </el-form-item>
                <el-form-item prop="code">
                    <div style="display: flex;">
                        <el-input style="flex: 1;" size="medium" v-model="code" clearable></el-input>
                        <Identify :identifyCode="identifyCode" @click.native="refreshCode()" style="cursor: pointer;">
                        </Identify>
                    </div>
                </el-form-item>
                <el-form-item>
                    <el-button size="medium" type="primary" style="width: 100%; " @click="login">登 录</el-button>
                </el-form-item>
                <div class="register-link">
                    还没有账号？<el-link type="primary" href="/register-page">立即注册</el-link>
                </div>
            </el-form>
        </div>
    </div>
</template>

<script>
import Identify from '@/components/Identify.vue'

export default {
    name: "LoginPage",
    components: {
        Identify
    },
    data() {
        return {
            user: {
                role: "USER", // 默认角色为普通用户
            },
            rules: {
                username: [
                    { required: true, message: '请输入账号（即用户名，非邮箱账号或者真实姓名）', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                ]
            },
            // 验证码表单绑定的属性
            code: "",
            // 图片验证码
            identifyCode: "",
            // 验证码规则
            identifyCodes: "123456789ABCDEFGHGKMNPQRSTUVWXY",
        }
    },
    created() {

    },
    mounted() {
        this.refreshCode();
    },
    methods: {

        // 切换验证码
        refreshCode() {
            this.identifyCode = ""
            this.makeCode(this.identifyCodes, 4)
        },
        // 生成随机验证码
        makeCode(o, l) {
            for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[Math.floor(Math.random() * (this.identifyCodes.length))]
            }
        },

        // 检查角色
        async checkRole() {
            try {
                const res = await this.$request.get('/auth/check-role', {
                    params: { username: this.user.username }
                });
                if (res.code !== '200') {
                    this.$message.error(res.msg || '角色检查失败');
                    return;
                }else if (res.data.role) {
                    this.user.role = res.data.role; // 如果后端返回了角色，直接使用
                } else {
                    this.$message.warning('未找到角色信息，请检查账号');
                    return;
                }
            } catch (error) {
                console.error('检查角色失败:', error);
                this.$message.error('角色检查失败，请稍后再试');
            }
        },

        async login() {
            try {
                if (!this.code) {
                    this.$message.warning("请输入验证码")
                    // 刷新验证码
                    this.refreshCode()
                    return
                }
                if (this.code.toLowerCase !== this.identifyCode.toLowerCase) {  // toLowerCase可以使大写转成小写
                    this.$message.warning("验证码错误")
                    // 刷新验证码
                    this.refreshCode()
                    return
                }
                const valid = await this.$refs['formRef'].validate();
                if (!valid) return;

                const res = await this.$request.post('/auth/login', this.user);
                if (res.code === '200') {
                    this.$message.success('登录成功');

                } else {
                    this.refreshCode();
                    this.$message.error(res.msg || '登录失败');
                }

                // 存储数据
                const userData = res.data['WHO ARE YOU'];
                const token = res.data.Token;
                localStorage.setItem('xm-user', JSON.stringify(userData));
                localStorage.setItem('xm-token', token);

                setTimeout(() => {
                    // 跳转主页
                    // 跳转（直接跳转子路由避免重定向问题）
                    this.$router.push('/home');
                }, 500);
            } catch (error) {
                console.error('登录请求失败:', error);
                this.$message.error('网络错误，请重试');
            }
        },
    },
}
</script>

<style scoped>
.container {
    height: 100vh;
    /* overflow: hidden; */
    background: url("https://mc.kurogames.com/website-preface/video/bg/bg-poster.png") center/cover;
    /* background-attachment: fixed; */
    /* background-repeat: no-repeat; */
    /* background-size: 100%; */
    display: flex;
    align-items: center;
    justify-content: center;
    /* color: #666; */
}

.login-box {
    width: 420px;
    padding: 40px;
    background: rgba(255, 255, 255, 0.96);
    border-radius: 8px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.title {
    text-align: center;
    font-size: 24px;
    color: #303133;
    margin-bottom: 30px;
    font-weight: 500;
}

.register-link {
    text-align: right;
    margin-top: 10px;
    font-size: 14px;
    color: #606266;
}

/* 过渡动画优化 */
.el-zoom-in-top-enter-active,
.el-zoom-in-top-leave-active {
    transition: all 0.3s cubic-bezier(0.3, 1.3, 0.3, 1);
}
</style>