package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 极速时时彩开奖对象 jsssckj
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jsssckj extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数 */
    private Long id;

    /** 是否已经开奖（0已经开奖 1未开奖） */
    @Excel(name = "是否已经开奖", readConverterExp = "0=已经开奖,1=未开奖")
    private String status;

    /** 封盘投注截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "封盘投注截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date betTime;

    /** 预计开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

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

    /** 开奖合计号码 */
    @Excel(name = "开奖合计号码")
    private Long sum;

    /** 开奖号码1大小 */
    @Excel(name = "开奖号码1大小")
    private Long num1Bs;

    /** 开奖号码1单双 */
    @Excel(name = "开奖号码1单双")
    private Long num1Sd;

    /** 开奖号码2大小 */
    @Excel(name = "开奖号码2大小")
    private Long num2Bs;

    /** 开奖号码2单双 */
    @Excel(name = "开奖号码2单双")
    private Long num2Sd;

    /** 开奖号码3大小 */
    @Excel(name = "开奖号码3大小")
    private Long num3Bs;

    /** 开奖号码3单双 */
    @Excel(name = "开奖号码3单双")
    private Long num3Sd;

    /** 开奖号码4大小 */
    @Excel(name = "开奖号码4大小")
    private Long num4Bs;

    /** 开奖号码4单双 */
    @Excel(name = "开奖号码4单双")
    private Long num4Sd;

    /** 开奖号码5大小 */
    @Excel(name = "开奖号码5大小")
    private Long num5Bs;

    /** 开奖号码5单双 */
    @Excel(name = "开奖号码5单双")
    private Long num5Sd;

    /** 开奖合计号码大小 */
    @Excel(name = "开奖合计号码大小")
    private Long sumBs;

    /** 开奖合计号码单双 */
    @Excel(name = "开奖合计号码单双")
    private Long sumSd;

    /** 开奖合计号码和虎龙 */
    @Excel(name = "开奖合计号码和虎龙")
    private Long sumLts;

    /** 开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Long numF;

    /** 开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Long numM;

    /** 开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂] */
    @Excel(name = "开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]")
    private Long numB;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
    public void setSum(Long sum) 
    {
        this.sum = sum;
    }

    public Long getSum() 
    {
        return sum;
    }
    public void setNum1Bs(Long num1Bs) 
    {
        this.num1Bs = num1Bs;
    }

    public Long getNum1Bs() 
    {
        return num1Bs;
    }
    public void setNum1Sd(Long num1Sd) 
    {
        this.num1Sd = num1Sd;
    }

    public Long getNum1Sd() 
    {
        return num1Sd;
    }
    public void setNum2Bs(Long num2Bs) 
    {
        this.num2Bs = num2Bs;
    }

    public Long getNum2Bs() 
    {
        return num2Bs;
    }
    public void setNum2Sd(Long num2Sd) 
    {
        this.num2Sd = num2Sd;
    }

    public Long getNum2Sd() 
    {
        return num2Sd;
    }
    public void setNum3Bs(Long num3Bs) 
    {
        this.num3Bs = num3Bs;
    }

    public Long getNum3Bs() 
    {
        return num3Bs;
    }
    public void setNum3Sd(Long num3Sd) 
    {
        this.num3Sd = num3Sd;
    }

    public Long getNum3Sd() 
    {
        return num3Sd;
    }
    public void setNum4Bs(Long num4Bs) 
    {
        this.num4Bs = num4Bs;
    }

    public Long getNum4Bs() 
    {
        return num4Bs;
    }
    public void setNum4Sd(Long num4Sd) 
    {
        this.num4Sd = num4Sd;
    }

    public Long getNum4Sd() 
    {
        return num4Sd;
    }
    public void setNum5Bs(Long num5Bs) 
    {
        this.num5Bs = num5Bs;
    }

    public Long getNum5Bs() 
    {
        return num5Bs;
    }
    public void setNum5Sd(Long num5Sd) 
    {
        this.num5Sd = num5Sd;
    }

    public Long getNum5Sd() 
    {
        return num5Sd;
    }
    public void setSumBs(Long sumBs) 
    {
        this.sumBs = sumBs;
    }

    public Long getSumBs() 
    {
        return sumBs;
    }
    public void setSumSd(Long sumSd) 
    {
        this.sumSd = sumSd;
    }

    public Long getSumSd() 
    {
        return sumSd;
    }
    public void setSumLts(Long sumLts) 
    {
        this.sumLts = sumLts;
    }

    public Long getSumLts() 
    {
        return sumLts;
    }
    public void setNumF(Long numF) 
    {
        this.numF = numF;
    }

    public Long getNumF() 
    {
        return numF;
    }
    public void setNumM(Long numM) 
    {
        this.numM = numM;
    }

    public Long getNumM() 
    {
        return numM;
    }
    public void setNumB(Long numB) 
    {
        this.numB = numB;
    }

    public Long getNumB() 
    {
        return numB;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
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
