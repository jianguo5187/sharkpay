package com.ruoyi.system.domain.vo;

public class UserMoneyUpTotalListRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 流水金额 */
    private Float cashMoney;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Float getCashMoney() {
        return cashMoney;
    }

    public void setCashMoney(Float cashMoney) {
        this.cashMoney = cashMoney;
    }
}
