package com.ruoyi.system.domain.vo;

public class CommissionReportRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 用户备注名 */
    private String remarkName;

    /** 投注 */
    private Float betMoneyTotal;

    /** 佣金 */
    private Float commissionMoneyTotal;

    /** 未返佣金 */
    private Float noCommissionMoneyTotal;

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

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public Float getBetMoneyTotal() {
        return betMoneyTotal;
    }

    public void setBetMoneyTotal(Float betMoneyTotal) {
        this.betMoneyTotal = betMoneyTotal;
    }

    public Float getCommissionMoneyTotal() {
        return commissionMoneyTotal;
    }

    public void setCommissionMoneyTotal(Float commissionMoneyTotal) {
        this.commissionMoneyTotal = commissionMoneyTotal;
    }

    public Float getNoCommissionMoneyTotal() {
        return noCommissionMoneyTotal;
    }

    public void setNoCommissionMoneyTotal(Float noCommissionMoneyTotal) {
        this.noCommissionMoneyTotal = noCommissionMoneyTotal;
    }
}
