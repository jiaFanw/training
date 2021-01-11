package com.jcww.training.service;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.pojo.User;
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
    Question selectDanxuanCount(Long questionclassifyid);
    //查询多选个数
    Question selectDuoxuanCount(Long questionclassifyid);
    //查询判读个数
    Question selectPanduanCount(Long questionclassifyid);
    //查询填空个数
    Question selecttiankongCount(Long questionclassifyid);
    //查询简答个数
    Question selectjiandaCount(Long questionclassifyid);
    //查询所有考生（根据地名查询）
    List<User> selectAreaUserList(Long areaid);
    //查询所有试题
    List<Question> selectQuestionList(Long questionclassifyid, Long questiontype);
}
