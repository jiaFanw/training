package com.jcww.training.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class Question implements Serializable {

  private Integer questionid;//考试题ID
  private String questionname;//考试题内容
  private String answer;//答案
  private Integer score;//分数
  private String level;//难度
  private String resolve;//解析
  private String optiona;//选项a
  private String optionb;//选项b
  private String optionc;//选项c
  private String optiond;//选项d
  private Integer isnotshare;//是否共享(0共享，1审核，2.私有)
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date createtime;//创建时间
  private Integer questionclassifyid;//questionclassifyid（分类表外键）
  private String questiontype;//问题分类（1.单选，2多选，3.判断，4.填空，5.简答）
  private String createusername;//创建人
  private String ownuser;//拥有者
}
