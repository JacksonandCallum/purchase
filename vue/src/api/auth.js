import request from '@/utils/request'

export default {
  // 用户注册
  register(data) {
    return request.post('/auth/register', data)
  },
  
  // 获取飞书用户信息
  getFeishuUser(email) {
    return request.get('/auth/feishu-user', { params: { email } })
  },

  // 检查邮箱是否注册
  checkEmail(email) {
    return request.get('/auth/check-email', { params: { email } })
  }
}