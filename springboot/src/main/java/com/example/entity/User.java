package com.example.entity;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User extends Account implements Serializable {
    private Integer id;
    // 飞书开放平台用户唯一标识
    private String feishuUserId;
    // 登录账号
    private String username;
    // BCrypt加密密码
    private String password;
    // 真实姓名
    private String name;
    // 头像URL
    private String avatar;
    // 角色
    private String role;
    // 性别
    private String sex;
    // 手机号码
    private String phone;
    // 飞书企业邮箱
    private String email;
    // 扩展信息
    private String info;
    // 出生日期（生日）
    private Date birth;
    // 密码盐（如使用加盐算法）
    private String salt;
    // 注册IP
    private String ip;
    private Date createTime;
    private String token;
}
