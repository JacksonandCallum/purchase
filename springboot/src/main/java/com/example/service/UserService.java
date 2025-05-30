package com.example.service;

import com.example.entity.Account;
import com.example.entity.User;
import com.example.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;


    public User selectById(int userId) {
        return userMapper.selectById(userId);
    }
}
