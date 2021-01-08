package com.jcww.training.service.impl;

import com.jcww.training.mapper.OrganizingExaminationsMapper;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.pojo.User;
import com.jcww.training.service.OrganizingExaminationsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrganizingExaminationsServiceImpl implements OrganizingExaminationsService {
    @Resource
    private OrganizingExaminationsMapper organizingExaminationsMapper;

    //每次加载修改考试状态
    @Override
    public void updateTestStatus() {
        organizingExaminationsMapper.updateTestStatus();
    }
    //组织考试全查
    @Override
    public List<Test> selectAllExaminationsBySome(String teststatus, String testname, String startTime, String endTime) {
        return organizingExaminationsMapper.selectAllExaminationsBySome(teststatus,testname,startTime,endTime);
    }
    //删除考试
    @Override
    public int deleteExaminationsByTestid(Long testid) {
        return organizingExaminationsMapper.deleteExaminationsByTestid(testid);
    }
    //查询单个考试信息
    @Override
    public Test selectOneExaminationsByTestId(Long testid) {
        return organizingExaminationsMapper.selectOneExaminationsByTestId(testid);
    }
    //查询单个考试参考人数
    @Override
    public Test selectOneExaminationsByTestIdCount(Long testid) {
        return organizingExaminationsMapper.selectOneExaminationsByTestIdCount(testid);
    }
    //查询单个考试考生名称
    @Override
    public List<Test> selectOneExaminationsByTestIdStu(Long testid) {
        return organizingExaminationsMapper.selectOneExaminationsByTestIdStu(testid);
    }
    //添加考试
    @Override
    public Integer addExaminationsTest(Test test) {
        return organizingExaminationsMapper.addExaminationsTest(test);
    }
    //查询单选个数
    @Override
    public Question selectDanxuanCount(Integer questionclassifyid) {
        return organizingExaminationsMapper.selectDanxuanCount(questionclassifyid);
    }
    //查询多选个数
    @Override
    public Question selectDuoxuanCount(Integer questionclassifyid) {
        return organizingExaminationsMapper.selectDuoxuanCount(questionclassifyid);
    }
    //查询判读个数
    @Override
    public Question selectPanduanCount(Integer questionclassifyid) {
        return organizingExaminationsMapper.selectPanduanCount(questionclassifyid);
    }
    //查询填空个数
    @Override
    public Question selecttiankongCount(Integer questionclassifyid) {
        return organizingExaminationsMapper.selecttiankongCount(questionclassifyid);
    }
    //查询简答个数
    @Override
    public Question selectjiandaCount(Integer questionclassifyid) {
        return organizingExaminationsMapper.selectjiandaCount(questionclassifyid);
    }

    @Override
    public List<User> selectAreaUserList(Long areaid) {
        return organizingExaminationsMapper.selectAreaUserList(areaid);
    }

    @Override
    public List<Question> selectQuestionList(Long questionclassifyid, Long questiontype) {
        return organizingExaminationsMapper.selectQuestionList(questionclassifyid,questiontype);
    }
}
