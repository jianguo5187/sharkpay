package com.ruoyi.system.domain.vo;

public class FiveBallsAddBetRecordReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 期数 */
    private Long periods;

    /** 投注类型不能为空 */
    private Integer type;

    /** 投注号码不能为空 */
    private String number;

    /** 投注金额不能为空 */
    private Float money;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }
}
