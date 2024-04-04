package com.ruoyi.system.domain.vo;

public class BetkjReqVO {
    /** 游戏ID */
    private Long gameId;

    /** 期数 */
    private Long periods;

    /** 是否已经开奖（0未开奖 1已开奖） */
    private String status;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
