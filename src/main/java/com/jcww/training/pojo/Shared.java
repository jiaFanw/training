package com.jcww.training.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Shared {
  private Integer questionid;
  private String questionname;
  private String answer;
  private String score;
  private String resolve;
  private String optiona;
  private String optionb;
  private String optionc;
  private String optiond;
  private String isnotshare;
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date createtime;
  private Integer questionclassifyid;
  private String questiontype;
  private String createusername;
  private String ownuser;
  private Integer userid;



  /*
   *   Questionclassify表
   *  **/
  private String questionclassifyname;//试题分类名称

  /**
   *  User 表
   * */
  private String truename;
}
