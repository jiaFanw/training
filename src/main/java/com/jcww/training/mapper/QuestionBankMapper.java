package com.jcww.training.mapper;

import com.jcww.training.pojo.Paper;
import com.jcww.training.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface QuestionBankMapper {
    //添加点赞列表
    int insertAssistcollection();
    //试卷库全查
    List<User> selectAllQuestionBankBySome(@Param("truename") String truename, @Param("collectionstates") Long collectionstates, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("paperName") String paperName);
    //点赞
    int updateAssistStatus(@Param("paperid") Integer paperid, @Param("userid") Integer userid);
    //收藏
    int updateCollectionStatus(@Param("paperid") Integer paperid, @Param("userid") Integer userid);
    //试卷库查询题目数量
    Paper selectOneQuestionCountOfQuestionBankByPaperID(@Param("paperid") Long paperid);
}
