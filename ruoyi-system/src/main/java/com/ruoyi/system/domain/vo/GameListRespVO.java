package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class GameListRespVO {

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 期数 */
    private Long periods;

    /** 投注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recordTime;

    /** 注数 */
    private Integer countMoney;

    /** 中奖金额 */
    private Float winMoney;

    /** 投注金额 */
    private Float betMoney;

    /** 投注状态（0投注 1撤单） */
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }

    public Integer getCountMoney() {
        return countMoney;
    }

    public void setCountMoney(Integer countMoney) {
        this.countMoney = countMoney;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Float getBetMoney() {
        return betMoney;
    }

    public void setBetMoney(Float betMoney) {
        this.betMoney = betMoney;
    }
}
