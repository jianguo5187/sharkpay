package com.ruoyi.system.domain.vo;

public class BetRealTimeReqVO {
    /** 游戏ID */
    private Long gameId;

    /** 用户ID */
    private Long userId;

    /** 仅看未结算Flg */
    private String settledFlgStr;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getSettledFlgStr() {
        return settledFlgStr;
    }

    public void setSettledFlgStr(String settledFlgStr) {
        this.settledFlgStr = settledFlgStr;
    }
}
