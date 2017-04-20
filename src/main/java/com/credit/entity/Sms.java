package com.credit.entity;

import java.util.Date;

public class Sms {
    public static final Short SMS_STATE_PENDING = 0; // 待处理

    public static final Short SMS_STATE_SUCCESSED = 1; // 发送成功

    public static final Short SMS_STATE_FAILED = 2; // 发送失败

    public static final Short SMS_STATE_DELETED = 3; // 删除

    public static final String SMS_STATE_PENDING_NAME = "待处理";

    public static final String SMS_STATE_SUCCESSED_NAME = "发送成功";

    public static final String SMS_STATE_FAILED_NAME = "发送失败";

    public static final String SMS_STATE_DELETED_NAME = "删除";

    private Integer smsId;

    private String receiver;

    private String smsSerialNo;

    private String smsCode;

    private String smsContent;

    private Short smsState;

    private String smsFailReason;

    private String primaryResult;

    private Date createTime;

    private Date lastupdatetime;

    private Date expireTime;

    public Integer getSmsId() {
        return smsId;
    }

    public void setSmsId(Integer smsId) {
        this.smsId = smsId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getSmsSerialNo() {
        return smsSerialNo;
    }

    public void setSmsSerialNo(String smsSerialNo) {
        this.smsSerialNo = smsSerialNo;
    }

    public String getSmsCode() {
        return smsCode;
    }

    public void setSmsCode(String smsCode) {
        this.smsCode = smsCode;
    }

    public String getSmsContent() {
        return smsContent;
    }

    public void setSmsContent(String smsContent) {
        this.smsContent = smsContent;
    }

    public Short getSmsState() {
        return smsState;
    }

    public void setSmsState(Short smsState) {
        this.smsState = smsState;
    }

    public String getSmsFailReason() {
        return smsFailReason;
    }

    public void setSmsFailReason(String smsFailReason) {
        this.smsFailReason = smsFailReason;
    }

    public String getPrimaryResult() {
        return primaryResult;
    }

    public void setPrimaryResult(String primaryResult) {
        this.primaryResult = primaryResult;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }
}