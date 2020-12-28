package com.jcww.training.controller;

import com.jcww.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService ms;

}
