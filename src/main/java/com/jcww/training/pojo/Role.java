package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Role implements Serializable {

  private Integer roleid;//角色id
  private String rolename;//角色名称
}
