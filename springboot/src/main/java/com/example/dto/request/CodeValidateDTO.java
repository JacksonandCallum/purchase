package com.example.dto.request;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
public class CodeValidateDTO {
    /**
     * 邀请码（必填）
     * 示例值: "ABCDE123"
     */
    @NotBlank(message = "邀请码不能为空")
    private String code;

    /**
     * 待验证的飞书企业邮箱（必填）
     * 示例值: "user@company.com"
     */
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;

    /**
     * 自定义验证逻辑（可选）
     * 确保管理员邀请码只能用于管理员注册
     */
    public boolean isAdminCodeValid() {
        // 实际业务中可能需要根据邀请码类型校验用户角色
        return code.startsWith("ADMIN_"); // 示例校验逻辑
    }
}
