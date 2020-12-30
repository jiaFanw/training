package com.jcww.training.controller;

import com.jcww.training.pojo.Paper;
import com.jcww.training.pojo.User;
import com.jcww.training.service.QuestionBankService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("QuestionBank")
public class QuestionBankController {
    @Resource
    private QuestionBankService questionBankService;
    //添加点赞列表
    @RequestMapping("insertAssistcollection")
    @ResponseBody
    public void insertAssistcollection(){
        questionBankService.insertAssistcollection();
    }
    //试卷库全查
    @RequestMapping("selectAllQuestionBankBySome")
    @ResponseBody
    public List<User> selectAllQuestionBankBySome(String truename ,Long collectionstates, String startTime, String endTime, String paperName) {
        return questionBankService.selectAllQuestionBankBySome(truename,collectionstates,startTime,endTime,paperName);
    }
    //点赞
    @RequestMapping("updateAssistStatus")
    @ResponseBody
    public int updateAssistStatus(Integer paperid, Integer userid) {
        return questionBankService.updateAssistStatus(paperid, userid);
    }
    //收藏
    @RequestMapping("updateCollectionStatus")
    @ResponseBody
    public int updateCollectionStatus(Integer paperid, Integer userid) {
        return questionBankService.updateCollectionStatus(paperid, userid);
    }
    //试卷库查询题目数量
    @RequestMapping("selectOneQuestionCountOfQuestionBankByPaperID")
    @ResponseBody
    public Paper selectOneQuestionCountOfQuestionBankByPaperID(Long paperid) {
        return questionBankService.selectOneQuestionCountOfQuestionBankByPaperID(paperid);
    }
}
