package com.jcww.training.service.impl;

import com.jcww.training.mapper.WJFMapper;
import com.jcww.training.pojo.MsgLog;
import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Useranswer;
import com.jcww.training.pojo.Video;
import com.jcww.training.service.WJFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class WJFServiceImpl implements WJFService {
    @Autowired
    private WJFMapper wjfMapper;


    @Override
    public List<Map<String, Object>> getExam(String user) {
        return wjfMapper.getExam(user);
    }

    @Override
    public Boolean reduceNum(Integer testId, Integer userId) {
        return wjfMapper.reduceNum(testId,userId);
    }

    @Override
    public List<Question> danXuan(Integer testpaperid) {
        return wjfMapper.danXuan(testpaperid);
    }

    @Override
    public List<Question> duoXuan(Integer testpaperid) {
        return wjfMapper.duoXuan(testpaperid);
    }

    @Override
    public List<Question> panDuan(Integer testpaperid) {
        return wjfMapper.panDuan(testpaperid);
    }

    @Override
    public List<Question> tianKong(Integer testpaperid) {
        return wjfMapper.tianKong(testpaperid);
    }

    @Override
    public List<Question> jianDa(Integer testpaperid) {
        return wjfMapper.jianDa(testpaperid);
    }

    @Override
    public Map<String, Object> kaoShi(Integer testpaperid) {
        return wjfMapper.kaoShi(testpaperid);
    }

    @Override
    public List<Map<String, Object>> markPapers() {
        return wjfMapper.markPapers();
    }

    @Override
    public List<Map<String, Object>> paper(Integer testpaperid) {
        return wjfMapper.paper(testpaperid);
    }

    @Override
    public List<Map<String, Object>> testPeople(Integer testpaperid) {
        return wjfMapper.testPeople(testpaperid);
    }

    @Override
    public List<Map<String, Object>> staffData(String user) {
        return wjfMapper.staffData(user);
    }


    @Override
    public Boolean jiaoJuan(Map<String, Object> map) {
        Boolean b = false;
        Useranswer us = new Useranswer();
        us.setTestpaparid(Integer.parseInt(map.get("testpaperid").toString()));
        us.setUserid(Integer.parseInt(map.get("userId").toString()));
        String[] split = map.get("daAn").toString().substring(1,map.get("daAn").toString().length()-1).split(" ");
        for (String s:split) {
            String[] split1 = s.split(",");
            for (int i = 0; i <split1.length ; i++) {
                us.setQuestionid(Integer.parseInt(split1[0]));
                us.setUseranswer(split1[1]);
                us.setScore(Integer.parseInt(split1[2]));
                System.out.println(us);
                if(Integer.parseInt(map.get("num").toString()) == 3){
                    b = wjfMapper.daAn(us);
                }else{
                    b = wjfMapper.upDaAn(us);
                }

                break;
            }

        }
        return b;
    }

    @Override
    public List<Question> allQuestions(Integer testpaperid) {
        return wjfMapper.allQuestions(testpaperid);
    }

    @Override
    public List<Useranswer> userAnswer(Map<String, Integer> user) {
        Integer testpaperid = user.get("testpaperid");
        Integer userId = user.get("userId");
        return wjfMapper.userAnswer(testpaperid,userId);
    }

    @Override
    public Boolean panJuan(Map<String, Object> map) {
        Boolean b = false;
        Useranswer us = new Useranswer();
        us.setTestpaparid(Integer.parseInt(map.get("testpaperid").toString()));
        us.setUserid(Integer.parseInt(map.get("userId").toString()));
        String[] split = map.get("fen").toString().substring(1,map.get("fen").toString().length()-1).split(" ");
        for (String s:split) {
            String[] split1 = s.split(",");
            for (int i = 0; i <split1.length ; i++) {
                us.setQuestionid(Integer.parseInt(split1[0]));
                us.setScore(Integer.parseInt(split1[1]));
                System.out.println(us);
                Boolean bo = wjfMapper.panJuan(us);

                if(bo){
                    b = wjfMapper.fen(Integer.parseInt(map.get("testpaperid").toString()),Integer.parseInt(map.get("userId").toString()));
                }
                break;
            }

        }
        return b;
    }

    @Override
    public Boolean faBu(Integer testpaperid, Integer userId) {
        return wjfMapper.faBu(testpaperid,userId);
    }

    @Override
    public int update(MsgLog msgLog) {
        return wjfMapper.update(msgLog);
    }

    @Override
    public int save(MsgLog msgLog) {
        return wjfMapper.save(msgLog);
    }

    @Override
    public List<MsgLog> list(Map<String, Object> map) {
        return wjfMapper.list(map);
    }

    @Override
    public List<Video> findVideo(Video video) {
        return wjfMapper.findVideo(video);
    }

    @Override
    public int addVideo(Video video) {
        return wjfMapper.addVideo(video);
    }

    @Override
    public Video findById(Integer videoId) {
        return wjfMapper.findById(videoId);
    }


}
