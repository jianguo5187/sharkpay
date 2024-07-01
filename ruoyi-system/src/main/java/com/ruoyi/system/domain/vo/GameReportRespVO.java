package com.ruoyi.system.domain.vo;

public class GameReportRespVO {

    /** 日期 */
    private String calendarDate;

    /** 投注 */
    private Float betMoneyTotal;

    /** 中奖 */
    private Float betWinMoneyTotal;

    /** 平台盈亏 */
    private Float winMoneyTotal;

    public String getCalendarDate() {
        return calendarDate;
    }

    public void setCalendarDate(String calendarDate) {
        this.calendarDate = calendarDate;
    }

    public Float getBetMoneyTotal() {
        return betMoneyTotal;
    }

    public void setBetMoneyTotal(Float betMoneyTotal) {
        this.betMoneyTotal = betMoneyTotal;
    }

    public Float getBetWinMoneyTotal() {
        return betWinMoneyTotal;
    }

    public void setBetWinMoneyTotal(Float betWinMoneyTotal) {
        this.betWinMoneyTotal = betWinMoneyTotal;
    }

    public Float getWinMoneyTotal() {
        return winMoneyTotal;
    }

    public void setWinMoneyTotal(Float winMoneyTotal) {
        this.winMoneyTotal = winMoneyTotal;
    }
}
