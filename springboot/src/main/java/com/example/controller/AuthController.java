package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.dto.feishu.FeishuUserInfo;
import com.example.dto.request.UserLoginDTO;
import com.example.dto.request.UserRegisterDTO;
import com.example.entity.User;
import com.example.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {
    private static final Logger log = LoggerFactory.getLogger(AuthController.class);

    private static final String Secret_Key = "purchase-secret-key";

    private final AuthService authService;
    private final PasswordEncoder passwordEncoder;

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody UserRegisterDTO dto) {
        authService.register(dto);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/feishu-user")
    public ResponseEntity<FeishuUserInfo> getFeishuUser(@RequestParam @Email String email) {
        return ResponseEntity.ok(authService.getFeishuUserInfo(email));
    }

    /**
     * 注册时，检查用户邮箱是否存在
     * @param email
     * @return
     */
    @GetMapping("/check-email")
    public ResponseEntity<Boolean> checkEmailExists(@RequestParam @Email String email) {
        return ResponseEntity.ok(authService.checkEmailExists(email));
    }

    /**
     * 登录
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        if (ObjectUtil.isEmpty(user.getUsername()) || ObjectUtil.isEmpty(user.getPassword())
                || ObjectUtil.isEmpty(user.getRole())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }

        // 验证用户信息
        User loggedInUser = null;
        if (RoleEnum.ADMIN.name().equals(user.getRole())) {
            loggedInUser = authService.loginAdmin(user);
        }else if (RoleEnum.USER.name().equals(user.getRole())) {
            loggedInUser = authService.loginUser(user);
        }

        // 验证失败处理
        if (loggedInUser == null || !passwordEncoder.matches(user.getPassword(),loggedInUser.getPassword())) {
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
    private String generateToken(User user) {
        try {
            // 签名密钥（确保安全性）
            Algorithm algorithm = Algorithm.HMAC256(Secret_Key);

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

    @GetMapping("/check-role")
    public Result checkRole(@ModelAttribute UserLoginDTO dto) {
        return Result.success(authService.checkRole(dto.getUsername()));
    }
}
