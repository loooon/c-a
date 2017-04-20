package com.credit.enumeration;

/**
 * Created by wangjunling on 2017/4/13.
 */
public enum GrayscaleDateEnum
{
    ALL("all","详单周期内"),L1w("l1w", "近一周"), L2w("l2w", "近两周"), L3w("l3w", "近三周"), L1M("l1m", "近一个月"), L2M("l2m", "近两个月"), L3M("l3m", "近三个月"), L4M(
            "l4m", "近四个月"), L5M("l5m", "近五个月"), L6M("l6m", "近六个月");

    private String name;

    private String description;

    GrayscaleDateEnum(String name, String description)
    {
        this.name = name;
        this.description = description;
    }

    public static String getDesc(String name)
    {
        for (GrayscaleDateEnum grayscaleDateEnum : values())
        {
            if (grayscaleDateEnum.getName().equals(name))
            {
                return grayscaleDateEnum.getDescription();
            }
        }
        return "";
    }

    public String getName()
    {
        return name;
    }

    public String getDescription()
    {
        return description;
    }
}
