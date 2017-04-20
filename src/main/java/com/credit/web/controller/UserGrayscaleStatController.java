package com.credit.web.controller;

import javax.annotation.Resource;

import com.credit.entity.GrayscaleVariable;
import com.credit.entity.UserGrayscaleStatVariable;
import com.credit.entity.dto.UserAuthIpDto;
import com.credit.enumeration.GrayscaleDateEnum;
import com.credit.enumeration.GrayscaleDunEnum;
import com.credit.enumeration.GrayscaleTimeEnum;
import com.credit.service.GrayscaleVariableService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.credit.common.result.ResultJson;
import com.credit.dao.query.Pager;
import com.credit.dao.query.UserQuery;
import com.credit.entity.dto.UserGrayscaleStatDto;
import com.credit.service.UserGrayscaleStatVariableService;

import java.util.List;

/**
 * Created by wangjunling on 2017/4/14.
 */
@Controller
@RequestMapping("/user/grayscale/variable")
public class UserGrayscaleStatController
{

    @Resource
    private UserGrayscaleStatVariableService userGrayscaleStatVariableService;

    @Resource
	private GrayscaleVariableService grayscaleVariableService;

    @RequestMapping("/list")
    public String toList()
    {
        return "user_variable_list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public ResultJson list(UserQuery userQuery)
    {
        Pager<UserGrayscaleStatDto> pager = userGrayscaleStatVariableService.searchPage(userQuery);
        return new ResultJson().success(pager);
    }

	@RequestMapping("/update")
	public String toSave(Integer userId,Model model)
	{
		List<GrayscaleVariable> variableList = grayscaleVariableService.searchAll();
		List<UserGrayscaleStatDto> userVariableList = userGrayscaleStatVariableService.searchByUserId(userId);
		model.addAttribute("variableList",variableList);
		model.addAttribute("userVariableList",userVariableList);
		model.addAttribute("dateEnum", GrayscaleDateEnum.values());
		model.addAttribute("timeEnum", GrayscaleTimeEnum.values());
		model.addAttribute("dunEnum", GrayscaleDunEnum.values());
		return "user_variable_save";
	}
}
