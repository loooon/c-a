package com.credit.dao;

import com.credit.entity.UserPermission;

import java.util.List;

public interface UserPermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(UserPermission record);

    int insertSelective(UserPermission record);

    UserPermission selectByPrimaryKey(Integer permissionId);

    int updateByPrimaryKeySelective(UserPermission record);

    int updateByPrimaryKey(UserPermission record);

    int insertPermissionBatch(List<UserPermission> userPermissions);

    List<UserPermission> selectByUserId(Integer userId);

    void deleteByUserId(Integer userId);
}