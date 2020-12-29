package com.jcww.training.service.impl;

import com.jcww.training.mapper.MenuMapper;
import com.jcww.training.pojo.Power;
import com.jcww.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Power> leftTree(int roleid) {
        List<Power> colList = menuMapper.leftTree(roleid);
        if (colList==null || colList.size()<=0){
            return null;
        }
        LinkedList<Power> colLinkedList = new LinkedList<>();
        colList.forEach(data->{
            if(data.getParentId() == 0L){
                colLinkedList.add(data);
            }
        });

        colLinkedList.forEach(data->{
            data.setChildren(getChildren(data.getPowerid(), colList));
        });
        System.out.println(colLinkedList);
        return colLinkedList;
    }

    //递归获取children节点
    private List<Power> getChildren(Long parentId,List<Power> colList) {
        //孩子集合
        LinkedList<Power> colLinkedList = new LinkedList<>();
        colList.forEach(data->{
            if (parentId.equals(data.getParentId())) {
                colLinkedList.add(data);
            }
        });
        // 递归退出条件
        if (colLinkedList.size() == 0){
            return null;
        }
        // 把子菜单的子菜单再递归循环一遍
        colLinkedList.forEach(data->{
            data.setChildren(getChildren(data.getPowerid(),colList));
        });
        return colLinkedList;
    }

}
