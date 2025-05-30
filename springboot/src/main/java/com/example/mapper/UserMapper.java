package com.example.mapper;

import com.example.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    /**
     * 根据邮箱查询用户
     * @param email 用户邮箱
     * @return 用户实体（不存在时返回null）
     */
    @Select("SELECT * FROM user WHERE email = #{email}")
    User selectByEmail(String email);

    @Insert({
            "INSERT INTO user (username, password, email, role, create_time)",
            "VALUES (#{username}, #{password}, #{email}, #{role}, #{createTime})"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(User user);

    @Select("SELECT COUNT(id) FROM user WHERE email = #{email}")
    boolean existsByEmail(String email);

    @Select("SELECT * FROM user WHERE feishu_user_id = #{feishuUserId}")
    User selectByFeishuId(String feishuUserId);

    @Select("SELECT * FROM user WHERE email = #{id}")
    User selectById(int id);

    @Select("select * from user where username = #{username}")
    User selectByUsername(String username);

    @Select("select role from user where username = #{username}")
    User selectRole(String username);
}
