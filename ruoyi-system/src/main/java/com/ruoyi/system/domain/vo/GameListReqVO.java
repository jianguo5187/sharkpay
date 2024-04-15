package com.ruoyi.system.domain.vo;

public class GameListReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 下注时间 */
    private String filterDay;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getFilterDay() {
        return filterDay;
    }

    public void setFilterDay(String filterDay) {
        this.filterDay = filterDay;
    }
}
