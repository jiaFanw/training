package com.jcww.training.controller;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Shared;
import com.jcww.training.pojo.User;
import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author cjl
 * @date 2021/1/1
 * CJLController
 */
@RestController
@RequestMapping("CJL")
public class CJLController {
    @Autowired
    private CJLService cjlService;

    /*我的题库*/
    @RequestMapping("MyQuestionBank")
    public List<Question> MyQuestionBank(HttpSession session) {
        User user = (User) session.getAttribute("user");
        String myqus = user.getTruename();
        List<Question> list = cjlService.MyQuestionBank(myqus);
        return list;
    }

    /*新增单选*/
    @RequestMapping("danxuanAdd")
    public int danxuanAdd(Question question, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String myqus = user.getTruename();
        int usid = user.getUserid();
        question.setCreateusername(myqus);
        question.setOwnuser(myqus);
        question.setUserid(usid);
        String newString = question.getAnswer().substring(0, question.getAnswer().length());
        String[] split = newString.split(",");
        String answers = new String();
        for (int i = 0; i < split.length; i++) {
            answers += split[i];
        }
        question.setAnswer(answers);
        int i = cjlService.danxuanAdd(question);
        return i;
    }

    /*删除试题*/
    @RequestMapping("perDel")
    public int perDel(Integer questionid) {
        int i = cjlService.perDel(questionid);
        return i;
    }

    /*查看试题*/
    @RequestMapping("ViewID")
    public Question ViewID(Integer questionid) {
        return cjlService.ViewID(questionid);
    }

    /*修改试题*/
    @RequestMapping("preup")
    public boolean preup(@RequestBody Question question) {
        boolean boo = false;
        int i = cjlService.preup(question);
        if (i != 0) {
            boo = true;
        }
        return boo;
    }

    /*共享题库*/
    @RequestMapping("SharedQuestionBank")
    public List<Question> SharedQuestionBank() {
        List<Question> list = cjlService.SharedQuestionBank();
        return list;
    }

    /*共享题库审核*/
    @RequestMapping("SharedQuestionBankshenhe")
    public List<Question> SharedQuestionBankshenhe() {
        List<Question> list = cjlService.SharedQuestionBankshenhe();
        return list;
    }

    /*共享题审核通过*/
    @RequestMapping("SharedBy")
    public boolean SharedBy(@RequestBody Question question) {
        boolean boo = false;
        int i = cjlService.SharedBy(question);
        if (i != 0) {
            boo = true;
        }
        return boo;
    }

    /*共享题审核驳回*/
    @RequestMapping("SharedTurnDown")
    public boolean SharedTurnDown(@RequestBody Question question) {
        boolean boo = false;
        int i = cjlService.SharedTurnDown(question);
        if (i != 0) {
            boo = true;
        }
        return boo;
    }

    /*共享题审核申请*/
    @RequestMapping("ApplicationSH")
    public boolean ApplicationSH(@RequestBody Question question) {
        boolean boo = false;
        int i = cjlService.ApplicationSH(question);
        if (i != 0) {
            boo = true;
        }
        return boo;
    }

    /*添加至我的题库*/
    @RequestMapping("AddShared")
    public int AddShared(Shared shared, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String myqus = user.getTruename();
        shared.setCreateusername(myqus);
        int i = cjlService.AddShared(shared);
        return i;
    }

    /*我的共享*/
    @RequestMapping("MySharedByUserName")
    public List<Shared> MySharedByUserName(HttpSession session){
        User user = (User) session.getAttribute("user");
        String myqus = user.getTruename();
        List<Shared> list = cjlService.MySharedByUserName(myqus);
        return list;
    }

    /*共享查看*/
    @RequestMapping("SharedViewID")
    public Shared SharedViewID(Integer questionid) {
        Shared shared = cjlService.SharedViewID(questionid);
        return shared;
    }

    /*共享删除*/
    @RequestMapping("SharedDeletePer")
    public int SharedDeletePer(Integer questionid){
        int i = cjlService.SharedDeletePer(questionid);
        return i;
    }
}