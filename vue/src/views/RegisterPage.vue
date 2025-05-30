<template>
    <div class="container">
        <div class="register-box">
            <!-- 标题部分保持不变 -->
            <div class="title">欢迎注册</div>

            <!-- 用户类型选择 -->
            <div class="type-selector">
                <el-radio-group v-model="userType" @change="handleTypeChange">
                    <el-radio-button label="user">普通用户</el-radio-button>
                    <el-radio-button label="admin">管理员</el-radio-button>
                </el-radio-group>
            </div>

            <!-- 注册表单 -->
            <el-form ref="formRef" :model="form" :rules="rules" label-width="0">
                <!-- 邮箱输入 -->
                <el-form-item prop="email">
                    <el-input v-model="form.email" placeholder="请输入飞书企业邮箱" prefix-icon="el-icon-message" clearable
                        @blur="checkFeishuEmail">
                        <template #append>
                            <el-tooltip content="需通过企业邮箱验证">
                                <i class="el-icon-question" />
                            </el-tooltip>
                        </template>
                    </el-input>
                </el-form-item>

                <!-- 用户名输入 -->
                <el-form-item prop="username">
                    <el-input v-model="form.username" placeholder="请输入账号（4-16位字母数字）" prefix-icon="el-icon-user"
                        clearable />
                </el-form-item>

                <!-- 密码输入 -->
                <el-form-item prop="password">
                    <el-input v-model="form.password" placeholder="请输入密码（至少8位含字母数字）" prefix-icon="el-icon-lock"
                        show-password clearable />
                </el-form-item>

                <!-- 确认密码 -->
                <el-form-item prop="confirmPass">
                    <el-input v-model="form.confirmPass" placeholder="请确认密码" prefix-icon="el-icon-lock" show-password
                        clearable />
                </el-form-item>

                <!-- 管理员邀请码 -->
                <transition name="el-zoom-in-top">
                    <div v-if="userType === 'admin'">
                        <el-form-item prop="inviteCode">
                            <el-input v-model.trim="form.inviteCode" placeholder="请输入管理员邀请码" prefix-icon="el-icon-key">
                                <template #append>
                                    <el-button v-if="!form.inviteCode" type="text" @click="showApplyDialog">
                                        申请邀请码
                                    </el-button>
                                </template>
                            </el-input>
                        </el-form-item>
                    </div>
                </transition>

                <!-- 提交按钮 -->
                <el-form-item>
                    <el-button type="primary" size="medium" style="width: 100%" :loading="loading"
                        @click="submitRegister">
                        {{ userType === 'admin' ? '注册管理员' : '立即注册' }}
                    </el-button>
                </el-form-item>
            </el-form>

            <!-- 登录链接 -->
            <div class="login-link">
                已有账号？
                <el-link type="primary" href="/login-page">立即登录</el-link>
            </div>

            <!-- 申请邀请码对话框 -->
            <el-dialog title="管理员权限申请" :visible.sync="applyDialogVisible" width="500px" :close-on-click-modal="false">
                <el-form ref="applyFormRef" :model="applyForm" :rules="applyRules">
                    <el-form-item label="申请邮箱" prop="email">
                        <el-input v-model="form.email" disabled />
                    </el-form-item>
                    <el-form-item label="申请理由" prop="applyReason">
                        <el-input v-model="applyForm.applyReason" type="textarea" :rows="4" placeholder="请详细说明需要管理员权限的原因"
                            maxlength="500" show-word-limit />
                    </el-form-item>
                </el-form>
                <template #footer>
                    <el-button @click="applyDialogVisible = false">取消</el-button>
                    <el-button type="primary" :loading="applyLoading" @click="submitApply">
                        提交申请
                    </el-button>
                </template>
            </el-dialog>
        </div>
    </div>
</template>

<script>
import { validateCompanyEmail, validatePasswordStrength } from '@/utils/validate'
import authApi from '@/api/auth'
import inviteApi from '@/api/invite'

