package com.jcww.training.mapper;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrganizingExaminationsMapper {
    //每次加载修改考试状态
    void  updateTestStatus();
    //组织考试全查
    List<Test> selectAllExaminationsBySome(@Param("teststatus") String teststatus, @Param("testname") String testname,
                                           @Param("startTime") String startTime, @Param("endTime") String endTime);
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

    //查询所有考生（根据地名查询）
    List<User> selectAreaUserList(Long areaid);
    //查询所有试题
    List<Question> selectQuestionList(@Param("questionclassifyid") Long questionclassifyid,@Param("questiontype")Long questiontype);

}
