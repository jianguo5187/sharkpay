package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 加拿大开奖对象 jnd28
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jnd28 extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数 */
    private Long id;

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

    /** 是否已经开奖（0已经开奖 1未开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=已经开奖,1=未开奖")
    private String status;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
    public void setSumNum(Integer sumNum)
    {
        this.sumNum = sumNum;
    }

    public Integer getSumNum()
    {
        return sumNum;
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
