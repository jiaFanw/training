package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Power implements Serializable {

  private Integer powerid;//权限ID
  private String powername;//权限名称
  private Integer roleid;
  private Integer parentId;
}
