package com.jcww.training.service;

import com.jcww.training.pojo.MsgLog;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Useranswer;
import com.jcww.training.pojo.Video;

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

    List<Map<String,Object>> staffData(String user);

    Boolean jiaoJuan(Map<String,Object> map);

    List<Question> allQuestions(Integer testpaperid);

    List<Useranswer> userAnswer(Map<String,Integer> user);

    Boolean panJuan(Map<String,Object> map);

    Boolean faBu(Integer testpaperid, Integer userId);

    int update(MsgLog msgLog);

    int save(MsgLog msgLog);

    List<MsgLog> list(Map<String,Object> map);

    List<Video> findVideo(Video video);

    int addVideo(Video video);

    Video findById(Integer videoId);
}
