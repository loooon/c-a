package com.credit.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.credit.dao.UserAuthIpMapper;
import com.credit.dao.UserMapper;
import com.credit.dao.query.Pager;
import com.credit.dao.query.UserQuery;
import com.credit.entity.User;
import com.credit.entity.UserAuthIp;
import com.credit.entity.dto.UserAuthIpDto;
import com.credit.service.UserAuthIpService;

/**
 * Created by wangjunling on 2017/4/11.
 */
@Service("userAuthIpService")
public class UserAuthIpServiceImpl implements UserAuthIpService
{
    @Resource
    private UserAuthIpMapper userAuthIpMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public Pager<UserAuthIpDto> searchPage(UserQuery userQuery)
    {
        List<UserAuthIpDto> userAuthIpList = userAuthIpMapper.selectByPage(userQuery);
        int count = userAuthIpMapper.countByPage(userQuery);
        System.out.println(userAuthIpList);
        return new Pager<UserAuthIpDto>(userQuery, userAuthIpList, count);
    }

    @Override
    public int updateByUserAuthIpDto(UserAuthIpDto authIpDto)
    {
        User user = userMapper.selectByPrimaryKey(authIpDto.getUserId());
		userAuthIpMapper.deleteByUserId(authIpDto.getUserId());
        String authIps = authIpDto.getAuthIps();
        if (StringUtils.isBlank(authIps))
        {
            return 0;
        }
        String[] split = authIps.split("\r\n");
        List<UserAuthIp> userAuthIpList = new ArrayList<>();
        Date now = new Date();
        for (String s : split)
        {
            UserAuthIp userAuthIp = new UserAuthIp();
            userAuthIp.setUserName(user.getUserName());
            userAuthIp.setUserVkey(user.getVkey());
            userAuthIp.setAuthorizedIp(s);
            userAuthIp.setLastUpdateTime(now);
            userAuthIp.setUserId(user.getUserId());
            userAuthIpList.add(userAuthIp);
        }

         return userAuthIpMapper.insertBatch(userAuthIpList);
    }

    @Override
    public String searchIpsByUserId(Integer userId)
    {
        return userAuthIpMapper.selectIpsByUserId(userId);
    }
}
