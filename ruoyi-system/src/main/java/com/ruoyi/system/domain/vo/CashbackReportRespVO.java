package com.ruoyi.system.domain.vo;

public class CashbackReportRespVO {

    /** 日期 */
    private String calendarDate;

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 投注 */
    private Float betMoneyTotal;

    /** 已反水 */
    private Float cashBackMoneyTotal;

    /** 待反水 */
    private Float noCashBackMoneyTotal;

    public String getCalendarDate() {
        return calendarDate;
    }

    public void setCalendarDate(String calendarDate) {
        this.calendarDate = calendarDate;
    }

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

    public Float getBetMoneyTotal() {
        return betMoneyTotal;
    }

    public void setBetMoneyTotal(Float betMoneyTotal) {
        this.betMoneyTotal = betMoneyTotal;
    }

    public Float getCashBackMoneyTotal() {
        return cashBackMoneyTotal;
    }

    public void setCashBackMoneyTotal(Float cashBackMoneyTotal) {
        this.cashBackMoneyTotal = cashBackMoneyTotal;
    }

    public Float getNoCashBackMoneyTotal() {
        return noCashBackMoneyTotal;
    }

    public void setNoCashBackMoneyTotal(Float noCashBackMoneyTotal) {
        this.noCashBackMoneyTotal = noCashBackMoneyTotal;
    }
}
