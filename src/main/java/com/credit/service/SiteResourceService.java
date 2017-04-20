package com.credit.service;

import com.credit.dao.query.Pager;
import com.credit.dao.query.SiteResourceQuery;
import com.credit.entity.SiteResource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Michael Chan on 4/5/2017.
 */
public interface SiteResourceService
{
   List<SiteResource> searchSiteResourceByNames(String[] resourcesNames);

    List<String> searchAllResourceNames();

    List<SiteResource> searchAll();

	Pager<SiteResource> searchPage(SiteResourceQuery siteResourceQuery);

	SiteResource searchById(Integer resourceId);

	int saveOrUpdate(SiteResource siteResource);

	int deleteById(Integer resourceId);
}
