package com.ruoyi.system.domain.vo;

public class AgentUserListRespVo {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 上级用户ID */
    private Long parentUserId;

    /** 上级用户昵称 */
    private String parentNickName;

    /** 上级真实姓名 */
    private String parentRealName;

    /** 上级备注名 */
    private String parentRemarkName;

    /** 总佣金金额 */
    private Float totalCommissionMoney;

    /** 今日佣金金额 */
    private Float todayCommissionMoney;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public String getParentNickName() {
        return parentNickName;
    }

    public void setParentNickName(String parentNickName) {
        this.parentNickName = parentNickName;
    }

    public String getParentRealName() {
        return parentRealName;
    }

    public void setParentRealName(String parentRealName) {
        this.parentRealName = parentRealName;
    }

    public String getParentRemarkName() {
        return parentRemarkName;
    }

    public void setParentRemarkName(String parentRemarkName) {
        this.parentRemarkName = parentRemarkName;
    }

    public Float getTotalCommissionMoney() {
        return totalCommissionMoney;
    }

    public void setTotalCommissionMoney(Float totalCommissionMoney) {
        this.totalCommissionMoney = totalCommissionMoney;
    }

    public Float getTodayCommissionMoney() {
        return todayCommissionMoney;
    }

    public void setTodayCommissionMoney(Float todayCommissionMoney) {
        this.todayCommissionMoney = todayCommissionMoney;
    }
}
