package com.credit.service.impl;

import com.credit.dao.UserPermissionMapper;
import com.credit.entity.UserPermission;
import com.credit.service.UserPermissionService;
import com.credit.web.model.SiteResourceModel;
import com.credit.web.model.SrModal;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Michael Chan on 4/5/2017.
 */
@Service("userPermissionService")
public class UserPermissionServiceImpl implements UserPermissionService
{
    @Resource
    private UserPermissionMapper userPermissionMapper;

    @Override
    public int save(Integer userId, String vkey,  SrModal srModal)
    {
        List<UserPermission> userPermissions = new ArrayList<>();
        for (SiteResourceModel siteResourceModel:srModal.getSiteResourceModels())
        {
            if (siteResourceModel.getResourceId() == null)
            {
                continue;
            }
            UserPermission userPermission = new UserPermission();
            userPermission.setUserId(userId);
            userPermission.setVkey(vkey);
            userPermission.setResourceId(siteResourceModel.getResourceId());
            userPermission.setDailyTimes(siteResourceModel.getDailyTimes());
            userPermission.setYearlyTimes(siteResourceModel.getYearlyTimes());
            userPermission.setCreateDate(new Date());
            userPermission.setUpdateTime(new Date());
            userPermissions.add(userPermission);
        }
        return userPermissionMapper.insertPermissionBatch(userPermissions);
    }

    @Override
    public List<UserPermission> searchPermissionByIdsIn(Integer userId)
    {
        return userPermissionMapper.selectByUserId(userId);
    }

    @Override
    public Integer update(Integer userId, String vkey, SrModal srModal)
    {
        userPermissionMapper.deleteByUserId(userId);
        return save(userId, vkey, srModal);
    }
}
