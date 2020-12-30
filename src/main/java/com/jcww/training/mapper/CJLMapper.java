package com.jcww.training.mapper;

import com.jcww.training.pojo.Question;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CJLMapper {

    List<Question> MyQuestionBank();//我的题库

    int DaoRu(@Param("li") List<Question> li);//导入

    int danxuanAdd(Question question);//新增单选

    int perDel(@Param("questionid") Integer questionid);//试题的删除

    Question ViewID(@Param("questionid") Integer questionid);//查看试题

    int preup(Question question);//修改试题
}