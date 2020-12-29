package com.jcww.training.service.impl;

import com.jcww.training.mapper.WZDMapper;
import com.jcww.training.service.WZDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WZDServiceImpl implements WZDService {
    @Autowired
    private WZDMapper wzdMapper;
}
