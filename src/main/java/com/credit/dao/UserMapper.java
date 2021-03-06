package com.credit.dao;

import com.credit.dao.query.PageQuery;
import com.credit.dao.query.UserQuery;
import com.credit.entity.User;
import com.credit.entity.dto.UserResourceDto;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectByPage(PageQuery query);

    int countByPage(PageQuery query);

    User selectByStringParam(String paramName,String paramValue);

    List<UserResourceDto> selectByDtoPage(UserQuery userQuery);

    User selectByIdAndUserName(Integer userId, String userName);
}