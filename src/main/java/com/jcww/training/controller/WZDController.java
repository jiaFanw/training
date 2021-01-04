package com.jcww.training.controller;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
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
    @RequestMapping("dataTable")
    @ResponseBody
    public List<Test> dataTable(){
        return wzdService.dataTable();
    }
    /*下边是单SQL 的值 */

    //参加人数
    @RequestMapping("cjrs")
    @ResponseBody
    public int cjrs(int id){

        return wzdService.cjrs(id);
    }
    //通过人数
    @RequestMapping("tgrs")
    @ResponseBody
    public int tgrs(int id){

        return wzdService.tgrs(id);
    }
    //通过率
    @RequestMapping("tgl")
    @ResponseBody
    public Test tgl(int id){
        return wzdService.tgl(id);
    }
    //平均分
    @RequestMapping("pjf")
    @ResponseBody
    public int pjf(int id){

        return wzdService.pjf(id);
    }
}
