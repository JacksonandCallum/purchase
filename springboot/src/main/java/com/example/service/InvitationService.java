package com.example.service;

import com.example.common.enums.ResultCodeEnum;
import com.example.dto.request.CodeValidateDTO;
import com.example.dto.request.InviteApplyDTO;
import com.example.dto.response.ApplicationVO;
import com.example.entity.InvitationApplication;
import com.example.entity.InvitationCode;
import com.example.exception.BusinessException;
import com.example.exception.CustomException;
import com.example.mapper.InvitationApplicationMapper;
import com.example.mapper.InvitationCodeMapper;
import com.example.mapper.UserMapper;
import com.example.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class InvitationService {
    private final InvitationApplicationMapper applicationMapper;
    private final InvitationCodeMapper codeMapper;
    private final UserMapper userMapper;
    private final MailService mailService;

    @Transactional
    public void processApplication(Integer applicationId,boolean approve,String comment,Integer reviewerId) {
        InvitationApplication application = applicationMapper.selectById(applicationId);
        if (application == null) throw new BusinessException("申请不存在");

        if (approve) {
            String code = generateUniqueCode();
            codeMapper.insert(new InvitationCode(code, "SYSTEM", application.getApplicantEmail()));
            application.setInviteCode(code);
            // 使用飞书服务发送邮件
            mailService.sendApprovalEmail(application.getApplicantEmail(), code, comment);
        } else {
            // 发送拒绝通知
            mailService.sendRejectionEmail(application.getApplicantEmail(), comment);
        }

        application.setStatus(approve ? "APPROVED" : "REJECTED");
        application.setReviewComment(comment);
        application.setReviewerId(reviewerId);
        applicationMapper.update(application);
    }

    private String generateUniqueCode() {
        // 使用分布式锁生成唯一邀请码
        return RandomStringUtils.randomAlphanumeric(12).toUpperCase();
    }

    @Transactional
    public ApplicationVO createApplication(InviteApplyDTO dto) {
        // 验证邮箱是否已注册
        if (userMapper.existsByEmail(dto.getApplicantEmail())) {
            throw new BusinessException("该邮箱已注册");
        }

        InvitationApplication application = InvitationApplication.builder()
                .applicantEmail(dto.getApplicantEmail())
                .applyReason(dto.getApplyReason())
                .status("PENDING")
                .createdAt(new Date())
                .build();

        applicationMapper.insert(application);
        return convertToVO(application);
    }

    private ApplicationVO convertToVO(InvitationApplication application) {
        return ApplicationVO.builder()
                .id(application.getId())
                .applicantEmail(application.getApplicantEmail())
                .applyReason(application.getApplyReason())
                .status(application.getStatus())
                .createTime(application.getCreatedAt().toInstant()
                        .atZone(ZoneId.systemDefault()).toLocalDateTime())
                .build();
    }

    @Transactional
    public boolean validateInviteCode(CodeValidateDTO dto) {
        // 查询邀请码
        InvitationCode code = codeMapper.selectValidCode(dto.getCode());

        // 基础验证
        if (code == null) {
            throw new CustomException(ResultCodeEnum.INVITE_CODE_ERROR.getCode(), ResultCodeEnum.INVITE_CODE_ERROR.getMsg());
            //throw new BusinessException("邀请码不存在 || 邀请码已被使用 || 邀请码已过期");
        }

        // 状态验证
        if (code.getStatus() != 0) {
            throw new BusinessException("邀请码已被使用");
        }

        // 有效期验证
        if (code.getExpireTime().before(new Date())) {
            throw new BusinessException("邀请码已过期");
        }

        // 邮箱绑定验证
        if (StringUtils.hasText(code.getBindEmail()) &&
                !code.getBindEmail().equalsIgnoreCase(dto.getEmail())) {
            throw new BusinessException("邀请码与邮箱不匹配");
        }

        /*
         验证通过后更新状态
        codeMapper.updateStatus(dto.getCode(), 1);
        codeMapper.incrementUsedCount(code.getId());
        */

        return true;
    }

    /**
     * 根据状态获取申请列表
     * @param status 状态值
     * @return 申请视图对象列表
     */
    public List<ApplicationVO> getApplicationsByStatus(String status) {
        List<InvitationApplication> applications = applicationMapper.selectByStatus(status);
        return applications.stream()
                .map(this::convertToVO)
                .collect(Collectors.toList());
    }

    /**
     * 新增
     * @param invitationApplication
     */
    public void add(InvitationApplication invitationApplication) {
        applicationMapper.insert(invitationApplication);
    }

    /**
     * 删除
     * @param id
     */
    public void deleteById(Integer id) {
        applicationMapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            applicationMapper.deleteById(id);
        }
    }

    /**
     * 修改
     * @param invitationApplication
     */
    public void updateById(InvitationApplication invitationApplication) {
        applicationMapper.updateById(invitationApplication);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public InvitationApplication selectById(Integer id) {
        InvitationApplication invitationApplication = applicationMapper.selectById(id);
        return invitationApplication;
    }

    /**
     * 查询全部
     * @param invitationApplication
     * @return
     */
    public List<InvitationApplication> selectAll(InvitationApplication invitationApplication) {
        return applicationMapper.selectAll(invitationApplication);
    }

    /**
     * 分页查询
     * @param invitationApplication
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<InvitationApplication> selectPage(InvitationApplication invitationApplication, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<InvitationApplication> list = applicationMapper.selectAll(invitationApplication);
        return PageInfo.of(list);
    }
}
