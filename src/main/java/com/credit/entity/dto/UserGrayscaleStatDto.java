package com.credit.entity.dto;

import com.credit.enumeration.GrayscaleDateEnum;
import com.credit.enumeration.GrayscaleDunEnum;
import com.credit.enumeration.GrayscaleTimeEnum;

/**
 * Created by wangjunling on 2017/4/14.
 */
public class UserGrayscaleStatDto
{
    private Integer id;

    private String variableDate;

    private String variableTime;

    private String variableDun;

    private String userVkey;

    private Integer userId;

    private String userName;

    private String variableName;

    private String allVariableName;

    private String variableDescription;

    private String variableDateDesc;

    private String variableTimeDesc;

    private String variableDunDesc;

    private String conditionName;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getVariableDate()
    {
        return variableDate;
    }

    public void setVariableDate(String variableDate)
    {
        this.variableDate = variableDate;
        this.variableDateDesc = GrayscaleDateEnum.getDesc(variableDate);
    }

    public String getVariableTime()
    {
        return variableTime;
    }

    public void setVariableTime(String variableTime)
    {
        this.variableTime = variableTime;
        this.variableTimeDesc = GrayscaleTimeEnum.getDesc(variableTime);
    }

    public String getVariableDun()
    {
        return variableDun;
    }

    public void setVariableDun(String variableDun)
    {
        this.variableDun = variableDun;
        this.variableDunDesc = GrayscaleDunEnum.getDesc(variableDun);
    }

    public String getUserVkey()
    {
        return userVkey;
    }

    public void setUserVkey(String userVkey)
    {
        this.userVkey = userVkey;
    }

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

    public String getVariableName()
    {
        return variableName;
    }

    public void setVariableName(String variableName)
    {
        this.variableName = variableName;
    }

    public String getAllVariableName()
    {
        return allVariableName;
    }

    public void setAllVariableName(String allVariableName)
    {
        this.allVariableName = allVariableName;
    }

    public String getVariableDescription()
    {
        return variableDescription;
    }

    public void setVariableDescription(String variableDescription)
    {
        this.variableDescription = variableDescription;
    }

    public String getVariableDateDesc()
    {
        return variableDateDesc;
    }

    public void setVariableDateDesc(String variableDateDesc)
    {
        this.variableDateDesc = variableDateDesc;
    }

    public String getVariableTimeDesc()
    {
        return variableTimeDesc;
    }

    public void setVariableTimeDesc(String variableTimeDesc)
    {
        this.variableTimeDesc = variableTimeDesc;
    }

    public String getVariableDunDesc()
    {
        return variableDunDesc;
    }

    public void setVariableDunDesc(String variableDunDesc)
    {
        this.variableDunDesc = variableDunDesc;
    }

    public String getConditionName()
    {
        return conditionName;
    }

    public void setConditionName(String conditionName)
    {
        this.conditionName = conditionName;
    }
}
