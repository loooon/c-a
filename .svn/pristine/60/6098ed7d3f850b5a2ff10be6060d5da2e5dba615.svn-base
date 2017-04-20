package com.credit.service.impl;

import java.util.List;

import com.credit.dao.GrayscaleVariableMapper;
import org.springframework.stereotype.Service;

import com.credit.entity.GrayscaleVariable;
import com.credit.service.GrayscaleVariableService;

import javax.annotation.Resource;

/**
 * Created by wangjunling on 2017/4/14.
 */
@Service("grayscaleVariableService")
public class GrayscaleVariableServiceImpl implements GrayscaleVariableService
{
	@Resource
	private GrayscaleVariableMapper grayscaleVariableMapper;

    @Override
    public List<GrayscaleVariable> searchAll()
    {
        return grayscaleVariableMapper.selectAll();
    }
}
