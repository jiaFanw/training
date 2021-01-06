package com.jcww.training.pojo;

import java.util.Date;

public class Article {
    private Integer id;
    private String title;
    private String info;
    private Date creatime;
    private String ifshare;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getCreatime() {
        return creatime;
    }

    public void setCreatime(Date creatime) {
        this.creatime = creatime;
    }

    public String getIfshare() {
        return ifshare;
    }

    public void setIfshare(String ifshare) {
        this.ifshare = ifshare;
    }
}
