package com.jcww.training.controller;

import com.jcww.training.pojo.Power;
import com.jcww.training.pojo.User;
import com.jcww.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService ms;
    @RequestMapping("leftTree")
    @ResponseBody
    public List<Power> leftTree(HttpSession session){
        User user=(User) session.getAttribute("user");
        int roleid=user.getRoleid();
        return ms.leftTree(roleid);
    }

}
