package com.example.common.config;

import cn.hutool.core.util.ObjectUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.exception.CustomException;
import com.example.service.AdminService;
import com.example.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * JWT拦截器，验证请求中的token有效性
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(JwtInterceptor.class);

    @Resource
    private AdminService adminService;

    @Resource
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 放行OPTIONS请求，避免预检请求被拦截
        if (request.getMethod().equalsIgnoreCase("OPTIONS")) {
            return true;
        }

        // 1. 获取Token
        String token = request.getHeader(Constants.TOKEN);
        if (ObjectUtil.isEmpty(token)) {
            token = request.getParameter(Constants.TOKEN);
        }

        log.info("请求携带的token: {}", token != null ? "***" : "null");

        if (ObjectUtil.isEmpty(token)) {
            log.warn("Token不存在，拒绝访问");
            // 使用枚举的code和msg创建异常
            throw new CustomException(ResultCodeEnum.TOKEN_INVALID_ERROR.getCode(),
                    ResultCodeEnum.TOKEN_INVALID_ERROR.getMsg());
        }

        Account account;
        try {
            // 2. 解析audience
            List<String> audience = JWT.decode(token).getAudience();
            log.info("JWT audience解析结果: {}", audience);

            if (audience == null || audience.isEmpty()) {
                log.error("Token中audience字段为空");
                throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                        ResultCodeEnum.TOKEN_CHECK_ERROR.getMsg());
            }

            // 3. 验证格式
            String userRole = audience.get(0);
            if (!userRole.contains("-")) {
                log.error("Token中audience格式错误，缺少'-'分隔符: {}", userRole);
                throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                        "Token格式错误，缺少用户角色信息");
            }

            String[] parts = userRole.split("-", 2);
            if (parts.length != 2) {
                log.error("Token中audience格式错误，无法分割为userId和role: {}", userRole);
                throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                        "Token格式错误，用户信息不完整");
            }

            String userIdStr = parts[0];
            String role = parts[1];
            log.info("解析出的userId: {}, role: {}", userIdStr, role);

            // 4. 验证用户ID
            int userId;
            try {
                userId = Integer.parseInt(userIdStr);
            } catch (NumberFormatException e) {
                log.error("userId格式错误，不是有效的整数: {}", userIdStr);
                throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                        "用户ID格式错误，必须为整数");
            }

            // 5. 查询用户信息
            if (RoleEnum.ADMIN.name().equals(role)) {
                account = adminService.selectById(userId);
            } else if (RoleEnum.USER.name().equals(role)) {
                account = userService.selectById(userId);
            } else {
                log.error("未知角色类型: {}", role);
                throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                        "未知角色类型: " + role);
            }

            if (ObjectUtil.isNull(account) || ObjectUtil.isEmpty(account.getPassword())) {
                log.error("用户不存在或密码为空，userId: {}", userId);
                throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR.getCode(),
                        ResultCodeEnum.USER_NOT_EXIST_ERROR.getMsg());
            }

        } catch (CustomException e) {
            log.error("JWT验证业务异常: {}", e.getMsg());
            throw e; // 传递带正确消息的异常
        } catch (Exception e) {
            log.error("JWT解析过程发生未知异常: {}", e.getMessage(), e);
            throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                    "Token解析失败，请重新登录");
        }

        // 6. 验证签名
        try {
            log.info("开始验证JWT签名，userId: {}", account.getId());
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(account.getPassword())).build();
            jwtVerifier.verify(token);
            log.info("JWT签名验证成功，userId: {}", account.getId());
        } catch (JWTVerificationException e) {
            log.error("JWT签名验证失败: {}", e.getMessage());
            throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR.getCode(),
                    "Token签名验证失败，请重新登录");
        }

        return true;
    }
}