// 企业邮箱验证
export function validateCompanyEmail(email) {
  const COMPANY_DOMAINS = ['you-ta.cn', 'example.cn']
  const regex = new RegExp(`^[a-zA-Z0-9._%+-]+@(${COMPANY_DOMAINS.join('|')})$`)
  return regex.test(email)
}

// 密码强度验证
export function validatePasswordStrength(password) {
  const hasUpper = /[A-Z]/.test(password)
  const hasLower = /[a-z]/.test(password)
  const hasNumber = /\d/.test(password)
  const hasSpecial = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/.test(password)
  return password.length >= 8 && hasUpper && hasLower && (hasNumber || hasSpecial)
}