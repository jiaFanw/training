package com.jcww.training.mapper;

import com.jcww.training.pojo.User;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    User login(@Param("username") String username,@Param("password") String password);
}
