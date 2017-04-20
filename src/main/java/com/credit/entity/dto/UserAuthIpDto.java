package com.credit.entity.dto;

/**
 * Created by wangjunling on 2017/4/11.
 */
public class UserAuthIpDto
{
    private Integer userId;

    private String userName;

    private String userVkey;

    private String authIps;

    public Integer getUserId()
    {
        return userId;
    }

    public void setUserId(Integer userId)
    {
        this.userId = userId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserVkey()
    {
        return userVkey;
    }

    public void setUserVkey(String userVkey)
    {
        this.userVkey = userVkey;
    }

    public String getAuthIps()
    {
        return authIps;
    }

    public void setAuthIps(String authIps)
    {
        this.authIps = authIps;
    }
}
