package com.jcww.training.service.impl;

import com.jcww.training.mapper.WZDMapper;
import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.service.WZDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WZDServiceImpl implements WZDService {
    @Autowired
    private WZDMapper wzdMapper;

    @Override
    public List<Message> messageList() {
        return wzdMapper.messageList();
    }

    @Override
    public Question findById(Integer questionid) {
        return wzdMapper.findById(questionid);
    }

    @Override
    public int changeIsNotShare(String isnotshare, Integer questionid) {
        return wzdMapper.changeIsNotShare(isnotshare, questionid);
    }

    @Override
    public List<Test> dataTable() {
        return wzdMapper.dataTable();
    }

    @Override
    public int cjrs(int id) {
        return wzdMapper.cjrs(id);
    }

    @Override
    public int tgrs(int id) {
        return wzdMapper.tgrs(id);
    }

    @Override
    public Test tgl(int id) {
        return wzdMapper.tgl(id);
    }

    @Override
    public int pjf(int id) {
        return wzdMapper.pjf(id);
    }

    @Override
    public int wcjrs(int id) {
        return wzdMapper.wcjrs(id);
    }

    @Override
    public List<Test> dataTable2(int id) {
        return wzdMapper.dataTable2(id);
    }
}
