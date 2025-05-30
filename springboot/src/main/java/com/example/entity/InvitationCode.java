package com.example.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InvitationCode {
    private Long id;
    // 邀请码
    private String code;
    // 生成者（SYSTEM表示系统生成）
    private String generator;
    // 0-未使用 1-已使用
    private Integer status;
    // 生成时间
    private Date createTime;
    // 过期时间
    private Date expireTime;
    // 最大使用次数，默认：1
    private Integer useCount;
    // 已使用次数，默认：0
    private Integer usedCount;
    // 允许注册的用户类型
    private String userType;
    // 绑定邮箱（当需要特定邮箱使用时）
    private String bindEmail;

    // 便捷构造方法
    public InvitationCode(String code, String generator, String bindEmail) {
        this.code = code;
        this.generator = generator;
        this.bindEmail = bindEmail;
        this.status = 0;
        this.createTime = new Date();
        this.expireTime = Date.from(Instant.now().plus(7, ChronoUnit.DAYS));
        this.useCount = 1;
        this.usedCount = 0;
        this.userType = "ADMIN";
    }
}
