package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动物运动会开奖对象 game_zfb_kj
 * 
 * @author ruoyi
 * @date 2025-01-07
 */
public class GameZfbKj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 动物运动会开奖表ID */
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
    private Long num1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Long num2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Long num3;

    /** 开奖号码4 */
    @Excel(name = "开奖号码4")
    private Long num4;

    /** 开奖号码5 */
    @Excel(name = "开奖号码5")
    private Long num5;

    /** 开奖号码6 */
    @Excel(name = "开奖号码6")
    private Long num6;

    /** 封盘投注截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "封盘投注截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    /** 预计开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 是否已经开奖（0未开奖 1已开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=未开奖,1=已开奖")
    private String status;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date theTime;

    /** 总下注金额 */
    @Excel(name = "总下注金额")
    private Long countMoney;

    /** 总中奖金额 */
    @Excel(name = "总中奖金额")
    private Long winMoney;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPeriods(Long periods) 
    {
        this.periods = periods;
    }

    public Long getPeriods() 
    {
        return periods;
    }
    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }
    public void setGameName(String gameName) 
    {
        this.gameName = gameName;
    }

    public String getGameName() 
    {
        return gameName;
    }
    public void setNum1(Long num1) 
    {
        this.num1 = num1;
    }

    public Long getNum1() 
    {
        return num1;
    }
    public void setNum2(Long num2) 
    {
        this.num2 = num2;
    }

    public Long getNum2() 
    {
        return num2;
    }
    public void setNum3(Long num3) 
    {
        this.num3 = num3;
    }

    public Long getNum3() 
    {
        return num3;
    }
    public void setNum4(Long num4) 
    {
        this.num4 = num4;
    }

    public Long getNum4() 
    {
        return num4;
    }
    public void setNum5(Long num5) 
    {
        this.num5 = num5;
    }

    public Long getNum5() 
    {
        return num5;
    }

    public Long getNum6() {
        return num6;
    }

    public void setNum6(Long num6) {
        this.num6 = num6;
    }

    public void setBetTime(Date betTime)
    {
        this.betTime = betTime;
    }

    public Date getBetTime() 
    {
        return betTime;
    }
    public void setPreTime(Date preTime) 
    {
        this.preTime = preTime;
    }

    public Date getPreTime() 
    {
        return preTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setTheTime(Date theTime) 
    {
        this.theTime = theTime;
    }

    public Date getTheTime() 
    {
        return theTime;
    }
    public void setCountMoney(Long countMoney) 
    {
        this.countMoney = countMoney;
    }

    public Long getCountMoney() 
    {
        return countMoney;
    }
    public void setWinMoney(Long winMoney) 
    {
        this.winMoney = winMoney;
    }

    public Long getWinMoney() 
    {
        return winMoney;
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
            .append("num4", getNum4())
            .append("num5", getNum5())
            .append("num6", getNum6())
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
