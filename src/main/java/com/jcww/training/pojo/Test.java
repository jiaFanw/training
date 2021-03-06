package com.jcww.training.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class Test implements Serializable {

  private Integer testid;//考试表id
  private String testname;//考试名称
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date testdate;//考试日期
  @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
  private Date teststarttime;//考试开始时间
  @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
  private Date testendtime;//考试截止日期
  private Integer testpaperid;//考试试卷表id

  private String teststatus;//考试状态
  private String testtime;//考试次数

  //Testpaper
  private String passmark;//及格分
  private Integer renshu;//人数
  //user
  private String truename; //用户真实姓名


  /*考卷表的考卷名字*/
  private String testpapername;
  /*通过率*/
  private String tgl;

}