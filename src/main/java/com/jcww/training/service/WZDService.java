package com.jcww.training.service;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;

import java.util.List;

public interface WZDService {
    List<Message> messageList();

    Question findById(Integer questionid);

    int changeIsNotShare(String isnotshare,Integer questionid);

    List<Test> dataTable();

    int cjrs(int id);

    int tgrs(int id);

    Test tgl(int id);

    int pjf(int id);
}
