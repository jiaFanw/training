package com.jcww.training.controller;

import com.jcww.training.service.JJGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("JJG")
public class JJGController {
    @Autowired
    private JJGService jjgService;
}
