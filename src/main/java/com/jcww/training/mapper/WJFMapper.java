package com.jcww.training.mapper;

import com.jcww.training.pojo.Question;
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
}
