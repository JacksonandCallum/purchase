package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.dto.feishu.FeishuUserInfo;
import com.example.dto.request.UserRegisterDTO;
import com.example.entity.InvitationCode;
import com.example.entity.User;
import com.example.exception.BusinessException;
import com.example.exception.CustomException;
import com.example.mapper.InvitationCodeMapper;
import com.example.mapper.UserMapper;
import com.example.utils.StringUtils;
import com.example.utils.TokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.integration.redis.util.RedisLockRegistry;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.Email;
import java.util.Date;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;

@Service
@RequiredArgsConstructor
@Transactional
public class AuthService {
    private final UserMapper userMapper;
    private final InvitationCodeMapper CodeMapper;
    //private final FeishuService feishuService;
    private final PasswordEncoder passwordEncoder;
    private final RedisLockRegistry redisLockRegistry;


    public void register(UserRegisterDTO dto) {

        // 分布式锁防止重复注册
        Lock lock = redisLockRegistry.obtain("register:" + dto.getEmail());
        boolean acquired = false; // 标记是否成功获取锁
        try {
            acquired = lock.tryLock(3, TimeUnit.SECONDS);
            if (acquired) {  // 成功获取锁
                checkUserExists(dto.getEmail());
                validateInviteCodeIfNeeded(dto);

                User user = buildUserEntity(dto);
                userMapper.insert(user);
            }else {
                // 未获取到锁，可根据业务需求处理（例如抛出异常或忽略）
                throw new BusinessException("注册操作太频繁，请稍后重试");
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new BusinessException("注册请求被中断");
        } finally {
            if (acquired) { // 仅在明确获取到锁时释放
                lock.unlock();
            }
        }
    }

    /**
     * 检查邮箱是否已注册
     * @param email 待验证的邮箱
     * @throws BusinessException 如果邮箱已注册
     */
    private void checkUserExists(String email) {
        if (userMapper.selectByEmail(email) != null) {
            throw new BusinessException("该邮箱已注册");
        }
    }

    /**
     * 验证邀请码有效性（仅管理员需要）
     * @param dto 用户注册DTO
     * @throws BusinessException 邀请码无效时抛出异常
     */
    private void validateInviteCodeIfNeeded(UserRegisterDTO dto) {
        if ("ADMIN".equalsIgnoreCase(dto.getRole())) {
            if (dto.getInviteCode() == null || dto.getInviteCode().trim().isEmpty()) {
                throw new BusinessException("管理员注册必须提供邀请码");
            }

            // 获取原始邀请码
            String rawInviteCode = dto.getInviteCode().trim();

            // 查询有效邀请码
            InvitationCode code = CodeMapper.selectValidCode(dto.getInviteCode());

            // 验证逻辑
            validateInvitationCode(rawInviteCode,code, dto.getEmail());

            // 验证通过后更新状态
            CodeMapper.updateStatus(dto.getInviteCode(), 1);

            // 更新使用次数（添加空指针防御）
            CodeMapper.incrementUsedCount(Objects.requireNonNull(code).getId());
        }
    }

    /**
     * 具体邀请码验证逻辑
     */
    private void validateInvitationCode(String rawInviteCode,InvitationCode code, String email) {
        // 先检查邀请码是否存在（直接通过 selectValidCode 的结果判断）
        if (code == null) {
            // 查询原始邀请码（不考虑有效性）
            InvitationCode rawCode = CodeMapper.selectByCode(rawInviteCode);

            if (rawCode == null) {
                throw new BusinessException("邀请码不存在");
            }
            // 邀请码存在但无效，检查具体原因
            if (rawCode.getStatus() != 0) {
                throw new BusinessException("邀请码已被禁用");
            }
            if (rawCode.getExpireTime().before(new Date())) {
                throw new BusinessException("邀请码已过期");
            }
            if (rawCode.getUsedCount() >= rawCode.getUseCount()) {
                throw new BusinessException("邀请码已达到使用上限");
            }
            // 默认情况（理论上不会执行到这里）
            throw new BusinessException("无效的邀请码");
        }

        // 检查绑定邮箱（如果存在）
        if (StringUtils.hasText(code.getBindEmail())) {
            if (!code.getBindEmail().equalsIgnoreCase(email)) {
                throw new BusinessException("邀请码与邮箱不匹配");
            }
        }
    }


    /**
     * 构建用户实体
     * @param dto 注册请求数据
     * @return 用户实体
     */
    private User buildUserEntity(UserRegisterDTO dto) {
        return User.builder()
                .email(dto.getEmail())
                .username(dto.getUsername())
                .password(passwordEncoder.encode(dto.getPassword())) // 密码加密
                .role(determineUserRole(dto.getRole())) // 角色处理
                .createTime(new Date())
                .build();
    }

    /**
     * 角色验证处理
     */
    private String determineUserRole(String inputRole) {
        return "ADMIN".equalsIgnoreCase(inputRole) ? "ADMIN" : "USER";
    }

    @Transactional(readOnly = true)  // 在查询方法上添加只读事务
    public boolean checkEmailExists(String email) {
        return userMapper.existsByEmail(email);
    }

    public FeishuUserInfo getFeishuUserInfo(@Email String email) {
        return null;
    }

    /**
     * 管理员登陆
     * @param user
     * @return
     */
    public User loginAdmin(User user) {
        User dbAdmin = userMapper.selectByUsername(user.getUsername());
        if (ObjectUtil.isNull(dbAdmin)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if(!passwordEncoder.matches(user.getPassword(),dbAdmin.getPassword())){
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbAdmin.getId() + "-" + RoleEnum.ADMIN.name();
        String token = TokenUtils.createToken(tokenData, dbAdmin.getPassword());
        dbAdmin.setToken(token);
        return dbAdmin;
    }

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User loginUser(User user) {
        User dbUser = userMapper.selectByUsername(user.getUsername());
        if (ObjectUtil.isNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!passwordEncoder.matches(user.getPassword(),dbUser.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbUser.getId() + "-" + RoleEnum.USER.name();
        String token = TokenUtils.createToken(tokenData, dbUser.getPassword());
        dbUser.setToken(token);
        return dbUser;
    }

    public User checkRole(String username) {
        return userMapper.selectRole(username);
    }
}