export default {
    name: 'RegisterPage',
    data() {
        // 密码确认验证
        const validateConfirmPass = (rule, value, callback) => {
            if (value !== this.form.password) {
                callback(new Error('两次输入密码不一致'))
            } else {
                callback()
            }
        }

        return {
            userType: 'user',
            loading: false,
            applyDialogVisible: false,
            applyLoading: false,
            form: {
                email: '',
                username: '',
                password: '',
                confirmPass: '',
                inviteCode: '',
                role: 'USER'
            },
            applyForm: {
                applyReason: ''
            },
            rules: {
                email: [
                    { required: true, message: '请输入邮箱', trigger: 'blur' },
                    {
                        validator: (rule, value, callback) => {
                            if (!validateCompanyEmail(value)) {
                                callback(new Error('请使用企业飞书邮箱'))
                            } else {
                                callback()
                            }
                        },
                        trigger: 'blur'
                    }
                ],
                username: [
                    { required: true, message: '请输入用户名', trigger: 'blur' },
                    { min: 4, max: 16, message: '长度在4到16个字符', trigger: 'blur' },
                    { pattern: /^[a-zA-Z0-9_]+$/, message: '只能包含字母、数字和下划线' }
                ],
                password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                    {
                        validator: (rule, value, callback) => {
                            if (!validatePasswordStrength(value)) {
                                callback(new Error('需包含大小写字母和数字/特殊字符'))
                            } else {
                                callback()
                            }
                        },
                        trigger: 'blur'
                    }
                ],
                confirmPass: [
                    { required: true, message: '请确认密码', trigger: 'blur' },
                    { validator: validateConfirmPass, trigger: 'blur' }
                ],
                inviteCode: [
                    { required: true, message: '管理员必须填写邀请码', trigger: 'blur' }
                ]
            },
            applyRules: {
                applyReason: [
                    { required: true, message: '请填写申请理由', trigger: 'blur' },
                    { min: 10, message: '至少需要10个字符说明', trigger: 'blur' }
                ]
            }
        }
    },
    watch: {
        userType(newVal) {
            this.form.role = newVal === 'admin' ? 'ADMIN' : 'USER'
            this.$refs.formRef.clearValidate()
        }
    },
    methods: {
        handleTypeChange() {
            this.$refs.formRef.clearValidate()
        },

        async checkFeishuEmail() {
            try {
                const res = await authApi.checkEmail(this.form.email)
                if (res.data) {
                    this.$message.warning('该邮箱已注册')
                }
            } catch (error) {
                this.$message.error('邮箱验证失败')
            }
        },

        showApplyDialog() {
            if (!this.form.email) {
                this.$message.warning('请先填写企业邮箱')
                return
            }
            this.applyDialogVisible = true
        },

        async submitApply() {
            try {
                await this.$refs.applyFormRef.validate()
                this.applyLoading = true

                await inviteApi.applyInvite({
                    applicantEmail: this.form.email,
                    applyReason: this.applyForm.applyReason 
                })

                this.$message.success('申请已提交')
                this.applyDialogVisible = false
            } catch (error) {
                const msg = error.response?.data?.message || '提交失败'
                this.$message.error(msg)
            } finally {
                this.applyLoading = false
            }
        },

        async submitRegister() {
            try {
                await this.$refs.formRef.validate()
                this.loading = true

                // 管理员验证邀请码
                if (this.userType === 'admin') {
                    const validRes = await inviteApi.validateCode({
                        code: this.form.inviteCode,
                        email: this.form.email,
                        role: this.form.role = 'ADMIN'
                    })
                    if (validRes !== true) {
                        throw new Error('邀请码验证失败')
                    }
                }

                // 提交注册
                const payload = {
                    ...this.form,
                    role: this.form.role
                }
                delete payload.confirmPass

                await authApi.register(payload)

                this.$message.success('注册成功，即将跳转登录页')
                setTimeout(() => {
                    this.$router.push('/login-page')
                }, 3000)
            } catch (error) {
                const msg = error.response?.data?.message || error.message
                this.$message.error(`注册失败: ${msg}`)

                if (msg.includes('邀请码')) {
                    this.form.inviteCode = ''
                    this.$refs.formRef.validateField('inviteCode')
                }
            } finally {
                this.loading = false
            }
        }
    }
}
</script>

<style scoped>
/* 保持原有样式不变 */
.container {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: url("https://mc.kurogames.com/website-preface/video/bg/bg-poster.png") center/cover;
}

.register-box {
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

.type-selector {
    margin-bottom: 25px;
    display: flex;
    justify-content: center;
}

.login-link {
    text-align: right;
    margin-top: 10px;
    font-size: 14px;
    color: #606266;
}

.el-zoom-in-top-enter-active,
.el-zoom-in-top-leave-active {
    transition: all 0.3s cubic-bezier(0.3, 1.3, 0.3, 1);
}
</style>