import request from '@/utils/request'

export default {
  // 申请邀请码
  applyInvite(data) {
    return request.post('/invite/apply', data)
  },

  // 验证邀请码
  validateCode(data) {
    return request.post('/invite/validate', data)
  }
}