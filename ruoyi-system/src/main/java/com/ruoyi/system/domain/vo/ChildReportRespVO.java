package com.ruoyi.system.domain.vo;

public class ChildReportRespVO {

    /** 日期 */
    private String calendarDate;

    /** 投注 */
    private Float betMoneyTotal;

    /** 上分 */
    private Float upMoneyTotal;

    /** 下分 */
    private Float downMoneyTotal;

    /** 已反水 */
    private Float cashBackMoneyTotal;

    /** 待反水 */
    private Float noCashBackMoneyTotal;

    /** 佣金 */
    private Float commissionMoneyTotal;

    /** 中奖 */
    private Float betWinMoneyTotal;

    /** 盈亏 */
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

    public Float getUpMoneyTotal() {
        return upMoneyTotal;
    }

    public void setUpMoneyTotal(Float upMoneyTotal) {
        this.upMoneyTotal = upMoneyTotal;
    }

    public Float getDownMoneyTotal() {
        return downMoneyTotal;
    }

    public void setDownMoneyTotal(Float downMoneyTotal) {
        this.downMoneyTotal = downMoneyTotal;
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

    public Float getCommissionMoneyTotal() {
        return commissionMoneyTotal;
    }

    public void setCommissionMoneyTotal(Float commissionMoneyTotal) {
        this.commissionMoneyTotal = commissionMoneyTotal;
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
