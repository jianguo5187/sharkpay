package com.ruoyi.system.domain.vo;

public class AddAutoBetRecordReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 追号期数 */
    private Long periods;

    /** 追号投注类型不能为空 */
    private Integer type;

    /** 追号投注号码不能为空 */
    private String number;

    /** 追号金额不能为空 */
    private Float money;

    /** 追停状态（0否 1是） */
    private String winStopStatus;

    /** 追号期数 */
    private Integer autoBetCount;

    /** 追号倍数 */
    private Integer autoBetTimes;

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

    public String getWinStopStatus() {
        return winStopStatus;
    }

    public void setWinStopStatus(String winStopStatus) {
        this.winStopStatus = winStopStatus;
    }

    public Integer getAutoBetCount() {
        return autoBetCount;
    }

    public void setAutoBetCount(Integer autoBetCount) {
        this.autoBetCount = autoBetCount;
    }

    public Integer getAutoBetTimes() {
        return autoBetTimes;
    }

    public void setAutoBetTimes(Integer autoBetTimes) {
        this.autoBetTimes = autoBetTimes;
    }
}
