package com.jcww.training.mapper;

import com.jcww.training.pojo.Message;
import com.jcww.training.pojo.Question;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface WZDMapper {
    List<Message> messageList();

    Question findById(Integer questionid);

    int changeIsNotShare(@Param("isnotshare") String isnotshare,@Param("questionid") Integer questionid);
}
