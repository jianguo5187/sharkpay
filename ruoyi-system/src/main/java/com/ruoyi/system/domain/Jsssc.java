package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 极速时时彩开奖历史对象 jsssc
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jsssc extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数 */
    private Long id;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date time;

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

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTime(Date time) 
    {
        this.time = time;
    }

    public Date getTime() 
    {
        return time;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("time", getTime())
            .append("num1", getNum1())
            .append("num2", getNum2())
            .append("num3", getNum3())
            .append("num4", getNum4())
            .append("num5", getNum5())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
