package com.jcww.training.service.impl;

import com.jcww.training.mapper.WZDMapper;
import com.jcww.training.pojo.*;
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
    public Test dataTable2(int id) {
        return wzdMapper.dataTable2(id);
    }

    @Override
    public List<Testuser> personInfo(Integer id) {
        return wzdMapper.personInfo(id);
    }

    @Override
    public List<Testuser> showWho(Integer id) {
        return wzdMapper.showWho(id);
    }

    @Override
    public List<Testuser> personInfo2(Integer jobnumber) {
        return wzdMapper.personInfo2(jobnumber);
    }

    @Override
    public List<Testuser> personInfo3() {
        return wzdMapper.personInfo3();
    }

    @Override
    public List<Article> article() {
        return wzdMapper.article();
    }

    @Override
    public int deleteById(int id) {
        return wzdMapper.deleteById(id);
    }

    @Override
    public int articleAdd(String title,String str) {

        return wzdMapper.articleAdd(title,str);
    }
}
