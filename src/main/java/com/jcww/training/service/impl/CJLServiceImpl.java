package com.jcww.training.service.impl;

import com.jcww.training.mapper.CJLMapper;
import com.jcww.training.pojo.Question;
import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CJLServiceImpl implements CJLService {
    @Autowired
    private CJLMapper cjlMapper;

    @Override
    public List<Question> MyQuestionBank() {
        return cjlMapper.MyQuestionBank();
    }

    @Override
    public int DaoRu(List<Question> li) {
        return cjlMapper.DaoRu(li);
    }

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
}