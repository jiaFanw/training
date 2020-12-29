package com.jcww.training.mapper;

import com.jcww.training.pojo.Power;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper {

    List<Power> leftTree(int roleid);

}
