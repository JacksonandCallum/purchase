package com.example.dto.response;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class ApplicationVO {
    private Integer id;
    private String applicantEmail;
    private String applyReason;
    private String status;
    private String inviteCode;
    private String reviewComment;
    private LocalDateTime createTime;
}
