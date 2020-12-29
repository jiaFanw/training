package com.jcww.training.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class Paper implements Serializable {

  private Integer paperid;//试卷ID
  private String papername;//试卷名称
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date createtime;//创建时间
  private String createuser;//创建人
  private String isnotshare;//是否共享（0,是1.否）
  private String follmark;//满分
  private String passmark;//及格分
}
