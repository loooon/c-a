package com.credit.dao;

import com.credit.dao.query.UserQuery;
import com.credit.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectByStringParam(String paramName,String paramValue);

    List<Admin> selectByPage(UserQuery query);

    int countByPage(UserQuery query);

    Admin selectByIdAndName(Integer id, String paramName,String paramValue);
}