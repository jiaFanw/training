package com.jcww.training.mapper;

import com.jcww.training.pojo.MsgLog;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Useranswer;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface WJFMapper {

    List<Map<String,Object>> getExam(@Param("user") String user);

    Boolean reduceNum(@Param("testId") Integer testId, @Param("userId") Integer userId);

    List<Question> danXuan(@Param("testpaperid") Integer testpaperid);

    List<Question> duoXuan(@Param("testpaperid") Integer testpaperid);

    List<Question> panDuan(@Param("testpaperid") Integer testpaperid);

    List<Question> tianKong(@Param("testpaperid") Integer testpaperid);

    List<Question> jianDa(@Param("testpaperid") Integer testpaperid);

    Map<String,Object> kaoShi(@Param("testpaperid") Integer testpaperid);


    List<Map<String,Object>> markPapers();

    List<Map<String,Object>> paper(@Param("testpaperid") Integer testpaperid);

    List<Map<String,Object>> testPeople(@Param("testpaperid") Integer testpaperid);

    List<Map<String,Object>> staffData(@Param("user") String user);

    Boolean daAn(Useranswer us);

    List<Question> allQuestions(@Param("testpaperid")Integer testpaperid);

    Boolean upDaAn(Useranswer us);

    List<Useranswer> userAnswer(@Param("testpaperid") Integer testpaperid,@Param("userId") Integer userId);

    Boolean panJuan(Useranswer us);

    Boolean fen(@Param("testpaperid") int testpaperid,@Param("userId") int userId);

    Boolean faBu(@Param("testpaperid")Integer testpaperid,@Param("userId") Integer userId);

    int update(MsgLog msgLog);

    int save(MsgLog msgLog);

    List<MsgLog> list(Map<String,Object> map);
}
