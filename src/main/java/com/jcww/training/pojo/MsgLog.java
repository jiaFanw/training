package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class MsgLog implements Serializable {
    String msgId;
    String msg;
    String exchange;
    String routingKey;
    Integer status;
    Integer tryCount;
    Date nextTryTime;
    Date createTime;
    Date updateTime;
}
