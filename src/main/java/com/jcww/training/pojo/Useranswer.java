package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Useranswer implements Serializable {

  private Integer useranswerid;//学生答案表id
  private Integer questionid;//问题id
  private Integer userid;//用户id
  private String useranswer;//学生答案
  private String score;//分数（每一道题）
  private Integer testpaparid;//试卷id
}