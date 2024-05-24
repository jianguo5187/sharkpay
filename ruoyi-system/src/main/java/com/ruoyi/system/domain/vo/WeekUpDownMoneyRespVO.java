package com.ruoyi.system.domain.vo;

public class WeekUpDownMoneyRespVO {

    /** 资金流水时间 */
    private String cashDay;

    /** 流水金额 */
    private Float cashMoney;

    public String getCashDay() {
        return cashDay;
    }

    public void setCashDay(String cashDay) {
        this.cashDay = cashDay;
    }

    public Float getCashMoney() {
        return cashMoney;
    }

    public void setCashMoney(Float cashMoney) {
        this.cashMoney = cashMoney;
    }
}
