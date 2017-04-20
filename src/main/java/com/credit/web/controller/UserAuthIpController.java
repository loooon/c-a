package com.credit.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.credit.common.result.ResultJson;
import com.credit.dao.query.Pager;
import com.credit.dao.query.UserQuery;
import com.credit.entity.dto.UserAuthIpDto;
import com.credit.service.UserAuthIpService;

import java.util.List;

/**
 * Created by wangjunling on 2017/4/11.
 */
@Controller
@RequestMapping("/user/ip")
public class UserAuthIpController extends AbstractBaseController
{

    @Resource
    private UserAuthIpService userAuthIpService;

    @RequestMapping("/list")
    public String toList()
    {
        return "user_ip_list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public ResultJson list(UserQuery userQuery)
    {
        Pager<UserAuthIpDto> pager = userAuthIpService.searchPage(userQuery);
        return new ResultJson().success(pager);
    }

    @RequestMapping("/update")
    public String toUpdate(Integer userId, Model model)
    {
    	String ips = userAuthIpService.searchIpsByUserId(userId);
		model.addAttribute("ips",ips);
		model.addAttribute("userId",userId);
        return "user_ip_save";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultJson update(UserAuthIpDto authIpDto)
    {
        try
        {
            userAuthIpService.updateByUserAuthIpDto(authIpDto);
        }
        catch (Exception e)
        {
            logger.error("更新用户授权ip异常,e:{}", e);
            return new ResultJson().error();
        }
        return new ResultJson().success();
    }
}
