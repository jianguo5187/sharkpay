package com.ruoyi.system.domain.vo;

public class HandleLotteryReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 期数 */
    private Long periods;

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
}
