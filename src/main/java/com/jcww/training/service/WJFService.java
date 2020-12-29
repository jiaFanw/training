package com.jcww.training.service;

import com.jcww.training.pojo.Question;

import java.util.List;
import java.util.Map;

public interface WJFService {
    List<Map<String,Object>> getExam(String user);

    Boolean reduceNum(Integer testId, Integer userId);

    List<Question> danXuan(Integer testpaperid);

    List<Question> duoXuan(Integer testpaperid);

    List<Question> panDuan(Integer testpaperid);

    List<Question> tianKong(Integer testpaperid);

    List<Question> jianDa(Integer testpaperid);

    Map<String,Object> kaoShi(Integer testpaperid);

    List<Map<String,Object>> markPapers();

    List<Map<String,Object>> paper(Integer testpaperid);

    List<Map<String,Object>> testPeople(Integer testpaperid);
}
