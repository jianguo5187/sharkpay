package com.ruoyi.system.domain.vo;

public class UserReportRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 会员头像 */
    private String avatar;

    /** 上级用户ID */
    private Long parentUserId;

    /** 投注 */
    private Float betMoneyTotal;

    /** 中奖 */
    private Float betWinMoneyTotal;

    /** 用户盈亏 */
    private Float winMoneyTotal;

    /** 上分 */
    private Float upMoneyTotal;

    /** 签到 */
    private Float signMoneyTotal;

    /** 下分 */
    private Float downMoneyTotal;

    /** 佣金 */
    private Float commissionMoneyTotal;

    /** 已反水 */
    private Float cashBackMoneyTotal;

    /** 待反水 */
    private Float noCashBackMoneyTotal;

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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Float getBetMoneyTotal() {
        return betMoneyTotal;
    }

    public void setBetMoneyTotal(Float betMoneyTotal) {
        this.betMoneyTotal = betMoneyTotal;
    }

    public Float getBetWinMoneyTotal() {
        return betWinMoneyTotal;
    }

    public void setBetWinMoneyTotal(Float betWinMoneyTotal) {
        this.betWinMoneyTotal = betWinMoneyTotal;
    }

    public Float getWinMoneyTotal() {
        return winMoneyTotal;
    }

    public void setWinMoneyTotal(Float winMoneyTotal) {
        this.winMoneyTotal = winMoneyTotal;
    }

    public Float getUpMoneyTotal() {
        return upMoneyTotal;
    }

    public void setUpMoneyTotal(Float upMoneyTotal) {
        this.upMoneyTotal = upMoneyTotal;
    }

    public Float getSignMoneyTotal() {
        return signMoneyTotal;
    }

    public void setSignMoneyTotal(Float signMoneyTotal) {
        this.signMoneyTotal = signMoneyTotal;
    }

    public Float getDownMoneyTotal() {
        return downMoneyTotal;
    }

    public void setDownMoneyTotal(Float downMoneyTotal) {
        this.downMoneyTotal = downMoneyTotal;
    }

    public Float getCommissionMoneyTotal() {
        return commissionMoneyTotal;
    }

    public void setCommissionMoneyTotal(Float commissionMoneyTotal) {
        this.commissionMoneyTotal = commissionMoneyTotal;
    }

    public Float getCashBackMoneyTotal() {
        return cashBackMoneyTotal;
    }

    public void setCashBackMoneyTotal(Float cashBackMoneyTotal) {
        this.cashBackMoneyTotal = cashBackMoneyTotal;
    }

    public Float getNoCashBackMoneyTotal() {
        return noCashBackMoneyTotal;
    }

    public void setNoCashBackMoneyTotal(Float noCashBackMoneyTotal) {
        this.noCashBackMoneyTotal = noCashBackMoneyTotal;
    }
}
