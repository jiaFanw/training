package com.jcww.training.pojo;


import java.io.Serializable;
import java.util.List;

public class Power implements Serializable {
  private static final long serialVersionUID = 1L;
  private Long powerid;
  private String powername;
  private Long parentId;
  private String url;
  private List<Power> children;

  public List<Power> getChildren() {
    return children;
  }

  public void setChildren(List<Power> children) {
    this.children = children;
  }

  public Long  getPowerid() {
    return powerid;
  }

  public void setPowerid(Long  powerid) {
    this.powerid = powerid;
  }


  public String getPowername() {
    return powername;
  }

  public void setPowername(String powername) {
    this.powername = powername;
  }


  public Long  getParentId() {
    return parentId;
  }

  public void setParentId(Long  parentId) {
    this.parentId = parentId;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  @Override
  public String toString() {
    return "Power{" +
            "powerid=" + powerid +
            ", powername='" + powername + '\'' +
            ", parentId=" + parentId +
            ", url='" + url + '\'' +
            ", children=" + children +
            '}';
  }
}
