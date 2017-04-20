package com.credit.dao;

import com.credit.dao.query.UserQuery;
import com.credit.entity.UserAuthIp;
import com.credit.entity.dto.UserAuthIpDto;

import java.util.List;

public interface UserAuthIpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAuthIp record);

    int insertSelective(UserAuthIp record);

    UserAuthIp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAuthIp record);

    int updateByPrimaryKey(UserAuthIp record);

	List<UserAuthIpDto> selectByPage(UserQuery userQuery);

	int countByPage(UserQuery userQuery);

	int deleteByUserId(Integer userId);

	int insertBatch(List<UserAuthIp> userAuthIpList);

	String selectIpsByUserId(Integer userId);
}