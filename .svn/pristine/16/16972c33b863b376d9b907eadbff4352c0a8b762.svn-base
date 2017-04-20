package com.credit.dao;

import com.credit.dao.query.UserQuery;
import com.credit.entity.UserGrayscaleStatVariable;
import com.credit.entity.dto.UserGrayscaleStatDto;

import java.util.List;

public interface UserGrayscaleStatVariableMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserGrayscaleStatVariable record);

    int insertSelective(UserGrayscaleStatVariable record);

    UserGrayscaleStatVariable selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserGrayscaleStatVariable record);

    int updateByPrimaryKey(UserGrayscaleStatVariable record);

    List<UserGrayscaleStatDto> selectByPage(UserQuery userQuery);

	int countByPage(UserQuery userQuery);

	List<UserGrayscaleStatDto> selectByUserId(Integer userId);
}