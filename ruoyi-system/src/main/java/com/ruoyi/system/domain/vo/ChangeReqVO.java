package com.ruoyi.system.domain.vo;

public class ChangeReqVO {

    /** 充值金额 */
    private Float money;

    /** 充值类型(1：支付宝 2：微信 3：银联) */
    private Long changeType;

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Long getChangeType() {
        return changeType;
    }

    public void setChangeType(Long changeType) {
        this.changeType = changeType;
    }
}
