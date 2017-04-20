package com.credit.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.credit.common.result.ResultJson;
import com.credit.common.util.security.DigestUtils;
import com.credit.common.web.xuser.XUser;
import com.credit.common.web.xuser.XUserSession;
import com.credit.common.web.xuser.XUserSessionManager;
import com.credit.entity.Admin;
import com.credit.service.AdminService;

/**
 * Created by Michael Chan on 4/1/2017.
 */
@Controller
public class LoginController extends AbstractBaseController
{
    @Resource
    private AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResultJson ajaxLogin(String userName, String password, HttpServletRequest request)
    {
        XUser xUser = XUserSessionManager.getCurrent().getXUser();
        if (xUser != null && xUser.isSignedIn())
        {
            return new ResultJson().success();
        }
        if (StringUtils.isBlank(userName))
        {
            return new ResultJson().error(ResultJson.STATUS_CODE_FAIL, "请输入用户名！");
        }
        if (StringUtils.isBlank(password))
        {
            return new ResultJson().error(ResultJson.STATUS_CODE_FAIL, "请输入密码！");
        }
        try
        {
            Admin admin = adminService.searchByName(userName);
            if (admin == null)
            {
                return new ResultJson().paramError("找不到对应的用户！");
            }
            String passwordRecord = admin.getPassword();
            // 重新计算摘要
            String md5Password = DigestUtils.md5(DigestUtils.md5(password.getBytes("UTF-8")).getBytes("UTF-8"));
            if (!md5Password.equals(passwordRecord))
            {
                return new ResultJson().error(ResultJson.STATUS_CODE_FAIL, "您输入的密码错误！");
            }
            refreshUserSession(admin);
            return new ResultJson().success();
        }
        catch (Exception e)
        {
            logger.error("登陆异常", e);
            return new ResultJson().error(ResultJson.STATUS_CODE_EXCEPTION, "登陆异常");
        }
    }

    @RequestMapping("/login")
    public String login()
    {
        XUserSession userSession = getUserSession();
        if (userSession.getXUser().isSignedIn())
        {
            return "redirect:/";
        }
        return "login";
    }

    @RequestMapping("/logout")
    public String signOut()
    {
        clearUserSession();
        return "redirect:/login";
    }
}
