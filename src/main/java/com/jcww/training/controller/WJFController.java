package com.jcww.training.controller;

import com.alibaba.fastjson.JSON;
import com.jcww.training.config.Config;
import com.jcww.training.pojo.*;
import com.jcww.training.service.WJFService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("WJF")
public class WJFController {
    @Autowired
    private WJFService wjfService;

    @Resource(name = "TemplateRaliable")
    private RabbitTemplate templateRaliable;

    //员工考试页面，在线考试
    @GetMapping("/getExam/{user}")
    public List<Map<String,Object>> getExam(@PathVariable String user){
        List<Map<String,Object>> list = wjfService.getExam(user);
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //员工进入考试
    @RequestMapping("/reduceNum")
    public Boolean reduceNum(@RequestBody Map<String,Integer> map){
        return wjfService.reduceNum(map.get("testId"),map.get("userId"));
    }


    //试卷中单选试题
    @RequestMapping("/danXuan/{testpaperid}")
    public List<Question> danXuan(@PathVariable Integer testpaperid){
        return wjfService.danXuan(testpaperid);
    }


    //试卷中多选试题
    @RequestMapping("/duoXuan/{testpaperid}")
    public List<Question> duoXuan(@PathVariable Integer testpaperid){
        return wjfService.duoXuan(testpaperid);
    }

    //试卷中判断试题
    @RequestMapping("/panDuan/{testpaperid}")
    public List<Question> panDuan(@PathVariable Integer testpaperid){
        return wjfService.panDuan(testpaperid);
    }

    //试卷中填空试题
    @RequestMapping("/tianKong/{testpaperid}")
    public List<Question> tianKong(@PathVariable Integer testpaperid){
        return wjfService.tianKong(testpaperid);
    }


    //试卷中简答试题
    @RequestMapping("/jianDa/{testpaperid}")
    public List<Question> jianDa(@PathVariable Integer testpaperid){
        return wjfService.jianDa(testpaperid);
    }

    //试卷考试的基本信息（试卷名称，总分，题目数量）
    @RequestMapping("/kaoShi/{testpaperid}")
    public Map<String,Object> kaoShi(@PathVariable Integer testpaperid){
        return wjfService.kaoShi(testpaperid);
    }


    //员工答题完成，交卷
    @RequestMapping("/jiaoJuan")
    public String jiaoJuan(@RequestBody Map<String,Object> map){
        try {
            String uuid = UUID.randomUUID().toString();
            Date date = new Date();
            String msg = JSON.toJSONString(map);

            MsgLog msgLog = new MsgLog();
            msgLog.setMsgId(uuid);

            msgLog.setMsg(msg);
            msgLog.setExchange("direct.no.exchange");
            msgLog.setRoutingKey("direct.routing.key.name");
            msgLog.setStatus(-1);
            msgLog.setTryCount(0);
            msgLog.setNextTryTime(date);
            msgLog.setCreateTime(date);
            msgLog.setUpdateTime(date);

            wjfService.save(msgLog);

            Message message = MessageBuilder.withBody(map.toString().getBytes()).setMessageId(uuid).build();

            templateRaliable.convertAndSend(
                    "direct.no.exchange",
                    "direct.routing.key.name",
                    map,
                    new CorrelationData(uuid));
            return "ok";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }


    //判卷人，需要批改的试卷
    @RequestMapping("/markPapers")
    public List<Map<String,Object>> markPapers(){
        List<Map<String,Object>> list = wjfService.markPapers();
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //批改试卷，考试详情
    @RequestMapping("/paper")
    public List<Map<String,Object>> paper(@RequestBody Map<String,Integer> param){
        List<Map<String,Object>> list = wjfService.paper(param.get("testpaperid"));
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        System.out.println(list);
        return list;
    }

    //当前考试参与考人员
    @RequestMapping("/testPeople")
    public List<Map<String,Object>> testPeople(@RequestBody Map<String,Integer> param){
        return wjfService.testPeople(param.get("testpaperid"));
    }

    //员工查询批改完成的成绩
    @RequestMapping("/staffData")
    public List<Map<String,Object>> staffData(@RequestBody Map<String,String> user){
        List<Map<String,Object>> list = wjfService.staffData(user.get("user"));
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11,16);
            String testendtime = map.get("testendtime").toString().substring(11,16);
            map.put("test",teststarttime+"-"+testendtime);
        }
        return list;
    }

    //获取员工的答案
    @RequestMapping("/userAnswer")
    public List<Useranswer> userAnswer(@RequestBody Map<String,Integer> user){
        return wjfService.userAnswer(user);
    }


    //判卷人，判卷完成
    @RequestMapping("/panJuan")
    public Boolean panJuan(@RequestBody Map<String,Object> map){
        return wjfService.panJuan(map);
    }

    //判卷人发布成绩
    @RequestMapping("/faBu")
    public Boolean faBu(@RequestBody Map<String,Integer> map){
        return wjfService.faBu(map.get("testpaperid"),map.get("userId"));
    }



}
