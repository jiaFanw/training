package com.jcww.training.service;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrganizingExaminationsService {
    //每次加载修改考试状态
    void  updateTestStatus();
    //组织考试全查
    List<Test> selectAllExaminationsBySome(String teststatus, String testname, String startTime, String endTime);
    //删除考试
    int deleteExaminationsByTestid(Long testid);
    //查询单个考试信息
    Test selectOneExaminationsByTestId(Long testid);
    //查询单个考试参考人数
    Test selectOneExaminationsByTestIdCount(Long testid);
    //查询单个考试考生名称
    List<Test> selectOneExaminationsByTestIdStu(Long testid);
    //添加考试
    Integer addExaminationsTest(Test test);
    //查询单选个数
    Question selectDanxuanCount(Integer questionclassifyid);
    //查询多选个数
    Question selectDuoxuanCount(Integer questionclassifyid);
    //查询判读个数
    Question selectPanduanCount(Integer questionclassifyid);
    //查询填空个数
    Question selecttiankongCount(Integer questionclassifyid);
    //查询简答个数
    Question selectjiandaCount(Integer questionclassifyid);
}