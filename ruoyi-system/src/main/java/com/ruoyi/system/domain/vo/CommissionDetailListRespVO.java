package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CommissionDetailListRespVO {

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

    /** 上级用户备注名 */
    private String parentRemarkName;

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date winTime;

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 流水金额 */
    private Float totalBetMoney;

    /** 佣金金额 */
    private Float commissionMoney;

    /** 预佣金金额 */
    private Float preCommissionMoney;

    /** 佣金比例 */
    private Float commissionRate;

    private String commissionStatus;

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

    public Date getWinTime() {
        return winTime;
    }

    public void setWinTime(Date winTime) {
        this.winTime = winTime;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Float getTotalBetMoney() {
        return totalBetMoney;
    }

    public void setTotalBetMoney(Float totalBetMoney) {
        this.totalBetMoney = totalBetMoney;
    }

    public Float getCommissionMoney() {
        return commissionMoney;
    }

    public void setCommissionMoney(Float commissionMoney) {
        this.commissionMoney = commissionMoney;
    }

    public Float getPreCommissionMoney() {
        return preCommissionMoney;
    }

    public void setPreCommissionMoney(Float preCommissionMoney) {
        this.preCommissionMoney = preCommissionMoney;
    }

    public Float getCommissionRate() {
        return commissionRate;
    }

    public void setCommissionRate(Float commissionRate) {
        this.commissionRate = commissionRate;
    }

    public String getCommissionStatus() {
        return commissionStatus;
    }

    public void setCommissionStatus(String commissionStatus) {
        this.commissionStatus = commissionStatus;
    }
}
