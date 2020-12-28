package com.jcww.training.controller;

import com.jcww.training.service.WZDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("WZD")
public class WZDController {
    @Autowired
    private WZDService wzdService;
}
