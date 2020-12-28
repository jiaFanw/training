package com.jcww.training.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Assistcollection implements Serializable {

  private Integer assistid;//点赞ID
  private Integer testpaperid;//试卷库ID
  private Integer userid;//用户ID
  private Integer assiststates;//点赞状态(0.未点赞，1.点赞)
  private Integer collectionstates;//收藏状态（0.未收藏，1.已收藏）
}
