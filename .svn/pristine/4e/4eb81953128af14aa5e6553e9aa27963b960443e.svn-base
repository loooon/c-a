package com.credit.service;

import javax.annotation.Resource;

import com.credit.dao.query.Pager;
import com.credit.entity.dto.UserAuthIpDto;
import org.junit.Assert;
import org.junit.Test;

import com.credit.dao.query.UserQuery;

/**
 * Created by wangjunling on 2017/4/11.
 */
public class UserAuthIpServiceTest extends BaseTest
{
    @Resource
    private UserAuthIpService userAuthIpService;

    @Test
    public void page()
    {
		UserQuery userQuery = new UserQuery();
		userQuery.setUserName("ad");
		Pager<UserAuthIpDto> userAuthIpDtoPager = userAuthIpService.searchPage(userQuery);
		Assert.assertNotNull(userAuthIpDtoPager);
	}

}
