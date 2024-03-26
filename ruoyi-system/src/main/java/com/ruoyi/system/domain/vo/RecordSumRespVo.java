package com.ruoyi.system.domain.vo;

public class RecordSumRespVo {
    private Integer userCount;

    private Float CountMoney;

    private Float winMoney;

    public Integer getUserCount() {
        return userCount;
    }

    public void setUserCount(Integer userCount) {
        this.userCount = userCount;
    }

    public Float getCountMoney() {
        return CountMoney;
    }

    public void setCountMoney(Float countMoney) {
        CountMoney = countMoney;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }
}
