package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 澳洲幸运10开奖对象 azxy10kj
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Azxy10kj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数 */
    private Long id;

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

    /** 开奖号码7 */
    @Excel(name = "开奖号码7")
    private Long num7;

    /** 开奖号码8 */
    @Excel(name = "开奖号码8")
    private Long num8;

    /** 开奖号码9 */
    @Excel(name = "开奖号码9")
    private Long num9;

    /** 开奖号码10 */
    @Excel(name = "开奖号码10")
    private Long num10;

    /** 封盘投注截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "封盘投注截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    /** 预计开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 是否已经开奖（0已经开奖 1未开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=已经开奖,1=未开奖")
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
    public void setNum6(Long num6) 
    {
        this.num6 = num6;
    }

    public Long getNum6() 
    {
        return num6;
    }
    public void setNum7(Long num7) 
    {
        this.num7 = num7;
    }

    public Long getNum7() 
    {
        return num7;
    }
    public void setNum8(Long num8) 
    {
        this.num8 = num8;
    }

    public Long getNum8() 
    {
        return num8;
    }
    public void setNum9(Long num9) 
    {
        this.num9 = num9;
    }

    public Long getNum9() 
    {
        return num9;
    }
    public void setNum10(Long num10) 
    {
        this.num10 = num10;
    }

    public Long getNum10() 
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
