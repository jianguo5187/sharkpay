package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 极速时时彩下注对象 jssscrecord
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jssscrecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 下注表ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 期数 */
    @Excel(name = "期数")
    private Long periods;

    /** 投注状态（0投注 1撤单） */
    @Excel(name = "投注状态", readConverterExp = "0=投注,1=撤单")
    private String status;

    /** 投注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "投注时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordTime;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date checkTime;

    /** 下注金额 */
    @Excel(name = "下注金额")
    private Long countMoney;

    /** 中奖金额 */
    @Excel(name = "中奖金额")
    private BigDecimal winMoney;

    /** 下注和值大的金额 */
    @Excel(name = "下注和值大的金额")
    private Long sumBig;

    /** 下注和值小的金额 */
    @Excel(name = "下注和值小的金额")
    private Long sumSmall;

    /** 下注和值单的金额 */
    @Excel(name = "下注和值单的金额")
    private Long sumSingle;

    /** 下注和值双的金额 */
    @Excel(name = "下注和值双的金额")
    private Long sumDouble;

    /** 下注和值龙的金额 */
    @Excel(name = "下注和值龙的金额")
    private Long sumLoong;

    /** 下注和值虎的金额 */
    @Excel(name = "下注和值虎的金额")
    private Long sumTiger;

    /** 下注和值和的金额 */
    @Excel(name = "下注和值和的金额")
    private Long sumSum;

    /** 下注买1号球大的金额 */
    @Excel(name = "下注买1号球大的金额")
    private Long num1Big;

    /** 下注买1号球小的金额 */
    @Excel(name = "下注买1号球小的金额")
    private Long num1Small;

    /** 下注买1号球单的金额 */
    @Excel(name = "下注买1号球单的金额")
    private Long num1Single;

    /** 下注买1号球双的金额 */
    @Excel(name = "下注买1号球双的金额")
    private Long num1Double;

    /** 下注买1号球0的金额 */
    @Excel(name = "下注买1号球0的金额")
    private Long num10;

    /** 下注买1号球1的金额 */
    @Excel(name = "下注买1号球1的金额")
    private Long num11;

    /** 下注买1号球2的金额 */
    @Excel(name = "下注买1号球2的金额")
    private Long num12;

    /** 下注买1号球3的金额 */
    @Excel(name = "下注买1号球3的金额")
    private Long num13;

    /** 下注买1号球4的金额 */
    @Excel(name = "下注买1号球4的金额")
    private Long num14;

    /** 下注买1号球5的金额 */
    @Excel(name = "下注买1号球5的金额")
    private Long num15;

    /** 下注买1号球6的金额 */
    @Excel(name = "下注买1号球6的金额")
    private Long num16;

    /** 下注买1号球7的金额 */
    @Excel(name = "下注买1号球7的金额")
    private Long num17;

    /** 下注买1号球8的金额 */
    @Excel(name = "下注买1号球8的金额")
    private Long num18;

    /** 下注买1号球9的金额 */
    @Excel(name = "下注买1号球9的金额")
    private Long num19;

    /** 下注买2号球大的金额 */
    @Excel(name = "下注买2号球大的金额")
    private Long num2Big;

    /** 下注买2号球小的金额 */
    @Excel(name = "下注买2号球小的金额")
    private Long num2Small;

    /** 下注买2号球单的金额 */
    @Excel(name = "下注买2号球单的金额")
    private Long num2Single;

    /** 下注买2号球双的金额 */
    @Excel(name = "下注买2号球双的金额")
    private Long num2Double;

    /** 下注买2号球0的金额 */
    @Excel(name = "下注买2号球0的金额")
    private Long num20;

    /** 下注买2号球1的金额 */
    @Excel(name = "下注买2号球1的金额")
    private Long num21;

    /** 下注买2号球2的金额 */
    @Excel(name = "下注买2号球2的金额")
    private Long num22;

    /** 下注买2号球3的金额 */
    @Excel(name = "下注买2号球3的金额")
    private Long num23;

    /** 下注买2号球4的金额 */
    @Excel(name = "下注买2号球4的金额")
    private Long num24;

    /** 下注买2号球5的金额 */
    @Excel(name = "下注买2号球5的金额")
    private Long num25;

    /** 下注买2号球6的金额 */
    @Excel(name = "下注买2号球6的金额")
    private Long num26;

    /** 下注买2号球7的金额 */
    @Excel(name = "下注买2号球7的金额")
    private Long num27;

    /** 下注买2号球8的金额 */
    @Excel(name = "下注买2号球8的金额")
    private Long num28;

    /** 下注买2号球9的金额 */
    @Excel(name = "下注买2号球9的金额")
    private Long num29;

    /** 下注买3号球大的金额 */
    @Excel(name = "下注买3号球大的金额")
    private Long num3Big;

    /** 下注买3号球小的金额 */
    @Excel(name = "下注买3号球小的金额")
    private Long num3Small;

    /** 下注买3号球单的金额 */
    @Excel(name = "下注买3号球单的金额")
    private Long num3Single;

    /** 下注买3号球双的金额 */
    @Excel(name = "下注买3号球双的金额")
    private Long num3Double;

    /** 下注买3号球0的金额 */
    @Excel(name = "下注买3号球0的金额")
    private Long num30;

    /** 下注买3号球1的金额 */
    @Excel(name = "下注买3号球1的金额")
    private Long num31;

    /** 下注买3号球2的金额 */
    @Excel(name = "下注买3号球2的金额")
    private Long num32;

    /** 下注买3号球3的金额 */
    @Excel(name = "下注买3号球3的金额")
    private Long num33;

    /** 下注买3号球4的金额 */
    @Excel(name = "下注买3号球4的金额")
    private Long num34;

    /** 下注买3号球5的金额 */
    @Excel(name = "下注买3号球5的金额")
    private Long num35;

    /** 下注买3号球6的金额 */
    @Excel(name = "下注买3号球6的金额")
    private Long num36;

    /** 下注买3号球7的金额 */
    @Excel(name = "下注买3号球7的金额")
    private Long num37;

    /** 下注买3号球8的金额 */
    @Excel(name = "下注买3号球8的金额")
    private Long num38;

    /** 下注买3号球9的金额 */
    @Excel(name = "下注买3号球9的金额")
    private Long num39;

    /** 下注买4号球大的金额 */
    @Excel(name = "下注买4号球大的金额")
    private Long num4Big;

    /** 下注买4号球小的金额 */
    @Excel(name = "下注买4号球小的金额")
    private Long num4Small;

    /** 下注买4号球单的金额 */
    @Excel(name = "下注买4号球单的金额")
    private Long num4Single;

    /** 下注买4号球双的金额 */
    @Excel(name = "下注买4号球双的金额")
    private Long num4Double;

    /** 下注买4号球0的金额 */
    @Excel(name = "下注买4号球0的金额")
    private Long num40;

    /** 下注买4号球1的金额 */
    @Excel(name = "下注买4号球1的金额")
    private Long num41;

    /** 下注买4号球2的金额 */
    @Excel(name = "下注买4号球2的金额")
    private Long num42;

    /** 下注买4号球3的金额 */
    @Excel(name = "下注买4号球3的金额")
    private Long num43;

    /** 下注买4号球4的金额 */
    @Excel(name = "下注买4号球4的金额")
    private Long num44;

    /** 下注买4号球5的金额 */
    @Excel(name = "下注买4号球5的金额")
    private Long num45;

    /** 下注买4号球6的金额 */
    @Excel(name = "下注买4号球6的金额")
    private Long num46;

    /** 下注买4号球7的金额 */
    @Excel(name = "下注买4号球7的金额")
    private Long num47;

    /** 下注买4号球8的金额 */
    @Excel(name = "下注买4号球8的金额")
    private Long num48;

    /** 下注买4号球9的金额 */
    @Excel(name = "下注买4号球9的金额")
    private Long num49;

    /** 下注买5号球大的金额 */
    @Excel(name = "下注买5号球大的金额")
    private Long num5Big;

    /** 下注买5号球小的金额 */
    @Excel(name = "下注买5号球小的金额")
    private Long num5Small;

    /** 下注买5号球单的金额 */
    @Excel(name = "下注买5号球单的金额")
    private Long num5Single;

    /** 下注买5号球双的金额 */
    @Excel(name = "下注买5号球双的金额")
    private Long num5Double;

    /** 下注买5号球0的金额 */
    @Excel(name = "下注买5号球0的金额")
    private Long num50;

    /** 下注买5号球1的金额 */
    @Excel(name = "下注买5号球1的金额")
    private Long num51;

    /** 下注买5号球2的金额 */
    @Excel(name = "下注买5号球2的金额")
    private Long num52;

    /** 下注买5号球3的金额 */
    @Excel(name = "下注买5号球3的金额")
    private Long num53;

    /** 下注买5号球4的金额 */
    @Excel(name = "下注买5号球4的金额")
    private Long num54;

    /** 下注买5号球5的金额 */
    @Excel(name = "下注买5号球5的金额")
    private Long num55;

    /** 下注买5号球6的金额 */
    @Excel(name = "下注买5号球6的金额")
    private Long num56;

    /** 下注买5号球7的金额 */
    @Excel(name = "下注买5号球7的金额")
    private Long num57;

    /** 下注买5号球8的金额 */
    @Excel(name = "下注买5号球8的金额")
    private Long num58;

    /** 下注买5号球9的金额 */
    @Excel(name = "下注买5号球9的金额")
    private Long num59;

    /** 下注买前三豹的金额 */
    @Excel(name = "下注买前三豹的金额")
    private Long firstBao;

    /** 下注买前三对的金额 */
    @Excel(name = "下注买前三对的金额")
    private Long firstDui;

    /** 下注买前三顺的金额 */
    @Excel(name = "下注买前三顺的金额")
    private Long firstSun;

    /** 下注买前三半的金额 */
    @Excel(name = "下注买前三半的金额")
    private Long firstBan;

    /** 下注买前三杂的金额 */
    @Excel(name = "下注买前三杂的金额")
    private Long firstZa;

    /** 下注买中三豹的的金额 */
    @Excel(name = "下注买中三豹的的金额")
    private Long midBao;

    /** 下注买中三对的的金额 */
    @Excel(name = "下注买中三对的的金额")
    private Long midDui;

    /** 下注买中三顺的的金额 */
    @Excel(name = "下注买中三顺的的金额")
    private Long midSun;

    /** 下注买中三半的的金额 */
    @Excel(name = "下注买中三半的的金额")
    private Long midBan;

    /** 下注买中三杂的的金额 */
    @Excel(name = "下注买中三杂的的金额")
    private Long midZa;

    /** 下注买后三豹的的金额 */
    @Excel(name = "下注买后三豹的的金额")
    private Long backBao;

    /** 下注买后三对的的金额 */
    @Excel(name = "下注买后三对的的金额")
    private Long backDui;

    /** 下注买后三顺的的金额 */
    @Excel(name = "下注买后三顺的的金额")
    private Long backSun;

    /** 下注买后三半的的金额 */
    @Excel(name = "下注买后三半的的金额")
    private Long backBan;

    /** 下注买后三杂的的金额 */
    @Excel(name = "下注买后三杂的的金额")
    private Long backZa;

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

    /** 开奖合算数字 */
    @Excel(name = "开奖合算数字")
    private Long sum;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer isDelete;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer house;

    /** 是否合庄模式 */
    @Excel(name = "是否合庄模式")
    private Integer hzId;

    /** 是否用户 */
    @Excel(name = "是否用户")
    private Long hzUser;

    /** 是否扣除 */
    @Excel(name = "是否扣除")
    private Integer isDeduct;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setPeriods(Long periods) 
    {
        this.periods = periods;
    }

    public Long getPeriods() 
    {
        return periods;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setRecordTime(Date recordTime) 
    {
        this.recordTime = recordTime;
    }

    public Date getRecordTime() 
    {
        return recordTime;
    }
    public void setCheckTime(Date checkTime) 
    {
        this.checkTime = checkTime;
    }

    public Date getCheckTime() 
    {
        return checkTime;
    }
    public void setCountMoney(Long countMoney) 
    {
        this.countMoney = countMoney;
    }

    public Long getCountMoney() 
    {
        return countMoney;
    }
    public void setWinMoney(BigDecimal winMoney) 
    {
        this.winMoney = winMoney;
    }

    public BigDecimal getWinMoney() 
    {
        return winMoney;
    }
    public void setSumBig(Long sumBig) 
    {
        this.sumBig = sumBig;
    }

    public Long getSumBig() 
    {
        return sumBig;
    }
    public void setSumSmall(Long sumSmall) 
    {
        this.sumSmall = sumSmall;
    }

    public Long getSumSmall() 
    {
        return sumSmall;
    }
    public void setSumSingle(Long sumSingle) 
    {
        this.sumSingle = sumSingle;
    }

    public Long getSumSingle() 
    {
        return sumSingle;
    }
    public void setSumDouble(Long sumDouble) 
    {
        this.sumDouble = sumDouble;
    }

    public Long getSumDouble() 
    {
        return sumDouble;
    }
    public void setSumLoong(Long sumLoong) 
    {
        this.sumLoong = sumLoong;
    }

    public Long getSumLoong() 
    {
        return sumLoong;
    }
    public void setSumTiger(Long sumTiger) 
    {
        this.sumTiger = sumTiger;
    }

    public Long getSumTiger() 
    {
        return sumTiger;
    }
    public void setSumSum(Long sumSum) 
    {
        this.sumSum = sumSum;
    }

    public Long getSumSum() 
    {
        return sumSum;
    }
    public void setNum1Big(Long num1Big) 
    {
        this.num1Big = num1Big;
    }

    public Long getNum1Big() 
    {
        return num1Big;
    }
    public void setNum1Small(Long num1Small) 
    {
        this.num1Small = num1Small;
    }

    public Long getNum1Small() 
    {
        return num1Small;
    }
    public void setNum1Single(Long num1Single) 
    {
        this.num1Single = num1Single;
    }

    public Long getNum1Single() 
    {
        return num1Single;
    }
    public void setNum1Double(Long num1Double) 
    {
        this.num1Double = num1Double;
    }

    public Long getNum1Double() 
    {
        return num1Double;
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
    public void setNum2Big(Long num2Big) 
    {
        this.num2Big = num2Big;
    }

    public Long getNum2Big() 
    {
        return num2Big;
    }
    public void setNum2Small(Long num2Small) 
    {
        this.num2Small = num2Small;
    }

    public Long getNum2Small() 
    {
        return num2Small;
    }
    public void setNum2Single(Long num2Single) 
    {
        this.num2Single = num2Single;
    }

    public Long getNum2Single() 
    {
        return num2Single;
    }
    public void setNum2Double(Long num2Double) 
    {
        this.num2Double = num2Double;
    }

    public Long getNum2Double() 
    {
        return num2Double;
    }
    public void setNum20(Long num20) 
    {
        this.num20 = num20;
    }

    public Long getNum20() 
    {
        return num20;
    }
    public void setNum21(Long num21) 
    {
        this.num21 = num21;
    }

    public Long getNum21() 
    {
        return num21;
    }
    public void setNum22(Long num22) 
    {
        this.num22 = num22;
    }

    public Long getNum22() 
    {
        return num22;
    }
    public void setNum23(Long num23) 
    {
        this.num23 = num23;
    }

    public Long getNum23() 
    {
        return num23;
    }
    public void setNum24(Long num24) 
    {
        this.num24 = num24;
    }

    public Long getNum24() 
    {
        return num24;
    }
    public void setNum25(Long num25) 
    {
        this.num25 = num25;
    }

    public Long getNum25() 
    {
        return num25;
    }
    public void setNum26(Long num26) 
    {
        this.num26 = num26;
    }

    public Long getNum26() 
    {
        return num26;
    }
    public void setNum27(Long num27) 
    {
        this.num27 = num27;
    }

    public Long getNum27() 
    {
        return num27;
    }
    public void setNum28(Long num28) 
    {
        this.num28 = num28;
    }

    public Long getNum28() 
    {
        return num28;
    }
    public void setNum29(Long num29) 
    {
        this.num29 = num29;
    }

    public Long getNum29() 
    {
        return num29;
    }
    public void setNum3Big(Long num3Big) 
    {
        this.num3Big = num3Big;
    }

    public Long getNum3Big() 
    {
        return num3Big;
    }
    public void setNum3Small(Long num3Small) 
    {
        this.num3Small = num3Small;
    }

    public Long getNum3Small() 
    {
        return num3Small;
    }
    public void setNum3Single(Long num3Single) 
    {
        this.num3Single = num3Single;
    }

    public Long getNum3Single() 
    {
        return num3Single;
    }
    public void setNum3Double(Long num3Double) 
    {
        this.num3Double = num3Double;
    }

    public Long getNum3Double() 
    {
        return num3Double;
    }
    public void setNum30(Long num30) 
    {
        this.num30 = num30;
    }

    public Long getNum30() 
    {
        return num30;
    }
    public void setNum31(Long num31) 
    {
        this.num31 = num31;
    }

    public Long getNum31() 
    {
        return num31;
    }
    public void setNum32(Long num32) 
    {
        this.num32 = num32;
    }

    public Long getNum32() 
    {
        return num32;
    }
    public void setNum33(Long num33) 
    {
        this.num33 = num33;
    }

    public Long getNum33() 
    {
        return num33;
    }
    public void setNum34(Long num34) 
    {
        this.num34 = num34;
    }

    public Long getNum34() 
    {
        return num34;
    }
    public void setNum35(Long num35) 
    {
        this.num35 = num35;
    }

    public Long getNum35() 
    {
        return num35;
    }
    public void setNum36(Long num36) 
    {
        this.num36 = num36;
    }

    public Long getNum36() 
    {
        return num36;
    }
    public void setNum37(Long num37) 
    {
        this.num37 = num37;
    }

    public Long getNum37() 
    {
        return num37;
    }
    public void setNum38(Long num38) 
    {
        this.num38 = num38;
    }

    public Long getNum38() 
    {
        return num38;
    }
    public void setNum39(Long num39) 
    {
        this.num39 = num39;
    }

    public Long getNum39() 
    {
        return num39;
    }
    public void setNum4Big(Long num4Big) 
    {
        this.num4Big = num4Big;
    }

    public Long getNum4Big() 
    {
        return num4Big;
    }
    public void setNum4Small(Long num4Small) 
    {
        this.num4Small = num4Small;
    }

    public Long getNum4Small() 
    {
        return num4Small;
    }
    public void setNum4Single(Long num4Single) 
    {
        this.num4Single = num4Single;
    }

    public Long getNum4Single() 
    {
        return num4Single;
    }
    public void setNum4Double(Long num4Double) 
    {
        this.num4Double = num4Double;
    }

    public Long getNum4Double() 
    {
        return num4Double;
    }
    public void setNum40(Long num40) 
    {
        this.num40 = num40;
    }

    public Long getNum40() 
    {
        return num40;
    }
    public void setNum41(Long num41) 
    {
        this.num41 = num41;
    }

    public Long getNum41() 
    {
        return num41;
    }
    public void setNum42(Long num42) 
    {
        this.num42 = num42;
    }

    public Long getNum42() 
    {
        return num42;
    }
    public void setNum43(Long num43) 
    {
        this.num43 = num43;
    }

    public Long getNum43() 
    {
        return num43;
    }
    public void setNum44(Long num44) 
    {
        this.num44 = num44;
    }

    public Long getNum44() 
    {
        return num44;
    }
    public void setNum45(Long num45) 
    {
        this.num45 = num45;
    }

    public Long getNum45() 
    {
        return num45;
    }
    public void setNum46(Long num46) 
    {
        this.num46 = num46;
    }

    public Long getNum46() 
    {
        return num46;
    }
    public void setNum47(Long num47) 
    {
        this.num47 = num47;
    }

    public Long getNum47() 
    {
        return num47;
    }
    public void setNum48(Long num48) 
    {
        this.num48 = num48;
    }

    public Long getNum48() 
    {
        return num48;
    }
    public void setNum49(Long num49) 
    {
        this.num49 = num49;
    }

    public Long getNum49() 
    {
        return num49;
    }
    public void setNum5Big(Long num5Big) 
    {
        this.num5Big = num5Big;
    }

    public Long getNum5Big() 
    {
        return num5Big;
    }
    public void setNum5Small(Long num5Small) 
    {
        this.num5Small = num5Small;
    }

    public Long getNum5Small() 
    {
        return num5Small;
    }
    public void setNum5Single(Long num5Single) 
    {
        this.num5Single = num5Single;
    }

    public Long getNum5Single() 
    {
        return num5Single;
    }
    public void setNum5Double(Long num5Double) 
    {
        this.num5Double = num5Double;
    }

    public Long getNum5Double() 
    {
        return num5Double;
    }
    public void setNum50(Long num50) 
    {
        this.num50 = num50;
    }

    public Long getNum50() 
    {
        return num50;
    }
    public void setNum51(Long num51) 
    {
        this.num51 = num51;
    }

    public Long getNum51() 
    {
        return num51;
    }
    public void setNum52(Long num52) 
    {
        this.num52 = num52;
    }

    public Long getNum52() 
    {
        return num52;
    }
    public void setNum53(Long num53) 
    {
        this.num53 = num53;
    }

    public Long getNum53() 
    {
        return num53;
    }
    public void setNum54(Long num54) 
    {
        this.num54 = num54;
    }

    public Long getNum54() 
    {
        return num54;
    }
    public void setNum55(Long num55) 
    {
        this.num55 = num55;
    }

    public Long getNum55() 
    {
        return num55;
    }
    public void setNum56(Long num56) 
    {
        this.num56 = num56;
    }

    public Long getNum56() 
    {
        return num56;
    }
    public void setNum57(Long num57) 
    {
        this.num57 = num57;
    }

    public Long getNum57() 
    {
        return num57;
    }
    public void setNum58(Long num58) 
    {
        this.num58 = num58;
    }

    public Long getNum58() 
    {
        return num58;
    }
    public void setNum59(Long num59) 
    {
        this.num59 = num59;
    }

    public Long getNum59() 
    {
        return num59;
    }
    public void setFirstBao(Long firstBao) 
    {
        this.firstBao = firstBao;
    }

    public Long getFirstBao() 
    {
        return firstBao;
    }
    public void setFirstDui(Long firstDui) 
    {
        this.firstDui = firstDui;
    }

    public Long getFirstDui() 
    {
        return firstDui;
    }
    public void setFirstSun(Long firstSun) 
    {
        this.firstSun = firstSun;
    }

    public Long getFirstSun() 
    {
        return firstSun;
    }
    public void setFirstBan(Long firstBan) 
    {
        this.firstBan = firstBan;
    }

    public Long getFirstBan() 
    {
        return firstBan;
    }
    public void setFirstZa(Long firstZa) 
    {
        this.firstZa = firstZa;
    }

    public Long getFirstZa() 
    {
        return firstZa;
    }
    public void setMidBao(Long midBao) 
    {
        this.midBao = midBao;
    }

    public Long getMidBao() 
    {
        return midBao;
    }
    public void setMidDui(Long midDui) 
    {
        this.midDui = midDui;
    }

    public Long getMidDui() 
    {
        return midDui;
    }
    public void setMidSun(Long midSun) 
    {
        this.midSun = midSun;
    }

    public Long getMidSun() 
    {
        return midSun;
    }
    public void setMidBan(Long midBan) 
    {
        this.midBan = midBan;
    }

    public Long getMidBan() 
    {
        return midBan;
    }
    public void setMidZa(Long midZa) 
    {
        this.midZa = midZa;
    }

    public Long getMidZa() 
    {
        return midZa;
    }
    public void setBackBao(Long backBao) 
    {
        this.backBao = backBao;
    }

    public Long getBackBao() 
    {
        return backBao;
    }
    public void setBackDui(Long backDui) 
    {
        this.backDui = backDui;
    }

    public Long getBackDui() 
    {
        return backDui;
    }
    public void setBackSun(Long backSun) 
    {
        this.backSun = backSun;
    }

    public Long getBackSun() 
    {
        return backSun;
    }
    public void setBackBan(Long backBan) 
    {
        this.backBan = backBan;
    }

    public Long getBackBan() 
    {
        return backBan;
    }
    public void setBackZa(Long backZa) 
    {
        this.backZa = backZa;
    }

    public Long getBackZa() 
    {
        return backZa;
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
    public void setIsDelete(Integer isDelete) 
    {
        this.isDelete = isDelete;
    }

    public Integer getIsDelete() 
    {
        return isDelete;
    }
    public void setHouse(Integer house) 
    {
        this.house = house;
    }

    public Integer getHouse() 
    {
        return house;
    }
    public void setHzId(Integer hzId) 
    {
        this.hzId = hzId;
    }

    public Integer getHzId() 
    {
        return hzId;
    }
    public void setHzUser(Long hzUser) 
    {
        this.hzUser = hzUser;
    }

    public Long getHzUser() 
    {
        return hzUser;
    }
    public void setIsDeduct(Integer isDeduct) 
    {
        this.isDeduct = isDeduct;
    }

    public Integer getIsDeduct() 
    {
        return isDeduct;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("periods", getPeriods())
            .append("status", getStatus())
            .append("recordTime", getRecordTime())
            .append("checkTime", getCheckTime())
            .append("countMoney", getCountMoney())
            .append("winMoney", getWinMoney())
            .append("sumBig", getSumBig())
            .append("sumSmall", getSumSmall())
            .append("sumSingle", getSumSingle())
            .append("sumDouble", getSumDouble())
            .append("sumLoong", getSumLoong())
            .append("sumTiger", getSumTiger())
            .append("sumSum", getSumSum())
            .append("num1Big", getNum1Big())
            .append("num1Small", getNum1Small())
            .append("num1Single", getNum1Single())
            .append("num1Double", getNum1Double())
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
            .append("num2Big", getNum2Big())
            .append("num2Small", getNum2Small())
            .append("num2Single", getNum2Single())
            .append("num2Double", getNum2Double())
            .append("num20", getNum20())
            .append("num21", getNum21())
            .append("num22", getNum22())
            .append("num23", getNum23())
            .append("num24", getNum24())
            .append("num25", getNum25())
            .append("num26", getNum26())
            .append("num27", getNum27())
            .append("num28", getNum28())
            .append("num29", getNum29())
            .append("num3Big", getNum3Big())
            .append("num3Small", getNum3Small())
            .append("num3Single", getNum3Single())
            .append("num3Double", getNum3Double())
            .append("num30", getNum30())
            .append("num31", getNum31())
            .append("num32", getNum32())
            .append("num33", getNum33())
            .append("num34", getNum34())
            .append("num35", getNum35())
            .append("num36", getNum36())
            .append("num37", getNum37())
            .append("num38", getNum38())
            .append("num39", getNum39())
            .append("num4Big", getNum4Big())
            .append("num4Small", getNum4Small())
            .append("num4Single", getNum4Single())
            .append("num4Double", getNum4Double())
            .append("num40", getNum40())
            .append("num41", getNum41())
            .append("num42", getNum42())
            .append("num43", getNum43())
            .append("num44", getNum44())
            .append("num45", getNum45())
            .append("num46", getNum46())
            .append("num47", getNum47())
            .append("num48", getNum48())
            .append("num49", getNum49())
            .append("num5Big", getNum5Big())
            .append("num5Small", getNum5Small())
            .append("num5Single", getNum5Single())
            .append("num5Double", getNum5Double())
            .append("num50", getNum50())
            .append("num51", getNum51())
            .append("num52", getNum52())
            .append("num53", getNum53())
            .append("num54", getNum54())
            .append("num55", getNum55())
            .append("num56", getNum56())
            .append("num57", getNum57())
            .append("num58", getNum58())
            .append("num59", getNum59())
            .append("firstBao", getFirstBao())
            .append("firstDui", getFirstDui())
            .append("firstSun", getFirstSun())
            .append("firstBan", getFirstBan())
            .append("firstZa", getFirstZa())
            .append("midBao", getMidBao())
            .append("midDui", getMidDui())
            .append("midSun", getMidSun())
            .append("midBan", getMidBan())
            .append("midZa", getMidZa())
            .append("backBao", getBackBao())
            .append("backDui", getBackDui())
            .append("backSun", getBackSun())
            .append("backBan", getBackBan())
            .append("backZa", getBackZa())
            .append("num1", getNum1())
            .append("num2", getNum2())
            .append("num3", getNum3())
            .append("num4", getNum4())
            .append("num5", getNum5())
            .append("sum", getSum())
            .append("isDelete", getIsDelete())
            .append("house", getHouse())
            .append("hzId", getHzId())
            .append("hzUser", getHzUser())
            .append("isDeduct", getIsDeduct())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
