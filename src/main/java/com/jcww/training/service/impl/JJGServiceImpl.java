package com.jcww.training.service.impl;

import com.jcww.training.mapper.JJGMapper;
import com.jcww.training.service.JJGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JJGServiceImpl implements JJGService {
    @Autowired
    private JJGMapper jjgMapper;
}
