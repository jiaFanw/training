package com.jcww.training.controller;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Test;
import com.jcww.training.pojo.User;
import com.jcww.training.service.OrganizingExaminationsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("OrganizingExaminations")
public class OrganizingExaminationsController {
    @Resource
    OrganizingExaminationsService organizingExaminationsService;
    //每次加载修改考试状态
    @RequestMapping("updateTestStatus")
    @ResponseBody
    public void updateTestStatus(){
        organizingExaminationsService.updateTestStatus();
    }
    //组织考试全查
    @RequestMapping("selectAllExaminationsBySome")
    @ResponseBody
    public List<Test> selectAllExaminationsBySome(String teststatus,String testname,String startTime,String endTime){
        return organizingExaminationsService.selectAllExaminationsBySome(teststatus,testname,startTime,endTime);
    }
    //删除考试
    @RequestMapping("deleteExaminationsByTestid")
    @ResponseBody
    public int deleteExaminationsByTestid(Long testid){
        return organizingExaminationsService.deleteExaminationsByTestid(testid);
    }
    //查询单个考试信息
    @RequestMapping("selectOneExaminationsByTestId")
    @ResponseBody
    public Test selectOneExaminationsByTestId(Long testid){
        return organizingExaminationsService.selectOneExaminationsByTestId(testid);
    }
    //查询单个考试参考人数
    @RequestMapping("selectOneExaminationsByTestIdCount")
    @ResponseBody
    public Test selectOneExaminationsByTestIdCount(Long testid){
        return organizingExaminationsService.selectOneExaminationsByTestIdCount(testid);
    }
    //查询单个考试考生名称
    @RequestMapping("selectOneExaminationsByTestIdStu")
    @ResponseBody
    public List<Test> selectOneExaminationsByTestIdStu(Long testid){
        return organizingExaminationsService.selectOneExaminationsByTestIdStu(testid);
    }
    //添加考试
    @RequestMapping("addExaminationsTest")
    @ResponseBody
    public Integer addExaminationsTest(Test test) {
        Integer i =  organizingExaminationsService.addExaminationsTest(test);
        return i;
    }
    //查询单选个数
    @RequestMapping("selectDanxuanCount")
    @ResponseBody
    public Question selectDanxuanCount(Long questionclassifyid) {
        return organizingExaminationsService.selectDanxuanCount(questionclassifyid);
    }
    //查询多选个数
    @RequestMapping("selectDuoxuanCount")
    @ResponseBody
    public Question selectDuoxuanCount(Long questionclassifyid) {
        return organizingExaminationsService.selectDuoxuanCount(questionclassifyid);
    }
    //查询判读个数
    @RequestMapping("selectPanduanCount")
    @ResponseBody
    public Question selectPanduanCount(Long questionclassifyid) {
        return organizingExaminationsService.selectPanduanCount(questionclassifyid);
    }
    //查询填空个数
    @RequestMapping("selecttiankongCount")
    @ResponseBody
    public Question selecttiankongCount(Long questionclassifyid) {
        return organizingExaminationsService.selecttiankongCount(questionclassifyid);
    }
    //查询简答个数
    @RequestMapping("selectjiandaCount")
    @ResponseBody
    public Question selectjiandaCount(Long questionclassifyid) {
        return organizingExaminationsService.selectjiandaCount(questionclassifyid);
    }

    //查询所有考生（根据地名查询）
    @RequestMapping("selectAreaUserList")
    @ResponseBody
    public List<User> selectAreaUserList(Long areaid) {
        return organizingExaminationsService.selectAreaUserList(areaid);
    }

    //查询所有试题
    @RequestMapping("selectQuestionList")
    @ResponseBody
    public List<Question> selectQuestionList(Long questionclassifyid, Long questiontype) {
        return organizingExaminationsService.selectQuestionList(questionclassifyid, questiontype);
    }

}
