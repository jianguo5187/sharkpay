package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 加拿大开奖历史对象 jnd
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jnd extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数 */
    private Long id;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date time;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num1;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num2;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num3;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num4;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num5;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num6;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num7;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num8;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num9;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num10;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num11;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num12;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num13;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num14;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num15;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num16;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num17;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num18;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num19;

    /** 无效字段 */
    @Excel(name = "无效字段")
    private Long num20;

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Integer sum1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer sum2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer sum3;

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
    public void setNum11(Long num11) 
    {
        this.num11 = num11;
    }

    public Long getNum11() 
    {
        return num11;
    }
    public void setNum12(Long num12) 
    {
        this.num12 = num12;
    }

    public Long getNum12() 
    {
        return num12;
    }
    public void setNum13(Long num13) 
    {
        this.num13 = num13;
    }

    public Long getNum13() 
    {
        return num13;
    }
    public void setNum14(Long num14) 
    {
        this.num14 = num14;
    }

    public Long getNum14() 
    {
        return num14;
    }
    public void setNum15(Long num15) 
    {
        this.num15 = num15;
    }

    public Long getNum15() 
    {
        return num15;
    }
    public void setNum16(Long num16) 
    {
        this.num16 = num16;
    }

    public Long getNum16() 
    {
        return num16;
    }
    public void setNum17(Long num17) 
    {
        this.num17 = num17;
    }

    public Long getNum17() 
    {
        return num17;
    }
    public void setNum18(Long num18) 
    {
        this.num18 = num18;
    }

    public Long getNum18() 
    {
        return num18;
    }
    public void setNum19(Long num19) 
    {
        this.num19 = num19;
    }

    public Long getNum19() 
    {
        return num19;
    }
    public void setNum20(Long num20) 
    {
        this.num20 = num20;
    }

    public Long getNum20() 
    {
        return num20;
    }
    public void setSum1(Integer sum1)
    {
        this.sum1 = sum1;
    }

    public Integer getSum1()
    {
        return sum1;
    }
    public void setSum2(Integer sum2)
    {
        this.sum2 = sum2;
    }

    public Integer getSum2()
    {
        return sum2;
    }
    public void setSum3(Integer sum3)
    {
        this.sum3 = sum3;
    }

    public Integer getSum3()
    {
        return sum3;
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
            .append("num6", getNum6())
            .append("num7", getNum7())
            .append("num8", getNum8())
            .append("num9", getNum9())
            .append("num10", getNum10())
            .append("num11", getNum11())
            .append("num12", getNum12())
            .append("num13", getNum13())
            .append("num14", getNum14())
            .append("num15", getNum15())
            .append("num16", getNum16())
            .append("num17", getNum17())
            .append("num18", getNum18())
            .append("num19", getNum19())
            .append("num20", getNum20())
            .append("sum1", getSum1())
            .append("sum2", getSum2())
            .append("sum3", getSum3())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}