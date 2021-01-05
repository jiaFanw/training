package com.jcww.training.pojo;


import lombok.Data;

import java.util.Date;

public class User {

  private Integer userid;
  private String username;
  private String password;
  private String truename;
  private Integer jobnumber;
  private Integer roleid;

  //paper
  private String papername;
  private Date sharetime;
  private String createuser;
  private long paperid;
  //assistcollection
  private long assiststates;
  private long collectionstates;

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

  public String getPapername() {
    return papername;
  }

  public void setPapername(String papername) {
    this.papername = papername;
  }

  public Date getSharetime() {
    return sharetime;
  }

  public void setSharetime(Date sharetime) {
    this.sharetime = sharetime;
  }

  public String getCreateuser() {
    return createuser;
  }

  public void setCreateuser(String createuser) {
    this.createuser = createuser;
  }

  public long getPaperid() {
    return paperid;
  }

  public void setPaperid(long paperid) {
    this.paperid = paperid;
  }

  public long getAssiststates() {
    return assiststates;
  }

  public void setAssiststates(long assiststates) {
    this.assiststates = assiststates;
  }

  public long getCollectionstates() {
    return collectionstates;
  }

  public void setCollectionstates(long collectionstates) {
    this.collectionstates = collectionstates;
  }
}
