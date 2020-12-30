package com.jcww.training.service;

import com.jcww.training.pojo.User;

public interface UserService {
    User login(String username,String password);
}
