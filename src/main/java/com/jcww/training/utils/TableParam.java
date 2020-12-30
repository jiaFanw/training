package com.jcww.training.utils;

import lombok.Data;

import java.io.Serializable;

@Data
public class TableParam implements Serializable {
    private Integer offset;//请求数据的偏移量
    private Integer limit;//每页显示的行数
    private String search;//搜索框
}