package com.jcww.training.mapper;

import com.jcww.training.pojo.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface WZDMapper {
    List<Message> messageList();

    Question findById(Integer questionid);

    int changeIsNotShare(@Param("isnotshare") String isnotshare,@Param("questionid") Integer questionid);

    List<Test> dataTable();

    int pjf(int id);

    int tgrs(int id);

    int cjrs(int id);

    Test tgl(int id);

    int wcjrs(int id);

   Test dataTable2(int id);

    List<Testuser> personInfo(Integer id);

    List<Testuser> showWho(Integer id);

    List<Testuser> personInfo2(Integer jobnumber);

    List<Testuser> personInfo3();

    List<Article> article();

    int deleteById(int id);

    int articleAdd(@Param("title") String title,@Param("str") String str);
}
