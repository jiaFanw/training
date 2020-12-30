package com.jcww.training.pojo;


import lombok.Data;

@Data
public class User {

  private Integer userid;
  private String username;
  private String password;
  private String truename;
  private Integer jobnumber;
  private Integer roleid;

  //paper
  private String papername;
  private java.sql.Date sharetime;
  private String createuser;
  private long paperid;
  //assistcollection
  private long assiststates;
  private long collectionstates;

}
