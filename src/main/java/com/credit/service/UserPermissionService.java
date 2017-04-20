package com.credit.service;

import java.util.List;

import com.credit.entity.UserPermission;
import com.credit.web.model.SrModal;

/**
 * Created by Michael Chan on 4/5/2017.
 */
public interface UserPermissionService
{
    int save(Integer userId, String vkey, SrModal srModal);

    List<UserPermission> searchPermissionByIdsIn(Integer resourceIds);

    Integer update(Integer userId, String vkey,SrModal srModal);
}
