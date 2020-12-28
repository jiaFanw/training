package com.jcww.training.service.impl;

import com.jcww.training.mapper.CJLMapper;
import com.jcww.training.service.CJLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CJLServiceImpl implements CJLService {
    @Autowired
    private CJLMapper cjlMapper;
}
