package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class BetkjRespVo {

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

    /** 是否已经开奖（0未开奖 1已开奖） */
    private String status;

    /** 下注金额 */
    private Float countMoney;

    /** 中奖金额 */
    private Float winMoney;

    /** 游戏类别 */
    private String gameType;

    /** 是否系统开奖区分(N否 Y是) */
    private String systemOpenType;

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

    public String getGameType() {
        return gameType;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public String getSystemOpenType() {
        return systemOpenType;
    }

    public void setSystemOpenType(String systemOpenType) {
        this.systemOpenType = systemOpenType;
    }
}
