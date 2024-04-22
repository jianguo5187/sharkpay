package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ThreeBallKjRecordMoneyRespVO {

    /** 期数 */
    private Long periods;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date opentime;

    /** 开奖号码 */
    private String openCode;

    /** 开奖号码显示值 */
    private String openCodeName;

    /** 余额 */
    private Float money;

    /** 开奖状态(1：开奖，0：未开奖) */
    private String lotteryStatus;

    /** 下注开奖状态(1：有下注，0：没下注) */
    private String recordStatus;

    /** 盈亏余额 */
    private Float profitLossMoney;

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Date getOpentime() {
        return opentime;
    }

    public void setOpentime(Date opentime) {
        this.opentime = opentime;
    }

    public String getOpenCode() {
        return openCode;
    }

    public void setOpenCode(String openCode) {
        this.openCode = openCode;
    }

    public String getOpenCodeName() {
        return openCodeName;
    }

    public void setOpenCodeName(String openCodeName) {
        this.openCodeName = openCodeName;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getLotteryStatus() {
        return lotteryStatus;
    }

    public void setLotteryStatus(String lotteryStatus) {
        this.lotteryStatus = lotteryStatus;
    }

    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    public Float getProfitLossMoney() {
        return profitLossMoney;
    }

    public void setProfitLossMoney(Float profitLossMoney) {
        this.profitLossMoney = profitLossMoney;
    }
}
