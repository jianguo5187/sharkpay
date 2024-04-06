package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 3球开奖对象 game_threeball_kj
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameThreeballKj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 10球开奖开奖表ID */
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

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Integer num1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer num2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer num3;

    /** 开奖合计号码 */
    @Excel(name = "开奖合计号码")
    private Integer sumNum;

    /** 封盘投注截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "封盘投注截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    /** 预计开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预计开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 是否已经开奖（0未开奖 1已开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=已经开奖,1=未开奖")
    private String status;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Integer getSumNum() {
        return sumNum;
    }

    public void setSumNum(Integer sumNum) {
        this.sumNum = sumNum;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("periods", getPeriods())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("num1", getNum1())
            .append("num2", getNum2())
            .append("num3", getNum3())
            .append("sumNum", getSumNum())
            .append("betTime", getBetTime())
            .append("preTime", getPreTime())
            .append("status", getStatus())
            .append("theTime", getTheTime())
            .append("countMoney", getCountMoney())
            .append("winMoney", getWinMoney())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
