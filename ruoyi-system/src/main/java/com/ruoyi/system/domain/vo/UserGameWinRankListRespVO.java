package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class UserGameWinRankListRespVO {

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date winTime;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 游戏ID */
    private Long gameId;

    /** 游戏标识ID */
    private String gameMarkId;

    /** 游戏名 */
    private String gameName;

    /** 记录表 */
    private String gameRecord;

    /** 用户余额 */
    private Float userAmount;

    /** 盈亏金额 */
    private Float winMoney;

    /** 大小单双盈亏金额 */
    private Float bigSmallMoney;

    /** 其他盈亏金额 */
    private Float otherMoney;

    /** 混合盈亏金额 */
    private Float combinationMoney;

    /** 扣除金额 */
    private Float deductMoney;

    /** 反水金额 */
    private Float cashBackMoney;

    /** 流水金额 */
    private Float totalBetMoney;

    /** 下注数 */
    private Integer recordCount;

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

    public Float getUserAmount() {
        return userAmount;
    }

    public void setUserAmount(Float userAmount) {
        this.userAmount = userAmount;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameMarkId() {
        return gameMarkId;
    }

    public void setGameMarkId(String gameMarkId) {
        this.gameMarkId = gameMarkId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameRecord() {
        return gameRecord;
    }

    public void setGameRecord(String gameRecord) {
        this.gameRecord = gameRecord;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Float getBigSmallMoney() {
        return bigSmallMoney;
    }

    public void setBigSmallMoney(Float bigSmallMoney) {
        this.bigSmallMoney = bigSmallMoney;
    }

    public Float getOtherMoney() {
        return otherMoney;
    }

    public void setOtherMoney(Float otherMoney) {
        this.otherMoney = otherMoney;
    }

    public Float getCombinationMoney() {
        return combinationMoney;
    }

    public void setCombinationMoney(Float combinationMoney) {
        this.combinationMoney = combinationMoney;
    }

    public Float getDeductMoney() {
        return deductMoney;
    }

    public void setDeductMoney(Float deductMoney) {
        this.deductMoney = deductMoney;
    }

    public Float getCashBackMoney() {
        return cashBackMoney;
    }

    public void setCashBackMoney(Float cashBackMoney) {
        this.cashBackMoney = cashBackMoney;
    }

    public Float getTotalBetMoney() {
        return totalBetMoney;
    }

    public void setTotalBetMoney(Float totalBetMoney) {
        this.totalBetMoney = totalBetMoney;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }
}
