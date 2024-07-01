package com.ruoyi.system.domain.vo;

public class CollectReportRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 会员头像 */
    private String avatar;

    /** 投注期数	 */
    private Integer betCnt;

    /** 投注 */
    private Float betMoneyTotal;

    /** 中奖金额 */
    private Float betWinMoneyTotal;

    /** 用户盈亏 */
    private Float winMoneyTotal;

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

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getBetCnt() {
        return betCnt;
    }

    public void setBetCnt(Integer betCnt) {
        this.betCnt = betCnt;
    }

    public Float getBetMoneyTotal() {
        return betMoneyTotal;
    }

    public void setBetMoneyTotal(Float betMoneyTotal) {
        this.betMoneyTotal = betMoneyTotal;
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
