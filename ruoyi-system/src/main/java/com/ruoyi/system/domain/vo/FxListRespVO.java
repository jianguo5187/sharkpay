package com.ruoyi.system.domain.vo;

public class FxListRespVO {

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 返水金额 */
    private Float fxMoney;

    /** 未返水佣金 */
    private Float noFxMoney;

    /** 流水金额 */
    private Float sumMoney;

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

    public Float getFxMoney() {
        return fxMoney;
    }

    public void setFxMoney(Float fxMoney) {
        this.fxMoney = fxMoney;
    }

    public Float getNoFxMoney() {
        return noFxMoney;
    }

    public void setNoFxMoney(Float noFxMoney) {
        this.noFxMoney = noFxMoney;
    }

    public Float getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(Float sumMoney) {
        this.sumMoney = sumMoney;
    }
}
