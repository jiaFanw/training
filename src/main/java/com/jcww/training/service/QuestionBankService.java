package com.jcww.training.service;

import com.jcww.training.pojo.Paper;
import com.jcww.training.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface QuestionBankService {
    //添加点赞列表
    int insertAssistcollection();
    //试卷库全查
    List<User> selectAllQuestionBankBySome(String truename, Long collectionstates, String startTime, String endTime, String paperName);
    //点赞
    int updateAssistStatus(Integer paperid, Integer userid);
    //收藏
    int updateCollectionStatus(Integer paperid, Integer userid);
    //试卷库查询题目数量
    Paper selectOneQuestionCountOfQuestionBankByPaperID(Long paperid);
}
