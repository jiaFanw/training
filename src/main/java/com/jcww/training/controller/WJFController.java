package com.jcww.training.controller;

import com.jcww.training.service.WJFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("WJF")
public class WJFController {
    @Autowired
    private WJFService wjfService;

}