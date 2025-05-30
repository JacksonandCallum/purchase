package com.example.dto.request;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class InviteApplyDTO {
    @NotBlank
    @Email
    private String applicantEmail;

    @NotBlank
    @Size(min = 10, max = 500)
    private String applyReason;
}
