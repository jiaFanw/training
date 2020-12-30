package com.jcww.training.controller;

import com.jcww.training.pojo.Question;
import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("CJL")
public class CJLController {
    @Autowired
    private CJLService cjlService;

    /*我的题库*/
    @RequestMapping("MyQuestionBank")
    public List<Question> MyQuestionBank(){
        List<Question> list = cjlService.MyQuestionBank();
        return list;
    }

    /*新增单选*/
    @RequestMapping("danxuanAdd")
    public int danxuanAdd(Question question){
        int i=cjlService.danxuanAdd(question);
        return i;
    }

    /*删除试题*/
    @RequestMapping("perDel")
    public int perDel(Integer questionid) {
        int i=cjlService.perDel(questionid);
        return i;
    }

    /*查看试题*/
    @RequestMapping("ViewID")
    public Question ViewID(Integer questionid){
        return cjlService.ViewID(questionid);
    }

    /*修改试题*/
    @RequestMapping("preup")
    public boolean preup(@RequestBody Question question){
        int i = cjlService.preup(question);
        boolean boo = false;
        if (i != 0) {
            boo = true;
        }
        return boo;
    }

    /*@RequestMapping("DaoRu")
    public boolean DaoRu(MultipartFile file) throws Exception{

        List<Question> li = new ArrayList<Question>();

        List<List<String>> list = TemplateExcelUtil.readExcel(file.getInputStream());

        Question qu = null;

        for (int i=0;i<list.size();i++){
            qu = new Question();

            qu.setQuestionname(list.get(i).get(0));

            qu.setAnswer(list.get(i).get(1));

            qu.setScore(list.get(i).get(2));

            qu.setResolve(list.get(i).get(3));

            qu.setOptiona(list.get(i).get(4));

            qu.setOptionb(list.get(i).get(5));

            qu.setOptionc(list.get(i).get(6));

            qu.setOptiond(list.get(i).get(7));

            qu.setIsnotshare(list.get(i).get(8));

            SimpleDateFormat s2 = new SimpleDateFormat("yyyy/MM/dd");
            double dou2 = Double.parseDouble(list.get(i).get(9));
            Date d2 = DateUtil.getJavaDate(dou2);
            String format2 = s2.format(d2);
            qu.setCreatetime(format2);

            qu.setQuestionclassifyid(list.get(i).get(10));

            qu.setQuestiontype(list.get(i).get(11));

            qu.setCreateusername(list.get(i).get(12));

            qu.setOwnuser(list.get(i).get(13));

            li.add(qu);
        }
        int i = cjlService.DaoRu(li);

        boolean b = false;

        if (i!=0){
            b = true;
        }

        return b;

    }*/



    /*@RequestMapping("DaoChu")
    public boolean DaoChu(HttpSession session, Integer pageNumber, Integer pageSize){
        //模板的物理路径
        String temp = session.getServletContext().getRealPath("template"+"//devicesTemp.xlsx");

        //导出的目的地
        String target = "D://tools//bgs//temp//dalipu_1808A//Daochu//BMDaoChu.xlsx";

        //操作人与操作时间
        String[] params = new String[2];

        User user = (User) session.getAttribute("user");

        String xm = user.getName();

        params[0] = xm;

        //获取动态的时间(当前日期)
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = sdf.format(d);
        params[1] = s;

        //导出字段名,要与pojo保持一致
        List<String> headersId = getHeadersId();

        //要导出数据的集合
        List<Question> dtoList = cjlService.DaoChu(pageNumber,pageSize);

        //工具类中携带的参数
        return new TemplateExcelUtil().exportExcel(temp,target,params,headersId,dtoList);
    }

    private List<String> getHeadersId() {
        List<String> list = new ArrayList<String>();
        list.add("deptName");
        list.add("staffName");
        list.add("staffPhone");
        list.add("staffDese");
        list.add("deptPid");
        return list;
    }*/
}