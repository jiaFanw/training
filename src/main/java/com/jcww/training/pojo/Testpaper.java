package com.jcww.training.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class Testpaper implements Serializable {

  private Integer testpaperid;//考试试卷表id
  private String testpapername;//试卷名称
  private String createuser;//创始人
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date createtime;//创始时间
  private Integer follmark;//满分
  private Integer passmark;//及格分
}