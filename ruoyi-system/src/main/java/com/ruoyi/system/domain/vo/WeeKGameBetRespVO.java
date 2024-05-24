package com.ruoyi.system.domain.vo;

public class WeeKGameBetRespVO {

    /** 投注日期 */
    private String betDay;

    /** 游戏名 */
    private String gameName;

    /** 投注金额 */
    private Float betMoney;

    public String getBetDay() {
        return betDay;
    }

    public void setBetDay(String betDay) {
        this.betDay = betDay;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Float getBetMoney() {
        return betMoney;
    }

    public void setBetMoney(Float betMoney) {
        this.betMoney = betMoney;
    }

    public String getMapKey(){
        return this.betDay + "_" + this.gameName;
    }
}
