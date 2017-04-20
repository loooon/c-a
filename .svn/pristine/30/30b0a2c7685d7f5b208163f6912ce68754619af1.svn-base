package com.credit.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WebContext
{

    private static final Logger logger = LoggerFactory.getLogger(WebContext.class);

    private static ThreadLocal<HttpServletRequest> requestContext = new ThreadLocal<>();

    private static ThreadLocal<HttpServletResponse> responseContext = new ThreadLocal<>();

    public static void init(HttpServletRequest request, HttpServletResponse response)
    {
        setRequest(request);
        setResponse(response);
    }

    public static HttpServletRequest getRequest()
    {
        return requestContext.get();
    }


    public static HttpServletResponse getResponse()
    {
        return responseContext.get();
    }

    public static void setRequest(HttpServletRequest request)
    {
        requestContext.set(request);
    }

    public static void setResponse(HttpServletResponse response)
    {
        responseContext.set(response);
    }

    public static void clear()
    {
        requestContext.remove();
        responseContext.remove();
    }

    public static String getParam(String name)
    {
        return requestContext.get().getParameter(name);
    }

    public static String getStr(String name)
    {
        return getStr(name, StringUtils.EMPTY);
    }

    public static String getStr(String name, String defaultValue)
    {
        String v = getParam(name);
        if (StringUtils.isBlank(v))
        {
            return defaultValue;
        }

        return v;
    }
}
