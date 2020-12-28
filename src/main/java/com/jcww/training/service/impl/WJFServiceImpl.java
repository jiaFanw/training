package com.jcww.training.service.impl;

import com.jcww.training.mapper.WJFMapper;
import com.jcww.training.service.WJFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WJFServiceImpl implements WJFService {
    @Autowired
    private WJFMapper wjfMapper;


}
