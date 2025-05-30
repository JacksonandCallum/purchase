package com.example.service;

import com.example.exception.BusinessException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
@Slf4j
public class MailService {
    private final JavaMailSender mailSender;
    private final TemplateEngine templateEngine;

    /**
     * 发送审批通过邮件（含邀请码）
     * @param to
     * @param code
     */
    public void sendApprovalEmail(String to, String code, String comment) {
        Context context = new Context();
        context.setVariable("code", code);
        context.setVariable("comment", comment);
        String content = templateEngine.process("approve-email", context);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom("info@you-ta.cn");
            helper.setTo(to);
            helper.setSubject("管理员邀请码通知");
            helper.setText(content, true); // true表示支持HTML

            log.info("准备发送邮件到: {}", to);
            mailSender.send(message);
            log.info("邮件发送成功: {}", to);
        } catch (Exception e) {
            log.error("邮件发送失败: {}", to, e);  // 记录完整异常信息
            throw new BusinessException("邮件发送失败",e);
        }
    }

    /**
     * 发送审批拒绝邮件
     * @param to
     * @param comment
     */
    public void sendRejectionEmail(String to, String comment) {
        Context context = new Context();
        context.setVariable("comment", comment);

        // 使用 templateEngine.process 方法处理模板
        String content = templateEngine.process("reject-email", context);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true); // 添加 true 参数支持 HTML 和附件
            helper.setFrom("info@you-ta.cn");
            helper.setTo(to);
            helper.setSubject("管理员申请未通过审核");
            helper.setText(content, true); // true 表示 HTML 格式

            log.info("准备发送邮件到: {}", to);
            mailSender.send(message);
            log.info("邮件发送成功: {}", to);
        } catch (Exception e) {
            log.error("邮件发送失败: {}", to, e);  // 记录完整异常信息
            throw new BusinessException("拒绝邮件发送失败", e); // 添加原始异常信息
        }
    }
}
