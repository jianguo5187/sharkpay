package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class NoCashBackDetailListRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 用户头像 */
    private String avatar;

    /** 用户余额 */
    private Float amount;

    /** 充值金额 */
    private Float upMoneyTotal;

    /** 投注金额 */
    private Float totalBetMoney;

    /** 中奖金额 */
    private Float betWinMoneyTotal;

    /** 盈亏金额 */
    private Float winMoney;

    /** 预反水金额 */
    private Float preCashBackMoney;

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

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Float getUpMoneyTotal() {
        return upMoneyTotal;
    }

    public void setUpMoneyTotal(Float upMoneyTotal) {
        this.upMoneyTotal = upMoneyTotal;
    }

    public Float getTotalBetMoney() {
        return totalBetMoney;
    }

    public void setTotalBetMoney(Float totalBetMoney) {
        this.totalBetMoney = totalBetMoney;
    }

    public Float getBetWinMoneyTotal() {
        return betWinMoneyTotal;
    }

    public void setBetWinMoneyTotal(Float betWinMoneyTotal) {
        this.betWinMoneyTotal = betWinMoneyTotal;
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
}
