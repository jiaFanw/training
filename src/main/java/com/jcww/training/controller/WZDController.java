package com.jcww.training.controller;
import com.jcww.training.pojo.*;
import com.jcww.training.service.WZDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
@Controller
@RequestMapping("WZD")
public class WZDController {

    @Autowired
    private WZDService wzdService;

    //消息列表
    @RequestMapping("messageList")
    @ResponseBody
    public List<Message> messageList() {

        return wzdService.messageList();
    }

    //消息中的试题详情
    @RequestMapping("findById")
    @ResponseBody
    public Question findById(Integer questionid) {
        return wzdService.findById(questionid);
    }

    //是否共享
    @RequestMapping("changeIsNotShare")
    @ResponseBody
    public int changeIsNotShare(String isnotshare, Integer questionid) {
        return wzdService.changeIsNotShare(isnotshare, questionid);
    }

    //全部考试的数据
    @RequestMapping("dataTable")
    @ResponseBody
    public List<Test> dataTable() {
        return wzdService.dataTable();
    }
    /*下边是单SQL 的值 */

    //参加人数
    @RequestMapping("cjrs")
    @ResponseBody
    public int cjrs(int id) {

        return wzdService.cjrs(id);
    }

    //通过人数
    @RequestMapping("tgrs")
    @ResponseBody
    public int tgrs(int id) {

        return wzdService.tgrs(id);
    }

    //通过率
    @RequestMapping("tgl")
    @ResponseBody
    public Test tgl(int id) {
        return wzdService.tgl(id);
    }

    //平均分
    @RequestMapping("pjf")
    @ResponseBody
    public Integer pjf(int id) {
        Integer a = wzdService.pjf(id);
        if (a != 0 && a != null) {
            return a;
        }
        return 0;
    }

    //未参加人数
    @RequestMapping("wcjrs")
    @ResponseBody
    public int wcjrs(int id) {
        return wzdService.wcjrs(id);
    }

    /*通过id查单个考试的详情*/
    @RequestMapping("dataTable2")
    @ResponseBody
    public Test dataTable2(int id) {
        return wzdService.dataTable2(id);
    }

    @RequestMapping(value = "/personInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<Testuser> personInfo(Integer id) {
        return wzdService.personInfo(id);
    }

    /*查看未参加的人的信息*/
    @RequestMapping("showWho")
    @ResponseBody
    public List<Testuser> showWho(Integer id) {
        return wzdService.showWho(id);
    }
    //查看工号对应人员的考试信息
    @RequestMapping("personInfo2")
    @ResponseBody
    public  List<Testuser> personInfo2(Integer jobnumber){
        return wzdService.personInfo2(jobnumber);
    }
    //查看全部考试人员
    @RequestMapping("personInfo3")
    @ResponseBody
    public List<Testuser> personInfo3(){
        return wzdService.personInfo3();
    }
    //文章table
    @RequestMapping("article")
    @ResponseBody
    public List<Article> article(){
        return wzdService.article();
    }
    //通过id删除文章
    @RequestMapping("deleteById")
    @ResponseBody
    public int deleteById(int id){
        return wzdService.deleteById(id);
    }
    @RequestMapping("articleAdd")
    @ResponseBody
    public int articleAdd(String title,String str){
        System.out.println("标题---"+title+"内容---"+str);
        return wzdService.articleAdd(title,str);
    }
}
