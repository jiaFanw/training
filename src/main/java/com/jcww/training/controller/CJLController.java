package com.jcww.training.controller;

import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("CJL")
public class CJLController {
    @Autowired
    private CJLService cjlService;
}
