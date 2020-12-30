package com.jcww.training.service.impl;

import com.jcww.training.mapper.QuestionBankMapper;
import com.jcww.training.pojo.Paper;
import com.jcww.training.pojo.User;
import com.jcww.training.service.QuestionBankService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class QuestionBankServiceImpl implements QuestionBankService {
    @Resource
    private QuestionBankMapper questionBankMapper;
    //添加点赞列表
    @Override
    public int insertAssistcollection() {
        return questionBankMapper.insertAssistcollection();
    }
    //
    //试卷库全查
    @Override
    public List<User> selectAllQuestionBankBySome(String truename, Long collectionstates,String startTime, String endTime,  String paperName) {
        return questionBankMapper.selectAllQuestionBankBySome(truename ,collectionstates,startTime, endTime, paperName);
        //
    }
    //点赞
    @Override
    public int updateAssistStatus(Integer paperid, Integer userid) {
        return questionBankMapper.updateAssistStatus(paperid, userid);
    }
    //收藏
    @Override
    public int updateCollectionStatus(Integer paperid, Integer userid) {
        return questionBankMapper.updateCollectionStatus(paperid, userid);
    }
    //试卷库查询题目数量
    @Override
    public Paper selectOneQuestionCountOfQuestionBankByPaperID(Long paperid) {
        return questionBankMapper.selectOneQuestionCountOfQuestionBankByPaperID(paperid);
    }
}
