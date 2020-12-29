package com.jcww.training.service.impl;

import com.jcww.training.mapper.WJFMapper;
import com.jcww.training.pojo.Question;
import com.jcww.training.service.WJFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class WJFServiceImpl implements WJFService {
    @Autowired
    private WJFMapper wjfMapper;


    @Override
    public List<Map<String, Object>> getExam(String user) {
        return wjfMapper.getExam(user);
    }

    @Override
    public Boolean reduceNum(Integer testId, Integer userId) {
        return wjfMapper.reduceNum(testId,userId);
    }

    @Override
    public List<Question> danXuan(Integer testpaperid) {
        return wjfMapper.danXuan(testpaperid);
    }

    @Override
    public List<Question> duoXuan(Integer testpaperid) {
        return wjfMapper.duoXuan(testpaperid);
    }

    @Override
    public List<Question> panDuan(Integer testpaperid) {
        return wjfMapper.panDuan(testpaperid);
    }

    @Override
    public List<Question> tianKong(Integer testpaperid) {
        return wjfMapper.tianKong(testpaperid);
    }

    @Override
    public List<Question> jianDa(Integer testpaperid) {
        return wjfMapper.jianDa(testpaperid);
    }

    @Override
    public Map<String, Object> kaoShi(Integer testpaperid) {
        return wjfMapper.kaoShi(testpaperid);
    }

    @Override
    public List<Map<String, Object>> markPapers() {
        return wjfMapper.markPapers();
    }

    @Override
    public List<Map<String, Object>> paper(Integer testpaperid) {
        return wjfMapper.paper(testpaperid);
    }

    @Override
    public List<Map<String, Object>> testPeople(Integer testpaperid) {
        return wjfMapper.testPeople(testpaperid);
    }


}
