package com.jcww.training.service;

import com.jcww.training.pojo.Question;

import java.util.List;

public interface CJLService {
    List<Question> MyQuestionBank();

    int DaoRu(List<Question> li);

    int danxuanAdd(Question question);

    int perDel(Integer questionid);

    Question ViewID(Integer questionid);

    int preup(Question question);
}