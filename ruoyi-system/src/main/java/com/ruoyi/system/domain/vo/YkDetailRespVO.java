package com.ruoyi.system.domain.vo;

public class YkDetailRespVO {
    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 盈亏 */
    private Float winMoney;

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

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }
}
