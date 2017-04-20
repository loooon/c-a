package com.credit.common.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.credit.common.web.xuser.XUserSession;

public class CsrfInterceptor extends HandlerInterceptorAdapter
{

    private Logger logger = LoggerFactory.getLogger(CsrfInterceptor.class);

    private static String CSRF_TOKEN = "CSRF_TOKEN";

    private boolean debugMode = false;

    private List<String> excludePath;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        if (logger.isDebugEnabled())
        {
            logger.debug("");
        }

        if (isCheckCsrfToken(request))
        {
            return checkCsrfToken(request);
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception
    {

    }

    private boolean isCheckCsrfToken(HttpServletRequest request)
    {
        if (StringUtils.equalsIgnoreCase(request.getMethod(), "POST"))
        {
            return true;
        }

        return false;
    }

    private boolean checkCsrfToken(HttpServletRequest request)
    {
        return StringUtils.equals(request.getParameter("csrfToken"), getCsrfToken(request));
    }

    private String getCsrfToken(HttpServletRequest request)
    {
        return XUserSession.getCurrent().getCsrfToken();
    }

    public void setDebugMode(boolean debugMode)
    {
        this.debugMode = debugMode;
    }
}
