package com.credit.entity;

import java.util.Date;

public class User {
    private Integer userId;

    private String vkey;

    private String userNo;

    private String userName;

    private String companyName;

    private String productName;

    private Date expireDate;

    private Integer verifyStateCode;

    private String verifyStateName;

    private String email;

    private String userNickname;

    private String password;

    private Date regTime;

    private Integer visits;

    private Date lastLogintime;

    private Integer userType;

    private String phone;

    private Integer smsUploadCount;

    private Integer dunNumberMarkCount;

    private Integer callDetailMarkCount;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getVkey() {
        return vkey;
    }

    public void setVkey(String vkey) {
        this.vkey = vkey;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public Integer getVerifyStateCode() {
        return verifyStateCode;
    }

    public void setVerifyStateCode(Integer verifyStateCode) {
        this.verifyStateCode = verifyStateCode;
    }

    public String getVerifyStateName() {
        return verifyStateName;
    }

    public void setVerifyStateName(String verifyStateName) {
        this.verifyStateName = verifyStateName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Integer getVisits() {
        return visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }

    public Date getLastLogintime() {
        return lastLogintime;
    }

    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSmsUploadCount() {
        return smsUploadCount;
    }

    public void setSmsUploadCount(Integer smsUploadCount) {
        this.smsUploadCount = smsUploadCount;
    }

    public Integer getDunNumberMarkCount() {
        return dunNumberMarkCount;
    }

    public void setDunNumberMarkCount(Integer dunNumberMarkCount) {
        this.dunNumberMarkCount = dunNumberMarkCount;
    }

    public Integer getCallDetailMarkCount() {
        return callDetailMarkCount;
    }

    public void setCallDetailMarkCount(Integer callDetailMarkCount) {
        this.callDetailMarkCount = callDetailMarkCount;
    }
}