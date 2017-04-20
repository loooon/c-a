package com.credit.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.credit.common.result.ResultJson;
import com.credit.dao.query.Pager;
import com.credit.dao.query.SiteResourceQuery;
import com.credit.entity.SiteResource;
import com.credit.service.SiteResourceService;

/**
 * Created by wangjunling on 2017/4/10.
 */

@Controller
@RequestMapping("/resource/site")
public class SiteResourceController extends AbstractBaseController
{

    @Resource
    private SiteResourceService siteResourceService;

    @RequestMapping("/list")
    public String toList()
    {
        return "site_res_list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public ResultJson list(SiteResourceQuery siteResourceQuery)
    {
        try
        {
            Pager<SiteResource> siteResourcePager = siteResourceService.searchPage(siteResourceQuery);
            return new ResultJson().success(siteResourcePager);
        }
        catch (Exception e)
        {
            logger.error("site resource error! ", e);
            return new ResultJson().error();
        }
    }

    @RequestMapping("/save")
    public String toSave(Integer resourceId, Model model)
    {
        SiteResource resource = siteResourceService.searchById(resourceId);
        model.addAttribute("resource", resource);
        return "/site_res_save";
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public ResultJson save(SiteResource siteResource)
    {
        try
        {
            siteResourceService.saveOrUpdate(siteResource);
            return new ResultJson().success();
        }
        catch (Exception e)
        {
            logger.error("保存服务异常", e);
            return new ResultJson().error();
        }
    }

	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	@ResponseBody
	public ResultJson delete(Integer resourceId)
	{
		try
		{
			siteResourceService.deleteById(resourceId);
			return new ResultJson().success();
		}
		catch (Exception e)
		{
			logger.error("删除服务异常", e);
			return new ResultJson().error();
		}
	}
}
