package com.credit.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.credit.dao.SiteResourceMapper;
import com.credit.dao.query.Pager;
import com.credit.dao.query.SiteResourceQuery;
import com.credit.entity.SiteResource;
import com.credit.service.SiteResourceService;

/**
 * Created by Michael Chan on 4/5/2017.
 */
@Service("siteResourceService")
public class SiteResourceServiceImpl implements SiteResourceService
{
    @Resource
    private SiteResourceMapper siteResourceMapper;

    @Override
    public List<SiteResource> searchSiteResourceByNames(String[] resourcesNames)
    {
        return siteResourceMapper.selectByResourceNameIn(resourcesNames);
    }

    @Override
    public List<String> searchAllResourceNames()
    {
        return siteResourceMapper.selectDistinctResourceName();
    }

    @Override
    public Pager<SiteResource> searchPage(SiteResourceQuery siteResourceQuery)
    {
        List<SiteResource> siteResourceList = siteResourceMapper.selectByPage(siteResourceQuery);
        int count = siteResourceMapper.countByPage(siteResourceQuery);
        return new Pager<>(siteResourceQuery, siteResourceList, count);
    }

    @Override
    public SiteResource searchById(Integer resourceId)
    {
        return siteResourceMapper.selectByPrimaryKey(resourceId);
    }

    @Override
    public int saveOrUpdate(SiteResource siteResource)
    {
        siteResource.setUpdateTime(new Date());
        if (siteResource.getResourceId() != null)
        {
            return siteResourceMapper.updateByPrimaryKeySelective(siteResource);
        }
        siteResource.setCreateTime(new Date());
        siteResource.setResourceType(1);
        siteResource.setResourceStatus(SiteResource.RESOURCE_STATUS_DEFAULT);
        return siteResourceMapper.insert(siteResource);
    }

    @Override
    public int deleteById(Integer resourceId)
    {
    	SiteResource siteResource = new SiteResource();
    	siteResource.setResourceId(resourceId);
    	siteResource.setResourceStatus(SiteResource.RESOURCE_STATUS_DELETE);
        return siteResourceMapper.updateByPrimaryKeySelective(siteResource);
    }

    @Override
    public List<SiteResource> searchAll()
    {
        return siteResourceMapper.selectAllDistinctByResourceName();
    }
}
