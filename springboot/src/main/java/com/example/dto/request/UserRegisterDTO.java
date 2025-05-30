package com.example.dto.request;

import lombok.Data;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class UserRegisterDTO {
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;

    @Pattern(regexp = "^[a-zA-Z0-9_]{4,16}$", message = "用户名格式不正确")
    private String username;

    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d|.*[!@#$%^&*]).{8,}$",
            message = "密码必须包含大小写字母和数字/特殊字符")
    private String password;

    @AssertTrue(message = "管理员必须提供邀请码")
    public boolean isAdminRequireCode() {
        return !"ADMIN".equals(role) || inviteCode != null;
    }

    private String role;
    private String inviteCode;
}
