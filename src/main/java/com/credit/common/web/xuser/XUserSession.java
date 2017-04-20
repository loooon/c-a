package com.credit.common.web.xuser;

import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;

import com.google.common.collect.Maps;

public class XUserSession
{

    private XUser xUser;

    private Map<String, Object> attrs;

    private String csrfToken;

    public XUserSession()
    {
        xUser = new XUser();
        attrs = Maps.newHashMap();
        csrfToken = RandomStringUtils.randomAlphanumeric(8);
    }

    public void setAttr(String name, Object object)
    {
        attrs.put(name, object);
    }

    public <T> T getAttr(String name)
    {
        return (T) attrs.get(name);
    }

    public String getCsrfToken()
    {
        return csrfToken;
    }

    public Map<String, Object> getAttrs()
    {
        return attrs;
    }

    public XUser getXUser()
    {
        return xUser;
    }

    /**
     * 返回当前用户, 永远不为空
     * 
     * @return
     */
    public static XUserSession getCurrent()
    {
        return XUserSessionManager.getCurrent();
    }

    public void setXUser(XUser xUser)
    {
        this.xUser = xUser;
    }
}
