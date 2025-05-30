package com.example.controller;

import com.example.common.Result;
import com.example.dto.request.CodeValidateDTO;
import com.example.dto.request.InviteApplyDTO;
import com.example.dto.request.ProcessDTO;
import com.example.dto.response.ApplicationVO;
import com.example.service.InvitationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/invite")
public class InviteController {
    private final InvitationService invitationService;

    @PostMapping("/apply")
    public ResponseEntity<?> applyInviteCode(@Valid @RequestBody InviteApplyDTO dto) {
        return ResponseEntity.ok(invitationService.createApplication(dto));
    }

    @PostMapping("/validate")
    public ResponseEntity<Boolean> validateCode(@Valid @RequestBody CodeValidateDTO dto) {
        return ResponseEntity.ok(invitationService.validateInviteCode(dto));
    }

    @GetMapping("/applications")
    public List<ApplicationVO> getApplications(
            @RequestParam(defaultValue = "PENDING") String status) {
        return invitationService.getApplicationsByStatus(status);
    }

    @PostMapping("/approve/{applicationId}")
    public Result approveApplication(
            @PathVariable Integer applicationId,
            @RequestBody ProcessDTO dto) {
        invitationService.processApplication(applicationId, true, dto.getComment(), dto.getReviewerId());
        return Result.success();
    }

    @PostMapping("/reject/{applicationId}")
    public Result rejectApplication(
            @PathVariable Integer applicationId,
            @RequestBody ProcessDTO dto) {
        invitationService.processApplication(applicationId, false, dto.getComment(), dto.getReviewerId());
        return Result.success();
    }

}
