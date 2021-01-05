package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Testuser implements Serializable {

  private Integer tanduid;//考试人员关联表id
  private Integer testid;//考试表id
  private Integer userid;//人员表id
  private Integer testtime;//考试次数（用于判断是否缺考，以及是否能进入考试）
  //真实名字
  private String truename;
  //工号
  private Integer jobnumber;
  //总分
  private Integer follmark;
  //及格分
  private Integer passmark;
  //得分
  private Integer score;
  //账号
  private String username;
  //试卷名
  private String testpapername;
}