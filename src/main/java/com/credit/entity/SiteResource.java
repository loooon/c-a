package com.credit.entity;

import java.util.Date;

public class SiteResource
{

	public static int RESOURCE_STATUS_DELETE = 1;

	public static int RESOURCE_STATUS_DEFAULT = 0;

    private Integer resourceId;

    private String resourcePath;

    private String resourceName;

    private Integer parentId;

    private Integer resourceType;

    private Date updateTime;

    private Date createTime;

    private Integer resourceStatus;

    public Integer getResourceId()
    {
        return resourceId;
    }

    public void setResourceId(Integer resourceId)
    {
        this.resourceId = resourceId;
    }

    public String getResourcePath()
    {
        return resourcePath;
    }

    public void setResourcePath(String resourcePath)
    {
        this.resourcePath = resourcePath;
    }

    public String getResourceName()
    {
        return resourceName;
    }

    public void setResourceName(String resourceName)
    {
        this.resourceName = resourceName;
    }

    public Integer getParentId()
    {
        return parentId;
    }

    public void setParentId(Integer parentId)
    {
        this.parentId = parentId;
    }

    public Integer getResourceType()
    {
        return resourceType;
    }

    public void setResourceType(Integer resourceType)
    {
        this.resourceType = resourceType;
    }

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public Integer getResourceStatus()
    {
        return resourceStatus;
    }

    public void setResourceStatus(Integer resourceStatus)
    {
        this.resourceStatus = resourceStatus;
    }
}