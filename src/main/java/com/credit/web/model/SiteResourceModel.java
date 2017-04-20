package com.credit.web.model;

/**
 * Created by Michael Chan on 4/11/2017.
 */
public class SiteResourceModel
{
    private Integer resourceId;

    private String resourceName;

    private String isExist;

    private Integer dailyTimes;

    private Integer yearlyTimes;

    public SiteResourceModel()
    {
        super();
        this.isExist = "";
    }

    public Integer getResourceId()
    {
        return resourceId;
    }

    public void setResourceId(Integer resourceId)
    {
        this.resourceId = resourceId;
    }

    public String getResourceName()
    {
        return resourceName;
    }

    public void setResourceName(String resourceName)
    {
        this.resourceName = resourceName;
    }

    public String getIsExist()
    {
        return isExist;
    }

    public void setIsExist(String isExist)
    {
        this.isExist = isExist;
    }

    public Integer getDailyTimes()
    {
        return dailyTimes;
    }

    public void setDailyTimes(Integer dailyTimes)
    {
        this.dailyTimes = dailyTimes;
    }

    public Integer getYearlyTimes()
    {
        return yearlyTimes;
    }

    public void setYearlyTimes(Integer yearlyTimes)
    {
        this.yearlyTimes = yearlyTimes;
    }
}
