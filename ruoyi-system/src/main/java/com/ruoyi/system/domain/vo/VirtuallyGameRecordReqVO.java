package com.ruoyi.system.domain.vo;

public class VirtuallyGameRecordReqVO {

    /** 游戏ID */
    private Long gameId;

    /** id(期数) */
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
