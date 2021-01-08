package com.jcww.training.service;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Share;

import java.util.List;

public interface CJLService {
    List<Question> QuestionBank();

    int danxuanAdd(Question question);

    int perDel(Integer questionid);

    Question ViewID(Integer questionid);

    int preup(Question question);

    List<Question> MyQuestionBank(String myqus);

    List<Question> SharedQuestionBank();

    List<Question> SharedQuestionBankshenhe();

    int SharedTurnDown(Question question);

    int SharedBy(Question question);

    int ApplicationSH(Question question);

    int AddShared(Share share);

    Share ViewName(String questionname, String createusername);
}