package com.credit.enumeration;

/**
 * Created by wangjunling on 2017/4/13.
 */
public enum GrayscaleDunEnum
{
    DUN_NUMBER("cn", "催收号码"), DUN_PHONE_NUMBER("cm", "催收手机号"), CALL_DETAILS_NUMBER("ac", "所有号码");
    private String name;

    private String description;

    GrayscaleDunEnum(String name, String description)
    {
        this.name = name;
        this.description = description;
    }
	public static String getDesc(String name)
	{
		for (GrayscaleDunEnum dunEnum : values())
		{
			if (dunEnum.getName().equals(name))
			{
				return dunEnum.getDescription();
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
