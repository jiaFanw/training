package com.jcww.training.service;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;

import java.util.List;

public interface WZDService {
    List<Message> messageList();

    Question findById(Integer questionid);
}
