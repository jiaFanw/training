package com.jcww.training.service.impl;

import com.jcww.training.mapper.CJLMapper;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Shared;
import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CJLServiceImpl implements CJLService {
    @Autowired
    private CJLMapper cjlMapper;

    @Override
    public int danxuanAdd(Question question) {
        return cjlMapper.danxuanAdd(question);
    }

    @Override
    public int perDel(Integer questionid) {
        return cjlMapper.perDel(questionid);
    }

    @Override
    public Question ViewID(Integer questionid) {
        return cjlMapper.ViewID(questionid);
    }

    @Override
    public int preup(Question question) {
        return cjlMapper.preup(question);
    }

    @Override
    public List<Question> MyQuestionBank(String myqus) {
        return cjlMapper.MyQuestionBank(myqus);
    }

    @Override
    public List<Question> SharedQuestionBank() {
        return cjlMapper.SharedQuestionBank();
    }

    @Override
    public List<Question> SharedQuestionBankshenhe() {
        return cjlMapper.SharedQuestionBankshenhe();
    }

    @Override
    public int SharedTurnDown(Question question) {
        return cjlMapper.SharedTurnDown(question);
    }

    @Override
    public int SharedBy(Question question) {
        return cjlMapper.SharedBy(question);
    }

    @Override
    public int ApplicationSH(Question question) {
        return cjlMapper.ApplicationSH(question);
    }

    @Override
    public int AddShared(Shared shared) {
        return cjlMapper.AddShared(shared);
    }

    @Override
    public List<Shared> MySharedByUserName(String myqus) {
        return cjlMapper.MySharedByUserName(myqus);
    }

    @Override
    public Shared SharedViewID(Integer questionid) {
        return cjlMapper.SharedViewID(questionid);
    }

    @Override
    public int SharedDeletePer(Integer questionid) {
        return cjlMapper.SharedDeletePer(questionid);
    }
}