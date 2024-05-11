package com.ruoyi.system.domain.vo;

public class UserGameTotalRankListRespVO {

    /** 游戏ID */
    private Long gameId;

    /** 游戏标识ID */
    private String gameMarkId;

    /** 游戏名 */
    private String gameName;

    /** 盈亏金额 */
    private Float totalCashMoney;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameMarkId() {
        return gameMarkId;
    }

    public void setGameMarkId(String gameMarkId) {
        this.gameMarkId = gameMarkId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Float getTotalCashMoney() {
        return totalCashMoney;
    }

    public void setTotalCashMoney(Float totalCashMoney) {
        this.totalCashMoney = totalCashMoney;
    }
}
