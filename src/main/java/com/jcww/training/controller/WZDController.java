package com.jcww.training.controller;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;
import com.jcww.training.service.WZDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("WZD")
public class WZDController {
    @Autowired
    private WZDService wzdService;
    @RequestMapping("messageList")
    @ResponseBody
    public List<Message> messageList(){

        return wzdService.messageList();
    }
    @RequestMapping("findById")
    @ResponseBody
    public Question findById(Integer questionid){
        return wzdService.findById(questionid);
    }
    @RequestMapping("changeIsNotShare")
    @ResponseBody
    public int changeIsNotShare(String isnotshare,Integer questionid){
        return wzdService.changeIsNotShare(isnotshare,questionid);
    }
}
