package com.jcww.training.mapper;

import com.jcww.training.pojo.Question;
import com.jcww.training.pojo.Shared;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CJLMapper {

    int danxuanAdd(Question question);//新增单选

    int perDel(@Param("questionid") Integer questionid);//试题的删除

    Question ViewID(@Param("questionid") Integer questionid);//查看试题

    int preup(Question question);//修改试题

    List<Question> MyQuestionBank(String myqus);//我的题库

    List<Question> SharedQuestionBank();//共享题库

    List<Question> SharedQuestionBankshenhe();//共享题库审核

    int SharedTurnDown(Question question);//共享题审核驳回

    int SharedBy(Question question);//共享题审核通过

    int ApplicationSH(Question question);//共享题审核申请

    int AddShared(Shared shared);//添加至我的题库

    List<Shared> MySharedByUserName(String myqus);//我的共享

    Shared SharedViewID(@Param("questionid") Integer questionid);//共享查看

    int SharedDeletePer(Integer questionid);//共享删除
}