package com.jcww.training.pojo;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Message {

  private long id;
  private String status;
  private String username;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date sentTime;
  private String category;
  private long questionid;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public Date getSentTime() {
    return sentTime;
  }

  public void setSentTime(Date sentTime) {
    this.sentTime = sentTime;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }


  public long getQuestionid() {
    return questionid;
  }

  public void setQuestionid(long questionid) {
    this.questionid = questionid;
  }

}
