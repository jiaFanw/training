package com.jcww.training.controller;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.service.WJFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("WJF")
public class WJFController {
    @Autowired
    private WJFService wjfService;

    @GetMapping("/getExam/{user}")
    public List<Map<String,Object>> getExam(@PathVariable String user){
        List<Map<String,Object>> list = wjfService.getExam(user);
        for (Map<String,Object> map:list) {
            String teststarttime = map.get("teststarttime").toString().substring(11);
            String testendtime = map.get("testendtime").toString().substring(11);
            map.put("test",teststarttime+"-"+testendtime);
        }
        return list;
    }


    @RequestMapping("/reduceNum")
    public Boolean reduceNum(@RequestBody Map<String,Integer> map){
        return wjfService.reduceNum(map.get("testId"),map.get("userId"));
    }


    @RequestMapping("/danXuan/{testpaperid}")
    public List<Question> danXuan(@PathVariable Integer testpaperid){
        return wjfService.danXuan(testpaperid);
    }


    //duoXuan
    @RequestMapping("/duoXuan/{testpaperid}")
    public List<Question> duoXuan(@PathVariable Integer testpaperid){
        return wjfService.duoXuan(testpaperid);
    }

    //panDuan
    @RequestMapping("/panDuan/{testpaperid}")
    public List<Question> panDuan(@PathVariable Integer testpaperid){
        return wjfService.panDuan(testpaperid);
    }

    //tianKong
    @RequestMapping("/tianKong/{testpaperid}")
    public List<Question> tianKong(@PathVariable Integer testpaperid){
        return wjfService.tianKong(testpaperid);
    }


    @RequestMapping("/jianDa/{testpaperid}")
    public List<Question> jianDa(@PathVariable Integer testpaperid){
        return wjfService.jianDa(testpaperid);
    }

    @RequestMapping("/kaoShi/{testpaperid}")
    public Map<String,Object> kaoShi(@PathVariable Integer testpaperid){
        return wjfService.kaoShi(testpaperid);
    }


    @RequestMapping("/jiaoJuan")
    public Boolean jiaoJuan(@RequestBody Map<String,Integer> map){
        System.out.println(map.get("testpaperid"));
        System.out.println(map.get("testId"));
        System.out.println(map.get("userId"));
        return false;
    }




}