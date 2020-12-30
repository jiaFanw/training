package com.jcww.training.service.impl;

import com.jcww.training.mapper.UserMapper;
import com.jcww.training.pojo.User;
import com.jcww.training.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public User login(String username,String password) {
        return userMapper.login(username,password);
    }
}
