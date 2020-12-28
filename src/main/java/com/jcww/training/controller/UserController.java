package com.jcww.training.controller;

import com.jcww.training.pojo.User;
import com.jcww.training.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("login")
    @ResponseBody
    public User login(HttpSession session,String username,String password){
        User user=userService.login(username,password);
       if (user!=null){
           session.setAttribute("user",user);
           return user;
       }
        return null;
    }
}
