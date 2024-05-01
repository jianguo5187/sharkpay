package com.ruoyi.system.domain.vo;

public class FyListRespVO {

    /** 下线用户ID */
    private Long userId;

    /** 下线登陆账号 */
    private String nickName;

    /** 返佣金额 */
    private Float fyMoney;

    /** 未返佣金 */
    private Float noFyMoney;

    /** 流水金额 */
    private Float sumMoney;

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

    public Float getFyMoney() {
        return fyMoney;
    }

    public void setFyMoney(Float fyMoney) {
        this.fyMoney = fyMoney;
    }

    public Float getNoFyMoney() {
        return noFyMoney;
    }

    public void setNoFyMoney(Float noFyMoney) {
        this.noFyMoney = noFyMoney;
    }

    public Float getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(Float sumMoney) {
        this.sumMoney = sumMoney;
    }
}
