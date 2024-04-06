package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 10球开奖开奖对象 game_tenball_kj
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameTenballKj extends BaseEntity
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

    /** 开奖号码4 */
    @Excel(name = "开奖号码4")
    private Integer num4;

    /** 开奖号码5 */
    @Excel(name = "开奖号码5")
    private Integer num5;

    /** 开奖号码6 */
    @Excel(name = "开奖号码6")
    private Integer num6;

    /** 开奖号码7 */
    @Excel(name = "开奖号码7")
    private Integer num7;

    /** 开奖号码8 */
    @Excel(name = "开奖号码8")
    private Integer num8;

    /** 开奖号码9 */
    @Excel(name = "开奖号码9")
    private Integer num9;

    /** 开奖号码10 */
    @Excel(name = "开奖号码10")
    private Integer num10;

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

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setNum1(Integer num1)
    {
        this.num1 = num1;
    }

    public Integer getNum1()
    {
        return num1;
    }
    public void setNum2(Integer num2)
    {
        this.num2 = num2;
    }

    public Integer getNum2()
    {
        return num2;
    }
    public void setNum3(Integer num3)
    {
        this.num3 = num3;
    }

    public Integer getNum3()
    {
        return num3;
    }
    public void setNum4(Integer num4)
    {
        this.num4 = num4;
    }

    public Integer getNum4()
    {
        return num4;
    }
    public void setNum5(Integer num5)
    {
        this.num5 = num5;
    }

    public Integer getNum5()
    {
        return num5;
    }
    public void setNum6(Integer num6)
    {
        this.num6 = num6;
    }

    public Integer getNum6()
    {
        return num6;
    }
    public void setNum7(Integer num7)
    {
        this.num7 = num7;
    }

    public Integer getNum7()
    {
        return num7;
    }
    public void setNum8(Integer num8)
    {
        this.num8 = num8;
    }

    public Integer getNum8()
    {
        return num8;
    }
    public void setNum9(Integer num9)
    {
        this.num9 = num9;
    }

    public Integer getNum9()
    {
        return num9;
    }
    public void setNum10(Integer num10)
    {
        this.num10 = num10;
    }

    public Integer getNum10()
    {
        return num10;
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
    public void setCountMoney(Float countMoney)
    {
        this.countMoney = countMoney;
    }

    public Float getCountMoney()
    {
        return countMoney;
    }
    public void setWinMoney(Float winMoney)
    {
        this.winMoney = winMoney;
    }

    public Float getWinMoney()
    {
        return winMoney;
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
            .append("num7", getNum7())
            .append("num8", getNum8())
            .append("num9", getNum9())
            .append("num10", getNum10())
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
