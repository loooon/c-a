package com.credit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.credit.dao.UserGrayscaleStatVariableMapper;
import com.credit.dao.query.Pager;
import com.credit.dao.query.UserQuery;
import com.credit.entity.dto.UserGrayscaleStatDto;
import com.credit.service.UserGrayscaleStatVariableService;

/**
 * Created by wangjunling on 2017/4/14.
 */
@Service("userGrayscaleStatVariableService")
public class UserGrayscaleStatVariableServiceImpl implements UserGrayscaleStatVariableService
{
    @Resource
    private UserGrayscaleStatVariableMapper userGrayscaleStatVariableMapper;

    @Override
    public Pager<UserGrayscaleStatDto> searchPage(UserQuery userQuery)
    {
        List<UserGrayscaleStatDto> statDtos = userGrayscaleStatVariableMapper.selectByPage(userQuery);

        int count = userGrayscaleStatVariableMapper.countByPage(userQuery);
        return new Pager<>(userQuery, statDtos, count);
    }

    @Override
    public List<UserGrayscaleStatDto> searchByUserId(Integer userId)
    {
        return userGrayscaleStatVariableMapper.selectByUserId(userId);
    }
}
