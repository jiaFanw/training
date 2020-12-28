package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class PowerAndRole implements Serializable {

  private Integer seqId;
  private Integer powerId;
  private Integer roleId;

}