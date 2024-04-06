package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 5球开奖对象 game_fiveball_kj
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameFiveballKj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 5球开奖历史ID */
    private Long id;

    /** 期数 */
    @Excel(name = "期数")
    private Long periods;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 是否已经开奖（0未开奖 1已开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=已经开奖,1=未开奖")
    private String status;

    /** 封盘投注截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "封盘投注截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    /** 预计开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预计开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date theTime;

    /** 总下注金额 */
    @Excel(name = "总下注金额")
    private Float countMoney;

    /** 总中奖金额 */
    @Excel(name = "总中奖金额")
    private Float winMoney;

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Integer num1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer num2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer num3;

    /** 开奖号码4 */
    @Excel(name = "开奖号码4")
    private Integer num4;

    /** 开奖号码5 */
    @Excel(name = "开奖号码5")
    private Integer num5;

    /** 开奖合计号码 */
    @Excel(name = "开奖合计号码")
    private Integer sum;

    /** 开奖号码1大小 */
    @Excel(name = "开奖号码1大小")
    private Integer num1Bs;

    /** 开奖号码1单双 */
    @Excel(name = "开奖号码1单双")
    private Integer num1Sd;

    /** 开奖号码2大小 */
    @Excel(name = "开奖号码2大小")
    private Integer num2Bs;

    /** 开奖号码2单双 */
    @Excel(name = "开奖号码2单双")
    private Integer num2Sd;

    /** 开奖号码3大小 */
    @Excel(name = "开奖号码3大小")
    private Integer num3Bs;

    /** 开奖号码3单双 */
    @Excel(name = "开奖号码3单双")
    private Integer num3Sd;

    /** 开奖号码4大小 */
    @Excel(name = "开奖号码4大小")
    private Integer num4Bs;

    /** 开奖号码4单双 */
    @Excel(name = "开奖号码4单双")
    private Integer num4Sd;

    /** 开奖号码5大小 */
    @Excel(name = "开奖号码5大小")
    private Integer num5Bs;

    /** 开奖号码5单双 */
    @Excel(name = "开奖号码5单双")
    private Integer num5Sd;

    /** 开奖合计号码大小 */
    @Excel(name = "开奖合计号码大小")
    private Integer sumBs;

    /** 开奖合计号码单双 */
    @Excel(name = "开奖合计号码单双")
    private Integer sumSd;

    /** 开奖合计号码和虎龙 */
    @Excel(name = "开奖合计号码和虎龙")
    private Integer sumLts;

    /** 开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Integer numF;

    /** 开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Integer numM;

    /** 开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Integer numB;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getBetTime() {
        return betTime;
    }

    public void setBetTime(Date betTime) {
        this.betTime = betTime;
    }

    public Date getPreTime() {
        return preTime;
    }

    public void setPreTime(Date preTime) {
        this.preTime = preTime;
    }

    public Date getTheTime() {
        return theTime;
    }

    public void setTheTime(Date theTime) {
        this.theTime = theTime;
    }

    public Float getCountMoney() {
        return countMoney;
    }

    public void setCountMoney(Float countMoney) {
        this.countMoney = countMoney;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Integer getNum1() {
        return num1;
    }

    public void setNum1(Integer num1) {
        this.num1 = num1;
    }

    public Integer getNum2() {
        return num2;
    }

    public void setNum2(Integer num2) {
        this.num2 = num2;
    }

    public Integer getNum3() {
        return num3;
    }

    public void setNum3(Integer num3) {
        this.num3 = num3;
    }

    public Integer getNum4() {
        return num4;
    }

    public void setNum4(Integer num4) {
        this.num4 = num4;
    }

    public Integer getNum5() {
        return num5;
    }

    public void setNum5(Integer num5) {
        this.num5 = num5;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Integer getNum1Bs() {
        return num1Bs;
    }

    public void setNum1Bs(Integer num1Bs) {
        this.num1Bs = num1Bs;
    }

    public Integer getNum1Sd() {
        return num1Sd;
    }

    public void setNum1Sd(Integer num1Sd) {
        this.num1Sd = num1Sd;
    }

    public Integer getNum2Bs() {
        return num2Bs;
    }

    public void setNum2Bs(Integer num2Bs) {
        this.num2Bs = num2Bs;
    }

    public Integer getNum2Sd() {
        return num2Sd;
    }

    public void setNum2Sd(Integer num2Sd) {
        this.num2Sd = num2Sd;
    }

    public Integer getNum3Bs() {
        return num3Bs;
    }

    public void setNum3Bs(Integer num3Bs) {
        this.num3Bs = num3Bs;
    }

    public Integer getNum3Sd() {
        return num3Sd;
    }

    public void setNum3Sd(Integer num3Sd) {
        this.num3Sd = num3Sd;
    }

    public Integer getNum4Bs() {
        return num4Bs;
    }

    public void setNum4Bs(Integer num4Bs) {
        this.num4Bs = num4Bs;
    }

    public Integer getNum4Sd() {
        return num4Sd;
    }

    public void setNum4Sd(Integer num4Sd) {
        this.num4Sd = num4Sd;
    }

    public Integer getNum5Bs() {
        return num5Bs;
    }

    public void setNum5Bs(Integer num5Bs) {
        this.num5Bs = num5Bs;
    }

    public Integer getNum5Sd() {
        return num5Sd;
    }

    public void setNum5Sd(Integer num5Sd) {
        this.num5Sd = num5Sd;
    }

    public Integer getSumBs() {
        return sumBs;
    }

    public void setSumBs(Integer sumBs) {
        this.sumBs = sumBs;
    }

    public Integer getSumSd() {
        return sumSd;
    }

    public void setSumSd(Integer sumSd) {
        this.sumSd = sumSd;
    }

    public Integer getSumLts() {
        return sumLts;
    }

    public void setSumLts(Integer sumLts) {
        this.sumLts = sumLts;
    }

    public Integer getNumF() {
        return numF;
    }

    public void setNumF(Integer numF) {
        this.numF = numF;
    }

    public Integer getNumM() {
        return numM;
    }

    public void setNumM(Integer numM) {
        this.numM = numM;
    }

    public Integer getNumB() {
        return numB;
    }

    public void setNumB(Integer numB) {
        this.numB = numB;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("periods", getPeriods())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("status", getStatus())
            .append("betTime", getBetTime())
            .append("preTime", getPreTime())
            .append("theTime", getTheTime())
            .append("countMoney", getCountMoney())
            .append("winMoney", getWinMoney())
            .append("num1", getNum1())
            .append("num2", getNum2())
            .append("num3", getNum3())
            .append("num4", getNum4())
            .append("num5", getNum5())
            .append("sum", getSum())
            .append("num1Bs", getNum1Bs())
            .append("num1Sd", getNum1Sd())
            .append("num2Bs", getNum2Bs())
            .append("num2Sd", getNum2Sd())
            .append("num3Bs", getNum3Bs())
            .append("num3Sd", getNum3Sd())
            .append("num4Bs", getNum4Bs())
            .append("num4Sd", getNum4Sd())
            .append("num5Bs", getNum5Bs())
            .append("num5Sd", getNum5Sd())
            .append("sumBs", getSumBs())
            .append("sumSd", getSumSd())
            .append("sumLts", getSumLts())
            .append("numF", getNumF())
            .append("numM", getNumM())
            .append("numB", getNumB())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
