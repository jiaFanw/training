package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Questionandpaper implements Serializable {

  private Integer qandtid;//试卷试题关联表id
  private Integer questionid;//试题表id
  private Integer testpaperid;//试卷表id
}
