package com.ruoyi.system.domain.vo;

public class LastNoOpenRecordRespVo {

    /** 期数 */
    private Long periods;

    /** 预计开奖时间(时间戳) */
    private Long betTime;

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Long getBetTime() {
        return betTime;
    }

    public void setBetTime(Long betTime) {
        this.betTime = betTime;
    }
}
