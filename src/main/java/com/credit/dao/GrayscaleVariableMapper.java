package com.credit.dao;

import java.util.List;

import com.credit.entity.GrayscaleVariable;

public interface GrayscaleVariableMapper
{
    int deleteByPrimaryKey(Integer id);

    int insert(GrayscaleVariable record);

    int insertSelective(GrayscaleVariable record);

    GrayscaleVariable selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GrayscaleVariable record);

    int updateByPrimaryKey(GrayscaleVariable record);

    List<GrayscaleVariable> selectAll();
}