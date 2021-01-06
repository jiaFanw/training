package com.jcww.training.controller;

import com.jcww.training.service.WJFService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.util.Map;


@Configuration
public class Revice {

    @Autowired
    WJFService wjfService;

    @RabbitListener(queues = "direct.no.queue")
    public void recive(Map< String,Object> map){
        System.out.println(map);
        wjfService.jiaoJuan(map);
    }
}
