package com.credit.dao;

import com.credit.dao.query.SiteResourceQuery;
import com.credit.entity.SiteResource;

import java.util.List;

public interface SiteResourceMapper {
    int deleteByPrimaryKey(Integer resourceId);

    int insert(SiteResource record);

    int insertSelective(SiteResource record);

    SiteResource selectByPrimaryKey(Integer resourceId);

    int updateByPrimaryKeySelective(SiteResource record);

    int updateByPrimaryKey(SiteResource record);

    List<SiteResource> selectByResourceNameIn(String[] resourcesNames);

    List<String> selectDistinctResourceName();

    List<SiteResource> selectAllDistinctByResourceName();

	List<SiteResource> selectByPage(SiteResourceQuery siteResourceQuery);

	int countByPage(SiteResourceQuery siteResourceQuery);
}