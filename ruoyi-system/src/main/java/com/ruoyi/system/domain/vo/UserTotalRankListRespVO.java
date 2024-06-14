package com.ruoyi.system.domain.vo;

import java.util.List;

public class UserTotalRankListRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 账户剩余金额 */
    private Float userAmount;

    /** 盈亏金额 */
    private Float totalWinMoney;

    /** 反水金额 */
    private Float totalCashBackMoney;

    /** 流水金额 */
    private Float totalBetMoney;

    /** 加拿大2.0 */
    private float jnd20;

    /** 加拿大2.8 */
    private float jnd28;

    /** 加拿大3.2 */
    private float jnd32;

    /** 比特2.0 */
    private float jspc28;

    /** 比特2.8 */
    private float bt28;

    /** 极速赛车 */
    private float mssc;

    /** 澳洲幸运5高赔率 */
    private float azxy52;

    /** 澳洲幸运5 */
    private float azxy5;

    /** 澳洲幸运10 */
    private float azxy10;

    /** 澳洲幸运10高赔率 */
    private float azxy102;

    /** 幸运飞艇 */
    private float xyft;

    /** 168极速赛车 */
    private float jssc;

    /** 168极速飞艇 */
    private float jsft;

    /** 168极速赛车高赔率 */
    private float jssc2;

    /** 168极速时时彩 */
    private float jsssc;

    /** 幸运飞艇高赔率 */
    private float xyft2;

    private List<UserGameTotalRankListRespVO> gameTotalList;

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

    public Float getUserAmount() {
        return userAmount;
    }

    public void setUserAmount(Float userAmount) {
        this.userAmount = userAmount;
    }

    public Float getTotalWinMoney() {
        return totalWinMoney;
    }

    public void setTotalWinMoney(Float totalWinMoney) {
        this.totalWinMoney = totalWinMoney;
    }

    public Float getTotalCashBackMoney() {
        return totalCashBackMoney;
    }

    public void setTotalCashBackMoney(Float totalCashBackMoney) {
        this.totalCashBackMoney = totalCashBackMoney;
    }

    public Float getTotalBetMoney() {
        return totalBetMoney;
    }

    public void setTotalBetMoney(Float totalBetMoney) {
        this.totalBetMoney = totalBetMoney;
    }

    public List<UserGameTotalRankListRespVO> getGameTotalList() {
        return gameTotalList;
    }

    public void setGameTotalList(List<UserGameTotalRankListRespVO> gameTotalList) {
        this.gameTotalList = gameTotalList;
    }

    public float getJnd20() {
        return jnd20;
    }

    public void setJnd20(float jnd20) {
        this.jnd20 = jnd20;
    }

    public float getJnd28() {
        return jnd28;
    }

    public void setJnd28(float jnd28) {
        this.jnd28 = jnd28;
    }

    public float getJnd32() {
        return jnd32;
    }

    public void setJnd32(float jnd32) {
        this.jnd32 = jnd32;
    }

    public float getJspc28() {
        return jspc28;
    }

    public void setJspc28(float jspc28) {
        this.jspc28 = jspc28;
    }

    public float getBt28() {
        return bt28;
    }

    public void setBt28(float bt28) {
        this.bt28 = bt28;
    }

    public float getMssc() {
        return mssc;
    }

    public void setMssc(float mssc) {
        this.mssc = mssc;
    }

    public float getAzxy52() {
        return azxy52;
    }

    public void setAzxy52(float azxy52) {
        this.azxy52 = azxy52;
    }

    public float getAzxy5() {
        return azxy5;
    }

    public void setAzxy5(float azxy5) {
        this.azxy5 = azxy5;
    }

    public float getAzxy10() {
        return azxy10;
    }

    public void setAzxy10(float azxy10) {
        this.azxy10 = azxy10;
    }

    public float getAzxy102() {
        return azxy102;
    }

    public void setAzxy102(float azxy102) {
        this.azxy102 = azxy102;
    }

    public float getXyft() {
        return xyft;
    }

    public void setXyft(float xyft) {
        this.xyft = xyft;
    }

    public float getJssc() {
        return jssc;
    }

    public void setJssc(float jssc) {
        this.jssc = jssc;
    }

    public float getJsft() {
        return jsft;
    }

    public void setJsft(float jsft) {
        this.jsft = jsft;
    }

    public float getJssc2() {
        return jssc2;
    }

    public void setJssc2(float jssc2) {
        this.jssc2 = jssc2;
    }

    public float getJsssc() {
        return jsssc;
    }

    public void setJsssc(float jsssc) {
        this.jsssc = jsssc;
    }

    public float getXyft2() {
        return xyft2;
    }

    public void setXyft2(float xyft2) {
        this.xyft2 = xyft2;
    }
}
