package com.example.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InvitationApplication {
    private Integer id;
    // 申请邮箱（必须为企业邮箱）
    private String applicantEmail;
    // 申请理由
    private String applyReason;
    // 申请状态
    private String status;
    // 生成的邀请码
    private String inviteCode;
    // 审核人ID（关联user.id）
    private Integer reviewerId;
    // 审核意见
    private String reviewComment;
    private Date createdAt;
    private Date updatedAt;

    private String reviewerName;
}
