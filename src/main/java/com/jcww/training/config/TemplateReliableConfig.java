package com.jcww.training.config;

import com.jcww.training.pojo.MsgLog;
import com.jcww.training.service.WJFService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Date;
import java.util.UUID;

@Configuration
public class TemplateReliableConfig {

    @Autowired
    private WJFService wjfService;

    @Bean(name = "TemplateRaliable")
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory){
        RabbitTemplate rabbitTemplate = new RabbitTemplate();
        rabbitTemplate.setConnectionFactory(connectionFactory);
        //设置开启Mandatory,才能触发回调函数,无论消息推送结果怎么样都强制调用回调函数
        rabbitTemplate.setMandatory(true);
        ;
        //关于两个的回调说明：
        //     * 1.如果消息没有到exchange,则confirm回调,ack=false
        //     * 2.如果消息到达exchange,则confirm回调,ack=true
        //     * 3.exchange到queue成功,则不回调return
        //     * 4.exchange到queue失败,则回调return(需设置mandatory=true,否则不回调,消息就丢了)
        rabbitTemplate.setConfirmCallback(new RabbitTemplate.ConfirmCallback() {
            @Override
            public void confirm(CorrelationData correlationData, boolean ack, String cause) {
                if (ack) {
                    MsgLog msgLog = new MsgLog();
                    msgLog.setMsgId(correlationData.getId());
                    msgLog.setStatus(1);
                    wjfService.update(msgLog);
                }
            }
        });

        rabbitTemplate.setReturnCallback(new RabbitTemplate.ReturnCallback() {
            @Override
            public void returnedMessage(Message message, int replyCode, String replyText, String exchange, String routingKey) {

                //新增一条状态为4的消息，有运维人员进行人为的兜底操作
                String uuid = UUID.randomUUID().toString();
                Date date = new Date();

                MsgLog msgLog = new MsgLog();
                msgLog.setMsgId(uuid);
                msgLog.setMsg(message.toString());
                msgLog.setExchange(exchange);
                msgLog.setRoutingKey(routingKey);
                msgLog.setStatus(4);
                msgLog.setTryCount(0);
                msgLog.setNextTryTime(date);
                msgLog.setCreateTime(date);
                msgLog.setUpdateTime(date);
                wjfService.save(msgLog);
            }
        });

        return rabbitTemplate;
    }
}

