package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {

  private Integer userid;//主键
  private String username;//用户名
  private String password;//密码
  private String truename;//用户真实姓名
  private Integer jobnumber;//工号
  private Integer roleid;//角色表id
}