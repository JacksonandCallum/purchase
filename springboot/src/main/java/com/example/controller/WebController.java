package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.common.Result;
import com.example.common.config.JwtInterceptor;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 基础前端接口
 */
@RestController
public class WebController {

    private static final Logger log = LoggerFactory.getLogger(WebController.class);

    @Resource
    private AdminService adminService;

    @GetMapping("/")
    public Result hello() {
        return Result.success("访问成功");
    }

    /**
     * 登录
     */
    @PostMapping("/login")
    public Result login(@RequestBody Account account) {
        if (ObjectUtil.isEmpty(account.getUsername()) || ObjectUtil.isEmpty(account.getPassword())
                || ObjectUtil.isEmpty(account.getRole())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }

        // 验证用户信息
        Account loggedInUser = null;
        if (RoleEnum.ADMIN.name().equals(account.getRole())) {
            loggedInUser = adminService.login(account);
        }

        // 验证失败处理
        if (loggedInUser == null || !account.getPassword().equals(loggedInUser.getPassword())) {
            return Result.error(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }

        // 生成JWT Token
        String token = generateToken(loggedInUser);
        log.info("生成JWT Token: {}", token);

        // 封装返回数据
        Map<String, Object> resultData = new HashMap<>();
        resultData.put("Token", token);
        Map<String,Object> userInfo = new HashMap<>();
        loggedInUser.setToken(token);
        userInfo.put("id", loggedInUser.getId());
        userInfo.put("username", loggedInUser.getUsername());
        userInfo.put("name", loggedInUser.getName());
        userInfo.put("role", loggedInUser.getRole());
        userInfo.put("token",loggedInUser.getToken());
        resultData.put("WHO ARE YOU", userInfo);

        return Result.success(resultData);
    }

    /**
     * 生成JWT Token
     */
    private String generateToken(Account user) {
        try {
            // 使用用户密码作为签名密钥（确保安全性）
            Algorithm algorithm = Algorithm.HMAC256(user.getPassword());

            // 构建JWT
            return JWT.create()
                    .withAudience(user.getId() + "-" + user.getRole()) // 存储用户ID和角色
                    .withExpiresAt(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000)) // 24小时有效期
                    .withIssuedAt(new Date()) // 签发时间
                    .sign(algorithm);
        } catch (Exception e) {
            throw new RuntimeException("生成Token失败", e);
        }
    }

    /**
     * 注册
     */
    @PostMapping("/register")
    public Result register(@RequestBody Account account) {
        if (StrUtil.isBlank(account.getUsername()) || StrUtil.isBlank(account.getPassword())
                || ObjectUtil.isEmpty(account.getRole())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }
        if (RoleEnum.ADMIN.name().equals(account.getRole())) {
            adminService.register(account);
        }
        return Result.success();
    }

    /**
     * 修改密码
     */
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody Account account) {
        if (StrUtil.isBlank(account.getUsername()) || StrUtil.isBlank(account.getPassword())
                || ObjectUtil.isEmpty(account.getNewPassword())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }
        if (RoleEnum.ADMIN.name().equals(account.getRole())) {
            adminService.updatePassword(account);
        }
        return Result.success();
    }

}
