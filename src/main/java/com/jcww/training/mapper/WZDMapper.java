package com.jcww.training.mapper;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;

import java.util.List;

public interface WZDMapper {
    List<Message> messageList();

    Question findById(Integer questionid);
}
