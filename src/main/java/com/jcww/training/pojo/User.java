package com.jcww.training.pojo;


public class User {

  private Integer userid;
  private String username;
  private String password;
  private String truename;
  private Integer jobnumber;
  private Integer roleid;


  public Integer getUserid() {
    return userid;
  }

  public void setUserid(Integer userid) {
    this.userid = userid;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getTruename() {
    return truename;
  }

  public void setTruename(String truename) {
    this.truename = truename;
  }


  public Integer getJobnumber() {
    return jobnumber;
  }

  public void setJobnumber(Integer jobnumber) {
    this.jobnumber = jobnumber;
  }


  public Integer getRoleid() {
    return roleid;
  }

  public void setRoleid(Integer roleid) {
    this.roleid = roleid;
  }

}
