package com.ruoyi.system.domain.vo;

public class TenBallsOddsReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 上一期ID */
    private Long lastPeriods;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Long getLastPeriods() {
        return lastPeriods;
    }

    public void setLastPeriods(Long lastPeriods) {
        this.lastPeriods = lastPeriods;
    }
}
