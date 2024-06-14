package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CashBackDetailListRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date winTime;

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 流水金额 */
    private Float totalBetMoney;

    /** 盈亏金额 */
    private Float winMoney;

    /** 预反水金额 */
    private Float preCashBackMoney;

    /** 反水金额 */
    private Float cashBackMoney;

    /** 回水比例 */
    private Float cashBackRate;

    private String cashBackStatus;

    public Date getWinTime() {
        return winTime;
    }

    public void setWinTime(Date winTime) {
        this.winTime = winTime;
    }

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

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Float getPreCashBackMoney() {
        return preCashBackMoney;
    }

    public void setPreCashBackMoney(Float preCashBackMoney) {
        this.preCashBackMoney = preCashBackMoney;
    }

    public Float getCashBackMoney() {
        return cashBackMoney;
    }

    public void setCashBackMoney(Float cashBackMoney) {
        this.cashBackMoney = cashBackMoney;
    }

    public Float getCashBackRate() {
        return cashBackRate;
    }

    public void setCashBackRate(Float cashBackRate) {
        this.cashBackRate = cashBackRate;
    }

    public String getCashBackStatus() {
        return cashBackStatus;
    }

    public void setCashBackStatus(String cashBackStatus) {
        this.cashBackStatus = cashBackStatus;
    }
}
