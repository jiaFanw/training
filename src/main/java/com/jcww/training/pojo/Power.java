package com.jcww.training.pojo;


import java.util.List;

public class Power {

  private Integer powerid;
  private String powername;
  private Integer parentId;
  private String url;
  private List<Power> childList;

  public List<Power> getChildList() {
    return childList;
  }

  public void setChildList(List<Power> childList) {
    this.childList = childList;
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
