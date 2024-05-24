package com.ruoyi.system.domain.vo;

import java.util.List;

public class HomePageDataRespVO {

    /** 用户数 */
    private Integer userCnt;

    /** 投注总额 */
    private Float betTotalAmount;

    /** 中奖总额 */
    private Float betWinTotalAmount;

    /** 今日盈亏 */
    private Float todayWinMoney;

    /** 上下分图标标题 */
    private List<String> upDownMoneyEchartTitle;

    /** 上分图标内容 */
    private List<Float> upMoneyEchartSeriesData;

    /** 上分图标内容 */
    private List<Float> downMoneyEchartSeriesData;

    /** 投注图标标题 */
    private List<String> gameBetEchartTitle;

    /** 投注游戏列表 */
    private List<String> gameBetEchartLegend;

    /** 投注游戏内容 */
    private List<EChartsSeriesDataDto> gameBetEchartSeries;

    public Integer getUserCnt() {
        return userCnt;
    }

    public void setUserCnt(Integer userCnt) {
        this.userCnt = userCnt;
    }

    public Float getBetTotalAmount() {
        return betTotalAmount;
    }

    public void setBetTotalAmount(Float betTotalAmount) {
        this.betTotalAmount = betTotalAmount;
    }

    public Float getBetWinTotalAmount() {
        return betWinTotalAmount;
    }

    public void setBetWinTotalAmount(Float betWinTotalAmount) {
        this.betWinTotalAmount = betWinTotalAmount;
    }

    public Float getTodayWinMoney() {
        return todayWinMoney;
    }

    public void setTodayWinMoney(Float todayWinMoney) {
        this.todayWinMoney = todayWinMoney;
    }

    public List<String> getUpDownMoneyEchartTitle() {
        return upDownMoneyEchartTitle;
    }

    public void setUpDownMoneyEchartTitle(List<String> upDownMoneyEchartTitle) {
        this.upDownMoneyEchartTitle = upDownMoneyEchartTitle;
    }

    public List<Float> getUpMoneyEchartSeriesData() {
        return upMoneyEchartSeriesData;
    }

    public void setUpMoneyEchartSeriesData(List<Float> upMoneyEchartSeriesData) {
        this.upMoneyEchartSeriesData = upMoneyEchartSeriesData;
    }

    public List<Float> getDownMoneyEchartSeriesData() {
        return downMoneyEchartSeriesData;
    }

    public void setDownMoneyEchartSeriesData(List<Float> downMoneyEchartSeriesData) {
        this.downMoneyEchartSeriesData = downMoneyEchartSeriesData;
    }

    public List<String> getGameBetEchartTitle() {
        return gameBetEchartTitle;
    }

    public void setGameBetEchartTitle(List<String> gameBetEchartTitle) {
        this.gameBetEchartTitle = gameBetEchartTitle;
    }

    public List<String> getGameBetEchartLegend() {
        return gameBetEchartLegend;
    }

    public void setGameBetEchartLegend(List<String> gameBetEchartLegend) {
        this.gameBetEchartLegend = gameBetEchartLegend;
    }

    public List<EChartsSeriesDataDto> getGameBetEchartSeries() {
        return gameBetEchartSeries;
    }

    public void setGameBetEchartSeries(List<EChartsSeriesDataDto> gameBetEchartSeries) {
        this.gameBetEchartSeries = gameBetEchartSeries;
    }
}
