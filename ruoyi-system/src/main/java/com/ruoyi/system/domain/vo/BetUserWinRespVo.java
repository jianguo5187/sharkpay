package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class BetUserWinRespVo {

    /** 记录ID */
    private Long betRecordId;

    /** 用户ID */
    private Long userId;

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 期数 */
    private Long periods;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date betOpenTime;

    /** 开奖结果 */
    private String openResult;

    /** 投注号码结果 */
    private String betResult;

    /** 是否已经开奖（0未开奖 1已开奖） */
    private String status;

    /** 下注金额 */
    private Float countMoney;

    /** 中奖金额 */
    private Float winMoney;

    /** 盈亏金额 */
    private Float resultMoney;

    /** 是否扣除 */
    private String isDeduct;

    public Long getBetRecordId() {
        return betRecordId;
    }

    public void setBetRecordId(Long betRecordId) {
        this.betRecordId = betRecordId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Date getBetOpenTime() {
        return betOpenTime;
    }

    public void setBetOpenTime(Date betOpenTime) {
        this.betOpenTime = betOpenTime;
    }

    public String getOpenResult() {
        return openResult;
    }

    public void setOpenResult(String openResult) {
        this.openResult = openResult;
    }

    public String getBetResult() {
        return betResult;
    }

    public void setBetResult(String betResult) {
        this.betResult = betResult;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getCountMoney() {
        return countMoney;
    }

    public void setCountMoney(Float countMoney) {
        this.countMoney = countMoney;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Float getResultMoney() {
        return resultMoney;
    }

    public void setResultMoney(Float resultMoney) {
        this.resultMoney = resultMoney;
    }

    public String getIsDeduct() {
        return isDeduct;
    }

    public void setIsDeduct(String isDeduct) {
        this.isDeduct = isDeduct;
    }
}
