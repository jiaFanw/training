package com.jcww.training.service;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Shared;

import java.util.List;

public interface CJLService {
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

    int AddShared(Shared shared);

    List<Shared> MySharedByUserName(String myqus);

    Shared SharedViewID(Integer questionid);

    int SharedDeletePer(Integer questionid);
}