package com.jcww.training.service.impl;

import com.jcww.training.mapper.MenuMapper;
import com.jcww.training.pojo.Power;
import com.jcww.training.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Power> leftTree(int roleid) {
        List<Power> menus =menuMapper.leftTree(roleid);
        handleMenus(menus );
        return menus ;
    }
    public void handleMenus(List<Power> menus) {
        for (Power p : menus) {
            List<Power> children = getAllByParentId(p.getPowerid());
            p.setChildren(children);
        }

        Iterator<Power> iterator = menus.iterator();
        while (iterator.hasNext()) {
            Power menu = iterator.next();
            if (menu.getParentId() != 0) {
                iterator.remove();
            }
        }
    }

    public List<Power> getAllByParentId(Integer powerid) {
        return menuMapper.getAllByParentId(powerid);
    }

}
