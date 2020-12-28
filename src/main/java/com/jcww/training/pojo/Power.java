package com.jcww.training.pojo;


import java.util.List;

public class Power {

  private Integer powerid;
  private String powername;
  private Integer parentId;
  private String url;
  private List<Power> children;

  public List<Power> getChildren() {
    return children;
  }

  public void setChildren(List<Power> children) {
    this.children = children;
  }

  public Integer getPowerid() {
    return powerid;
  }

  public void setPowerid(Integer powerid) {
    this.powerid = powerid;
  }


  public String getPowername() {
    return powername;
  }

  public void setPowername(String powername) {
    this.powername = powername;
  }


  public Integer getParentId() {
    return parentId;
  }

  public void setParentId(Integer parentId) {
    this.parentId = parentId;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

}
