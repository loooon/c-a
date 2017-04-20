package com.credit.service;

import com.credit.dao.query.Pager;
import com.credit.dao.query.UserQuery;
import com.credit.entity.dto.UserAuthIpDto;

import java.util.List;

/**
 * Created by wangjunling on 2017/4/11.
 */
public interface UserAuthIpService
{
    Pager<UserAuthIpDto> searchPage(UserQuery userQuery);

	int updateByUserAuthIpDto(UserAuthIpDto authIpDto);

	String searchIpsByUserId(Integer userId);
}
