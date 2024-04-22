package com.ruoyi.system.domain.vo;

public class FiveBallsTimeDateRespVO {

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 期数 */
    private Long periods;

    /** 封盘投注截止时间差(时间戳) */
    private Long preTime;

    /** 预计开奖时间(时间戳) */
    private Long betTime;

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

    public Long getPreTime() {
        return preTime;
    }

    public void setPreTime(Long preTime) {
        this.preTime = preTime;
    }

    public Long getBetTime() {
        return betTime;
    }

    public void setBetTime(Long betTime) {
        this.betTime = betTime;
    }
}
