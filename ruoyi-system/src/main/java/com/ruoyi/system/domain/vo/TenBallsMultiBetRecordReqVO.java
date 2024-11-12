package com.ruoyi.system.domain.vo;

public class TenBallsMultiBetRecordReqVO {

    /** 投注类型不能为空 */
    private Integer type;

    /** 投注号码不能为空 */
    private String number;

    /** 投注金额不能为空 */
    private Float money;

    /** 追号ID */
    private Long autoBetRecordId;

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

    public Long getAutoBetRecordId() {
        return autoBetRecordId;
    }

    public void setAutoBetRecordId(Long autoBetRecordId) {
        this.autoBetRecordId = autoBetRecordId;
    }
}
