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
 * @date 2024-03-23
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

    /** 确认时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkTime;

    /** 下注金额 */
    @Excel(name = "下注金额")
    private BigDecimal countMoney;

    /** 中奖金额 */
    @Excel(name = "中奖金额")
    private BigDecimal winMoney;

    /** 下注和值大的金额 */
    @Excel(name = "下注和值大的金额")
    private BigDecimal sumBig;

    /** 下注和值小的金额 */
    @Excel(name = "下注和值小的金额")
    private BigDecimal sumSmall;

    /** 下注和值单的金额 */
    @Excel(name = "下注和值单的金额")
    private BigDecimal sumSingle;

    /** 下注和值双的金额 */
    @Excel(name = "下注和值双的金额")
    private BigDecimal sumDouble;

    /** 下注和值龙的金额 */
    @Excel(name = "下注和值龙的金额")
    private BigDecimal sumLoong;

    /** 下注和值虎的金额 */
    @Excel(name = "下注和值虎的金额")
    private BigDecimal sumTiger;

    /** 下注和值和的金额 */
    @Excel(name = "下注和值和的金额")
    private BigDecimal sumSum;

    /** 下注买1号球大的金额 */
    @Excel(name = "下注买1号球大的金额")
    private BigDecimal num1Big;

    /** 下注买1号球小的金额 */
    @Excel(name = "下注买1号球小的金额")
    private BigDecimal num1Small;

    /** 下注买1号球单的金额 */
    @Excel(name = "下注买1号球单的金额")
    private BigDecimal num1Single;

    /** 下注买1号球双的金额 */
    @Excel(name = "下注买1号球双的金额")
    private BigDecimal num1Double;

    /** 下注买1号球0的金额 */
    @Excel(name = "下注买1号球0的金额")
    private BigDecimal num10;

    /** 下注买1号球1的金额 */
    @Excel(name = "下注买1号球1的金额")
    private BigDecimal num11;

    /** 下注买1号球2的金额 */
    @Excel(name = "下注买1号球2的金额")
    private BigDecimal num12;

    /** 下注买1号球3的金额 */
    @Excel(name = "下注买1号球3的金额")
    private BigDecimal num13;

    /** 下注买1号球4的金额 */
    @Excel(name = "下注买1号球4的金额")
    private BigDecimal num14;

    /** 下注买1号球5的金额 */
    @Excel(name = "下注买1号球5的金额")
    private BigDecimal num15;

    /** 下注买1号球6的金额 */
    @Excel(name = "下注买1号球6的金额")
    private BigDecimal num16;

    /** 下注买1号球7的金额 */
    @Excel(name = "下注买1号球7的金额")
    private BigDecimal num17;

    /** 下注买1号球8的金额 */
    @Excel(name = "下注买1号球8的金额")
    private BigDecimal num18;

    /** 下注买1号球9的金额 */
    @Excel(name = "下注买1号球9的金额")
    private BigDecimal num19;

    /** 下注买2号球大的金额 */
    @Excel(name = "下注买2号球大的金额")
    private BigDecimal num2Big;

    /** 下注买2号球小的金额 */
    @Excel(name = "下注买2号球小的金额")
    private BigDecimal num2Small;

    /** 下注买2号球单的金额 */
    @Excel(name = "下注买2号球单的金额")
    private BigDecimal num2Single;

    /** 下注买2号球双的金额 */
    @Excel(name = "下注买2号球双的金额")
    private BigDecimal num2Double;

    /** 下注买2号球0的金额 */
    @Excel(name = "下注买2号球0的金额")
    private BigDecimal num20;

    /** 下注买2号球1的金额 */
    @Excel(name = "下注买2号球1的金额")
    private BigDecimal num21;

    /** 下注买2号球2的金额 */
    @Excel(name = "下注买2号球2的金额")
    private BigDecimal num22;

    /** 下注买2号球3的金额 */
    @Excel(name = "下注买2号球3的金额")
    private BigDecimal num23;

    /** 下注买2号球4的金额 */
    @Excel(name = "下注买2号球4的金额")
    private BigDecimal num24;

    /** 下注买2号球5的金额 */
    @Excel(name = "下注买2号球5的金额")
    private BigDecimal num25;

    /** 下注买2号球6的金额 */
    @Excel(name = "下注买2号球6的金额")
    private BigDecimal num26;

    /** 下注买2号球7的金额 */
    @Excel(name = "下注买2号球7的金额")
    private BigDecimal num27;

    /** 下注买2号球8的金额 */
    @Excel(name = "下注买2号球8的金额")
    private BigDecimal num28;

    /** 下注买2号球9的金额 */
    @Excel(name = "下注买2号球9的金额")
    private BigDecimal num29;

    /** 下注买3号球大的金额 */
    @Excel(name = "下注买3号球大的金额")
    private BigDecimal num3Big;

    /** 下注买3号球小的金额 */
    @Excel(name = "下注买3号球小的金额")
    private BigDecimal num3Small;

    /** 下注买3号球单的金额 */
    @Excel(name = "下注买3号球单的金额")
    private BigDecimal num3Single;

    /** 下注买3号球双的金额 */
    @Excel(name = "下注买3号球双的金额")
    private BigDecimal num3Double;

    /** 下注买3号球0的金额 */
    @Excel(name = "下注买3号球0的金额")
    private BigDecimal num30;

    /** 下注买3号球1的金额 */
    @Excel(name = "下注买3号球1的金额")
    private BigDecimal num31;

    /** 下注买3号球2的金额 */
    @Excel(name = "下注买3号球2的金额")
    private BigDecimal num32;

    /** 下注买3号球3的金额 */
    @Excel(name = "下注买3号球3的金额")
    private BigDecimal num33;

    /** 下注买3号球4的金额 */
    @Excel(name = "下注买3号球4的金额")
    private BigDecimal num34;

    /** 下注买3号球5的金额 */
    @Excel(name = "下注买3号球5的金额")
    private BigDecimal num35;

    /** 下注买3号球6的金额 */
    @Excel(name = "下注买3号球6的金额")
    private BigDecimal num36;

    /** 下注买3号球7的金额 */
    @Excel(name = "下注买3号球7的金额")
    private BigDecimal num37;

    /** 下注买3号球8的金额 */
    @Excel(name = "下注买3号球8的金额")
    private BigDecimal num38;

    /** 下注买3号球9的金额 */
    @Excel(name = "下注买3号球9的金额")
    private BigDecimal num39;

    /** 下注买4号球大的金额 */
    @Excel(name = "下注买4号球大的金额")
    private BigDecimal num4Big;

    /** 下注买4号球小的金额 */
    @Excel(name = "下注买4号球小的金额")
    private BigDecimal num4Small;

    /** 下注买4号球单的金额 */
    @Excel(name = "下注买4号球单的金额")
    private BigDecimal num4Single;

    /** 下注买4号球双的金额 */
    @Excel(name = "下注买4号球双的金额")
    private BigDecimal num4Double;

    /** 下注买4号球0的金额 */
    @Excel(name = "下注买4号球0的金额")
    private BigDecimal num40;

    /** 下注买4号球1的金额 */
    @Excel(name = "下注买4号球1的金额")
    private BigDecimal num41;

    /** 下注买4号球2的金额 */
    @Excel(name = "下注买4号球2的金额")
    private BigDecimal num42;

    /** 下注买4号球3的金额 */
    @Excel(name = "下注买4号球3的金额")
    private BigDecimal num43;

    /** 下注买4号球4的金额 */
    @Excel(name = "下注买4号球4的金额")
    private BigDecimal num44;

    /** 下注买4号球5的金额 */
    @Excel(name = "下注买4号球5的金额")
    private BigDecimal num45;

    /** 下注买4号球6的金额 */
    @Excel(name = "下注买4号球6的金额")
    private BigDecimal num46;

    /** 下注买4号球7的金额 */
    @Excel(name = "下注买4号球7的金额")
    private BigDecimal num47;

    /** 下注买4号球8的金额 */
    @Excel(name = "下注买4号球8的金额")
    private BigDecimal num48;

    /** 下注买4号球9的金额 */
    @Excel(name = "下注买4号球9的金额")
    private BigDecimal num49;

    /** 下注买5号球大的金额 */
    @Excel(name = "下注买5号球大的金额")
    private BigDecimal num5Big;

    /** 下注买5号球小的金额 */
    @Excel(name = "下注买5号球小的金额")
    private BigDecimal num5Small;

    /** 下注买5号球单的金额 */
    @Excel(name = "下注买5号球单的金额")
    private BigDecimal num5Single;

    /** 下注买5号球双的金额 */
    @Excel(name = "下注买5号球双的金额")
    private BigDecimal num5Double;

    /** 下注买5号球0的金额 */
    @Excel(name = "下注买5号球0的金额")
    private BigDecimal num50;

    /** 下注买5号球1的金额 */
    @Excel(name = "下注买5号球1的金额")
    private BigDecimal num51;

    /** 下注买5号球2的金额 */
    @Excel(name = "下注买5号球2的金额")
    private BigDecimal num52;

    /** 下注买5号球3的金额 */
    @Excel(name = "下注买5号球3的金额")
    private BigDecimal num53;

    /** 下注买5号球4的金额 */
    @Excel(name = "下注买5号球4的金额")
    private BigDecimal num54;

    /** 下注买5号球5的金额 */
    @Excel(name = "下注买5号球5的金额")
    private BigDecimal num55;

    /** 下注买5号球6的金额 */
    @Excel(name = "下注买5号球6的金额")
    private BigDecimal num56;

    /** 下注买5号球7的金额 */
    @Excel(name = "下注买5号球7的金额")
    private BigDecimal num57;

    /** 下注买5号球8的金额 */
    @Excel(name = "下注买5号球8的金额")
    private BigDecimal num58;

    /** 下注买5号球9的金额 */
    @Excel(name = "下注买5号球9的金额")
    private BigDecimal num59;

    /** 下注买前三豹的金额 */
    @Excel(name = "下注买前三豹的金额")
    private BigDecimal firstBao;

    /** 下注买前三对的金额 */
    @Excel(name = "下注买前三对的金额")
    private BigDecimal firstDui;

    /** 下注买前三顺的金额 */
    @Excel(name = "下注买前三顺的金额")
    private BigDecimal firstSun;

    /** 下注买前三半的金额 */
    @Excel(name = "下注买前三半的金额")
    private BigDecimal firstBan;

    /** 下注买前三杂的金额 */
    @Excel(name = "下注买前三杂的金额")
    private BigDecimal firstZa;

    /** 下注买中三豹的的金额 */
    @Excel(name = "下注买中三豹的的金额")
    private BigDecimal midBao;

    /** 下注买中三对的的金额 */
    @Excel(name = "下注买中三对的的金额")
    private BigDecimal midDui;

    /** 下注买中三顺的的金额 */
    @Excel(name = "下注买中三顺的的金额")
    private BigDecimal midSun;

    /** 下注买中三半的的金额 */
    @Excel(name = "下注买中三半的的金额")
    private BigDecimal midBan;

    /** 下注买中三杂的的金额 */
    @Excel(name = "下注买中三杂的的金额")
    private BigDecimal midZa;

    /** 下注买后三豹的的金额 */
    @Excel(name = "下注买后三豹的的金额")
    private BigDecimal backBao;

    /** 下注买后三对的的金额 */
    @Excel(name = "下注买后三对的的金额")
    private BigDecimal backDui;

    /** 下注买后三顺的的金额 */
    @Excel(name = "下注买后三顺的的金额")
    private BigDecimal backSun;

    /** 下注买后三半的的金额 */
    @Excel(name = "下注买后三半的的金额")
    private BigDecimal backBan;

    /** 下注买后三杂的的金额 */
    @Excel(name = "下注买后三杂的的金额")
    private BigDecimal backZa;

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

    /** 是否扣除(0否 1是) */
    @Excel(name = "是否扣除(0否 1是)")
    private String isDelete;

    /** 是否扣除 */
    @Excel(name = "是否扣除")
    private String isDeduct;

    /** 房间号 */
    @Excel(name = "房间号")
    private Integer house;

    /** 是否合庄模式 */
    @Excel(name = "是否合庄模式")
    private String hzId;

    /** 是否用户(0否 1是) */
    @Excel(name = "是否用户(0否 1是)")
    private String hzUser;

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
    public void setCountMoney(BigDecimal countMoney) 
    {
        this.countMoney = countMoney;
    }

    public BigDecimal getCountMoney() 
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
    public void setSumBig(BigDecimal sumBig) 
    {
        this.sumBig = sumBig;
    }

    public BigDecimal getSumBig() 
    {
        return sumBig;
    }
    public void setSumSmall(BigDecimal sumSmall) 
    {
        this.sumSmall = sumSmall;
    }

    public BigDecimal getSumSmall() 
    {
        return sumSmall;
    }
    public void setSumSingle(BigDecimal sumSingle) 
    {
        this.sumSingle = sumSingle;
    }

    public BigDecimal getSumSingle() 
    {
        return sumSingle;
    }
    public void setSumDouble(BigDecimal sumDouble) 
    {
        this.sumDouble = sumDouble;
    }

    public BigDecimal getSumDouble() 
    {
        return sumDouble;
    }
    public void setSumLoong(BigDecimal sumLoong) 
    {
        this.sumLoong = sumLoong;
    }

    public BigDecimal getSumLoong() 
    {
        return sumLoong;
    }
    public void setSumTiger(BigDecimal sumTiger) 
    {
        this.sumTiger = sumTiger;
    }

    public BigDecimal getSumTiger() 
    {
        return sumTiger;
    }
    public void setSumSum(BigDecimal sumSum) 
    {
        this.sumSum = sumSum;
    }

    public BigDecimal getSumSum() 
    {
        return sumSum;
    }
    public void setNum1Big(BigDecimal num1Big) 
    {
        this.num1Big = num1Big;
    }

    public BigDecimal getNum1Big() 
    {
        return num1Big;
    }
    public void setNum1Small(BigDecimal num1Small) 
    {
        this.num1Small = num1Small;
    }

    public BigDecimal getNum1Small() 
    {
        return num1Small;
    }
    public void setNum1Single(BigDecimal num1Single) 
    {
        this.num1Single = num1Single;
    }

    public BigDecimal getNum1Single() 
    {
        return num1Single;
    }
    public void setNum1Double(BigDecimal num1Double) 
    {
        this.num1Double = num1Double;
    }

    public BigDecimal getNum1Double() 
    {
        return num1Double;
    }
    public void setNum10(BigDecimal num10) 
    {
        this.num10 = num10;
    }

    public BigDecimal getNum10() 
    {
        return num10;
    }
    public void setNum11(BigDecimal num11) 
    {
        this.num11 = num11;
    }

    public BigDecimal getNum11() 
    {
        return num11;
    }
    public void setNum12(BigDecimal num12) 
    {
        this.num12 = num12;
    }

    public BigDecimal getNum12() 
    {
        return num12;
    }
    public void setNum13(BigDecimal num13) 
    {
        this.num13 = num13;
    }

    public BigDecimal getNum13() 
    {
        return num13;
    }
    public void setNum14(BigDecimal num14) 
    {
        this.num14 = num14;
    }

    public BigDecimal getNum14() 
    {
        return num14;
    }
    public void setNum15(BigDecimal num15) 
    {
        this.num15 = num15;
    }

    public BigDecimal getNum15() 
    {
        return num15;
    }
    public void setNum16(BigDecimal num16) 
    {
        this.num16 = num16;
    }

    public BigDecimal getNum16() 
    {
        return num16;
    }
    public void setNum17(BigDecimal num17) 
    {
        this.num17 = num17;
    }

    public BigDecimal getNum17() 
    {
        return num17;
    }
    public void setNum18(BigDecimal num18) 
    {
        this.num18 = num18;
    }

    public BigDecimal getNum18() 
    {
        return num18;
    }
    public void setNum19(BigDecimal num19) 
    {
        this.num19 = num19;
    }

    public BigDecimal getNum19() 
    {
        return num19;
    }
    public void setNum2Big(BigDecimal num2Big) 
    {
        this.num2Big = num2Big;
    }

    public BigDecimal getNum2Big() 
    {
        return num2Big;
    }
    public void setNum2Small(BigDecimal num2Small) 
    {
        this.num2Small = num2Small;
    }

    public BigDecimal getNum2Small() 
    {
        return num2Small;
    }
    public void setNum2Single(BigDecimal num2Single) 
    {
        this.num2Single = num2Single;
    }

    public BigDecimal getNum2Single() 
    {
        return num2Single;
    }
    public void setNum2Double(BigDecimal num2Double) 
    {
        this.num2Double = num2Double;
    }

    public BigDecimal getNum2Double() 
    {
        return num2Double;
    }
    public void setNum20(BigDecimal num20) 
    {
        this.num20 = num20;
    }

    public BigDecimal getNum20() 
    {
        return num20;
    }
    public void setNum21(BigDecimal num21) 
    {
        this.num21 = num21;
    }

    public BigDecimal getNum21() 
    {
        return num21;
    }
    public void setNum22(BigDecimal num22) 
    {
        this.num22 = num22;
    }

    public BigDecimal getNum22() 
    {
        return num22;
    }
    public void setNum23(BigDecimal num23) 
    {
        this.num23 = num23;
    }

    public BigDecimal getNum23() 
    {
        return num23;
    }
    public void setNum24(BigDecimal num24) 
    {
        this.num24 = num24;
    }

    public BigDecimal getNum24() 
    {
        return num24;
    }
    public void setNum25(BigDecimal num25) 
    {
        this.num25 = num25;
    }

    public BigDecimal getNum25() 
    {
        return num25;
    }
    public void setNum26(BigDecimal num26) 
    {
        this.num26 = num26;
    }

    public BigDecimal getNum26() 
    {
        return num26;
    }
    public void setNum27(BigDecimal num27) 
    {
        this.num27 = num27;
    }

    public BigDecimal getNum27() 
    {
        return num27;
    }
    public void setNum28(BigDecimal num28) 
    {
        this.num28 = num28;
    }

    public BigDecimal getNum28() 
    {
        return num28;
    }
    public void setNum29(BigDecimal num29) 
    {
        this.num29 = num29;
    }

    public BigDecimal getNum29() 
    {
        return num29;
    }
    public void setNum3Big(BigDecimal num3Big) 
    {
        this.num3Big = num3Big;
    }

    public BigDecimal getNum3Big() 
    {
        return num3Big;
    }
    public void setNum3Small(BigDecimal num3Small) 
    {
        this.num3Small = num3Small;
    }

    public BigDecimal getNum3Small() 
    {
        return num3Small;
    }
    public void setNum3Single(BigDecimal num3Single) 
    {
        this.num3Single = num3Single;
    }

    public BigDecimal getNum3Single() 
    {
        return num3Single;
    }
    public void setNum3Double(BigDecimal num3Double) 
    {
        this.num3Double = num3Double;
    }

    public BigDecimal getNum3Double() 
    {
        return num3Double;
    }
    public void setNum30(BigDecimal num30) 
    {
        this.num30 = num30;
    }

    public BigDecimal getNum30() 
    {
        return num30;
    }
    public void setNum31(BigDecimal num31) 
    {
        this.num31 = num31;
    }

    public BigDecimal getNum31() 
    {
        return num31;
    }
    public void setNum32(BigDecimal num32) 
    {
        this.num32 = num32;
    }

    public BigDecimal getNum32() 
    {
        return num32;
    }
    public void setNum33(BigDecimal num33) 
    {
        this.num33 = num33;
    }

    public BigDecimal getNum33() 
    {
        return num33;
    }
    public void setNum34(BigDecimal num34) 
    {
        this.num34 = num34;
    }

    public BigDecimal getNum34() 
    {
        return num34;
    }
    public void setNum35(BigDecimal num35) 
    {
        this.num35 = num35;
    }

    public BigDecimal getNum35() 
    {
        return num35;
    }
    public void setNum36(BigDecimal num36) 
    {
        this.num36 = num36;
    }

    public BigDecimal getNum36() 
    {
        return num36;
    }
    public void setNum37(BigDecimal num37) 
    {
        this.num37 = num37;
    }

    public BigDecimal getNum37() 
    {
        return num37;
    }
    public void setNum38(BigDecimal num38) 
    {
        this.num38 = num38;
    }

    public BigDecimal getNum38() 
    {
        return num38;
    }
    public void setNum39(BigDecimal num39) 
    {
        this.num39 = num39;
    }

    public BigDecimal getNum39() 
    {
        return num39;
    }
    public void setNum4Big(BigDecimal num4Big) 
    {
        this.num4Big = num4Big;
    }

    public BigDecimal getNum4Big() 
    {
        return num4Big;
    }
    public void setNum4Small(BigDecimal num4Small) 
    {
        this.num4Small = num4Small;
    }

    public BigDecimal getNum4Small() 
    {
        return num4Small;
    }
    public void setNum4Single(BigDecimal num4Single) 
    {
        this.num4Single = num4Single;
    }

    public BigDecimal getNum4Single() 
    {
        return num4Single;
    }
    public void setNum4Double(BigDecimal num4Double) 
    {
        this.num4Double = num4Double;
    }

    public BigDecimal getNum4Double() 
    {
        return num4Double;
    }
    public void setNum40(BigDecimal num40) 
    {
        this.num40 = num40;
    }

    public BigDecimal getNum40() 
    {
        return num40;
    }
    public void setNum41(BigDecimal num41) 
    {
        this.num41 = num41;
    }

    public BigDecimal getNum41() 
    {
        return num41;
    }
    public void setNum42(BigDecimal num42) 
    {
        this.num42 = num42;
    }

    public BigDecimal getNum42() 
    {
        return num42;
    }
    public void setNum43(BigDecimal num43) 
    {
        this.num43 = num43;
    }

    public BigDecimal getNum43() 
    {
        return num43;
    }
    public void setNum44(BigDecimal num44) 
    {
        this.num44 = num44;
    }

    public BigDecimal getNum44() 
    {
        return num44;
    }
    public void setNum45(BigDecimal num45) 
    {
        this.num45 = num45;
    }

    public BigDecimal getNum45() 
    {
        return num45;
    }
    public void setNum46(BigDecimal num46) 
    {
        this.num46 = num46;
    }

    public BigDecimal getNum46() 
    {
        return num46;
    }
    public void setNum47(BigDecimal num47) 
    {
        this.num47 = num47;
    }

    public BigDecimal getNum47() 
    {
        return num47;
    }
    public void setNum48(BigDecimal num48) 
    {
        this.num48 = num48;
    }

    public BigDecimal getNum48() 
    {
        return num48;
    }
    public void setNum49(BigDecimal num49) 
    {
        this.num49 = num49;
    }

    public BigDecimal getNum49() 
    {
        return num49;
    }
    public void setNum5Big(BigDecimal num5Big) 
    {
        this.num5Big = num5Big;
    }

    public BigDecimal getNum5Big() 
    {
        return num5Big;
    }
    public void setNum5Small(BigDecimal num5Small) 
    {
        this.num5Small = num5Small;
    }

    public BigDecimal getNum5Small() 
    {
        return num5Small;
    }
    public void setNum5Single(BigDecimal num5Single) 
    {
        this.num5Single = num5Single;
    }

    public BigDecimal getNum5Single() 
    {
        return num5Single;
    }
    public void setNum5Double(BigDecimal num5Double) 
    {
        this.num5Double = num5Double;
    }

    public BigDecimal getNum5Double() 
    {
        return num5Double;
    }
    public void setNum50(BigDecimal num50) 
    {
        this.num50 = num50;
    }

    public BigDecimal getNum50() 
    {
        return num50;
    }
    public void setNum51(BigDecimal num51) 
    {
        this.num51 = num51;
    }

    public BigDecimal getNum51() 
    {
        return num51;
    }
    public void setNum52(BigDecimal num52) 
    {
        this.num52 = num52;
    }

    public BigDecimal getNum52() 
    {
        return num52;
    }
    public void setNum53(BigDecimal num53) 
    {
        this.num53 = num53;
    }

    public BigDecimal getNum53() 
    {
        return num53;
    }
    public void setNum54(BigDecimal num54) 
    {
        this.num54 = num54;
    }

    public BigDecimal getNum54() 
    {
        return num54;
    }
    public void setNum55(BigDecimal num55) 
    {
        this.num55 = num55;
    }

    public BigDecimal getNum55() 
    {
        return num55;
    }
    public void setNum56(BigDecimal num56) 
    {
        this.num56 = num56;
    }

    public BigDecimal getNum56() 
    {
        return num56;
    }
    public void setNum57(BigDecimal num57) 
    {
        this.num57 = num57;
    }

    public BigDecimal getNum57() 
    {
        return num57;
    }
    public void setNum58(BigDecimal num58) 
    {
        this.num58 = num58;
    }

    public BigDecimal getNum58() 
    {
        return num58;
    }
    public void setNum59(BigDecimal num59) 
    {
        this.num59 = num59;
    }

    public BigDecimal getNum59() 
    {
        return num59;
    }
    public void setFirstBao(BigDecimal firstBao) 
    {
        this.firstBao = firstBao;
    }

    public BigDecimal getFirstBao() 
    {
        return firstBao;
    }
    public void setFirstDui(BigDecimal firstDui) 
    {
        this.firstDui = firstDui;
    }

    public BigDecimal getFirstDui() 
    {
        return firstDui;
    }
    public void setFirstSun(BigDecimal firstSun) 
    {
        this.firstSun = firstSun;
    }

    public BigDecimal getFirstSun() 
    {
        return firstSun;
    }
    public void setFirstBan(BigDecimal firstBan) 
    {
        this.firstBan = firstBan;
    }

    public BigDecimal getFirstBan() 
    {
        return firstBan;
    }
    public void setFirstZa(BigDecimal firstZa) 
    {
        this.firstZa = firstZa;
    }

    public BigDecimal getFirstZa() 
    {
        return firstZa;
    }
    public void setMidBao(BigDecimal midBao) 
    {
        this.midBao = midBao;
    }

    public BigDecimal getMidBao() 
    {
        return midBao;
    }
    public void setMidDui(BigDecimal midDui) 
    {
        this.midDui = midDui;
    }

    public BigDecimal getMidDui() 
    {
        return midDui;
    }
    public void setMidSun(BigDecimal midSun) 
    {
        this.midSun = midSun;
    }

    public BigDecimal getMidSun() 
    {
        return midSun;
    }
    public void setMidBan(BigDecimal midBan) 
    {
        this.midBan = midBan;
    }

    public BigDecimal getMidBan() 
    {
        return midBan;
    }
    public void setMidZa(BigDecimal midZa) 
    {
        this.midZa = midZa;
    }

    public BigDecimal getMidZa() 
    {
        return midZa;
    }
    public void setBackBao(BigDecimal backBao) 
    {
        this.backBao = backBao;
    }

    public BigDecimal getBackBao() 
    {
        return backBao;
    }
    public void setBackDui(BigDecimal backDui) 
    {
        this.backDui = backDui;
    }

    public BigDecimal getBackDui() 
    {
        return backDui;
    }
    public void setBackSun(BigDecimal backSun) 
    {
        this.backSun = backSun;
    }

    public BigDecimal getBackSun() 
    {
        return backSun;
    }
    public void setBackBan(BigDecimal backBan) 
    {
        this.backBan = backBan;
    }

    public BigDecimal getBackBan() 
    {
        return backBan;
    }
    public void setBackZa(BigDecimal backZa) 
    {
        this.backZa = backZa;
    }

    public BigDecimal getBackZa() 
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
    public void setIsDelete(String isDelete) 
    {
        this.isDelete = isDelete;
    }

    public String getIsDelete() 
    {
        return isDelete;
    }
    public void setIsDeduct(String isDeduct) 
    {
        this.isDeduct = isDeduct;
    }

    public String getIsDeduct() 
    {
        return isDeduct;
    }
    public void setHouse(Integer house) 
    {
        this.house = house;
    }

    public Integer getHouse() 
    {
        return house;
    }
    public void setHzId(String hzId) 
    {
        this.hzId = hzId;
    }

    public String getHzId() 
    {
        return hzId;
    }
    public void setHzUser(String hzUser) 
    {
        this.hzUser = hzUser;
    }

    public String getHzUser() 
    {
        return hzUser;
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
            .append("isDeduct", getIsDeduct())
            .append("house", getHouse())
            .append("hzId", getHzId())
            .append("hzUser", getHzUser())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}