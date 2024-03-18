package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 加拿大下注对象 jndrecord
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class Jndrecord extends BaseEntity
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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

    /** 下注大的金额 */
    @Excel(name = "下注大的金额")
    private Long big;

    /** 下注小的金额 */
    @Excel(name = "下注小的金额")
    private Long small;

    /** 下注单的金额 */
    @Excel(name = "下注单的金额")
    private Long single;

    /** 下注双的金额 */
    @Excel(name = "下注双的金额")
    private Long doubleAmount;

    /** 下注极大的金额 */
    @Excel(name = "下注极大的金额")
    private Long muchBig;

    /** 下注大单的金额 */
    @Excel(name = "下注大单的金额")
    private Long bigSingle;

    /** 下注小单的金额 */
    @Excel(name = "下注小单的金额")
    private Long smallSingle;

    /** 下注大双的金额 */
    @Excel(name = "下注大双的金额")
    private Long bigDouble;

    /** 下注小双的金额 */
    @Excel(name = "下注小双的金额")
    private Long smallDouble;

    /** 下注极小的金额 */
    @Excel(name = "下注极小的金额")
    private Long muchSmall;

    /** 下注数字0的金额 */
    @Excel(name = "下注数字0的金额")
    private Long num0;

    /** 下注数字1的金额 */
    @Excel(name = "下注数字1的金额")
    private Long num1;

    /** 下注数字2的金额 */
    @Excel(name = "下注数字2的金额")
    private Long num2;

    /** 下注数字3的金额 */
    @Excel(name = "下注数字3的金额")
    private Long num3;

    /** 下注数字4的金额 */
    @Excel(name = "下注数字4的金额")
    private Long num4;

    /** 下注数字5的金额 */
    @Excel(name = "下注数字5的金额")
    private Long num5;

    /** 下注数字6的金额 */
    @Excel(name = "下注数字6的金额")
    private Long num6;

    /** 下注数字7的金额 */
    @Excel(name = "下注数字7的金额")
    private Long num7;

    /** 下注数字8的金额 */
    @Excel(name = "下注数字8的金额")
    private Long num8;

    /** 下注数字9的金额 */
    @Excel(name = "下注数字9的金额")
    private Long num9;

    /** 下注数字10的金额 */
    @Excel(name = "下注数字10的金额")
    private Long num10;

    /** 下注数字11的金额 */
    @Excel(name = "下注数字11的金额")
    private Long num11;

    /** 下注数字12的金额 */
    @Excel(name = "下注数字12的金额")
    private Long num12;

    /** 下注数字13的金额 */
    @Excel(name = "下注数字13的金额")
    private Long num13;

    /** 下注数字14的金额 */
    @Excel(name = "下注数字14的金额")
    private Long num14;

    /** 下注数字15的金额 */
    @Excel(name = "下注数字15的金额")
    private Long num15;

    /** 下注数字16的金额 */
    @Excel(name = "下注数字16的金额")
    private Long num16;

    /** 下注数字17的金额 */
    @Excel(name = "下注数字17的金额")
    private Long num17;

    /** 下注数字18的金额 */
    @Excel(name = "下注数字18的金额")
    private Long num18;

    /** 下注数字19的金额 */
    @Excel(name = "下注数字19的金额")
    private Long num19;

    /** 下注数字20的金额 */
    @Excel(name = "下注数字20的金额")
    private Long num20;

    /** 下注数字21的金额 */
    @Excel(name = "下注数字21的金额")
    private Long num21;

    /** 下注数字22的金额 */
    @Excel(name = "下注数字22的金额")
    private Long num22;

    /** 下注数字23的金额 */
    @Excel(name = "下注数字23的金额")
    private Long num23;

    /** 下注数字24的金额 */
    @Excel(name = "下注数字24的金额")
    private Long num24;

    /** 下注数字25的金额 */
    @Excel(name = "下注数字25的金额")
    private Long num25;

    /** 下注数字26的金额 */
    @Excel(name = "下注数字26的金额")
    private Long num26;

    /** 下注数字27的金额 */
    @Excel(name = "下注数字27的金额")
    private Long num27;

    /** 下注红的金额 */
    @Excel(name = "下注红的金额")
    private Long red;

    /** 下注绿的金额 */
    @Excel(name = "下注绿的金额")
    private Long green;

    /** 下注蓝的金额 */
    @Excel(name = "下注蓝的金额")
    private Long blue;

    /** 下注龙的金额 */
    @Excel(name = "下注龙的金额")
    private Long loong;

    /** 下注虎的金额 */
    @Excel(name = "下注虎的金额")
    private Long tiger;

    /** 下注合的金额 */
    @Excel(name = "下注合的金额")
    private Long close;

    /** 下注豹子的金额 */
    @Excel(name = "下注豹子的金额")
    private Long leopard;

    /** 下注对子的金额 */
    @Excel(name = "下注对子的金额")
    private Long pairs;

    /** 下注顺子的金额 */
    @Excel(name = "下注顺子的金额")
    private Long shun;

    /** VIP房间 */
    @Excel(name = "VIP房间")
    private Integer vip;

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Long n1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Long n2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Long n3;

    /** 开奖合算数字 */
    @Excel(name = "开奖合算数字")
    private Long sumNum;

    /** 是否合庄模式 */
    @Excel(name = "是否合庄模式")
    private Integer hzId;

    /** 是否用户 */
    @Excel(name = "是否用户")
    private Long hzUser;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer isDelete;

    /** 是否扣除 */
    @Excel(name = "是否扣除")
    private Integer isDeduct;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer house;

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
    public void setBig(Long big) 
    {
        this.big = big;
    }

    public Long getBig() 
    {
        return big;
    }
    public void setSmall(Long small) 
    {
        this.small = small;
    }

    public Long getSmall() 
    {
        return small;
    }
    public void setSingle(Long single) 
    {
        this.single = single;
    }

    public Long getSingle() 
    {
        return single;
    }
    public void setDoubleAmount(Long doubleAmount) 
    {
        this.doubleAmount = doubleAmount;
    }

    public Long getDoubleAmount() 
    {
        return doubleAmount;
    }
    public void setMuchBig(Long muchBig) 
    {
        this.muchBig = muchBig;
    }

    public Long getMuchBig() 
    {
        return muchBig;
    }
    public void setBigSingle(Long bigSingle) 
    {
        this.bigSingle = bigSingle;
    }

    public Long getBigSingle() 
    {
        return bigSingle;
    }
    public void setSmallSingle(Long smallSingle) 
    {
        this.smallSingle = smallSingle;
    }

    public Long getSmallSingle() 
    {
        return smallSingle;
    }
    public void setBigDouble(Long bigDouble) 
    {
        this.bigDouble = bigDouble;
    }

    public Long getBigDouble() 
    {
        return bigDouble;
    }
    public void setSmallDouble(Long smallDouble) 
    {
        this.smallDouble = smallDouble;
    }

    public Long getSmallDouble() 
    {
        return smallDouble;
    }
    public void setMuchSmall(Long muchSmall) 
    {
        this.muchSmall = muchSmall;
    }

    public Long getMuchSmall() 
    {
        return muchSmall;
    }
    public void setNum0(Long num0) 
    {
        this.num0 = num0;
    }

    public Long getNum0() 
    {
        return num0;
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
    public void setRed(Long red) 
    {
        this.red = red;
    }

    public Long getRed() 
    {
        return red;
    }
    public void setGreen(Long green) 
    {
        this.green = green;
    }

    public Long getGreen() 
    {
        return green;
    }
    public void setBlue(Long blue) 
    {
        this.blue = blue;
    }

    public Long getBlue() 
    {
        return blue;
    }
    public void setLoong(Long loong) 
    {
        this.loong = loong;
    }

    public Long getLoong() 
    {
        return loong;
    }
    public void setTiger(Long tiger) 
    {
        this.tiger = tiger;
    }

    public Long getTiger() 
    {
        return tiger;
    }
    public void setClose(Long close) 
    {
        this.close = close;
    }

    public Long getClose() 
    {
        return close;
    }
    public void setLeopard(Long leopard) 
    {
        this.leopard = leopard;
    }

    public Long getLeopard() 
    {
        return leopard;
    }
    public void setPairs(Long pairs) 
    {
        this.pairs = pairs;
    }

    public Long getPairs() 
    {
        return pairs;
    }
    public void setShun(Long shun) 
    {
        this.shun = shun;
    }

    public Long getShun() 
    {
        return shun;
    }
    public void setVip(Integer vip) 
    {
        this.vip = vip;
    }

    public Integer getVip() 
    {
        return vip;
    }
    public void setN1(Long n1) 
    {
        this.n1 = n1;
    }

    public Long getN1() 
    {
        return n1;
    }
    public void setN2(Long n2) 
    {
        this.n2 = n2;
    }

    public Long getN2() 
    {
        return n2;
    }
    public void setN3(Long n3) 
    {
        this.n3 = n3;
    }

    public Long getN3() 
    {
        return n3;
    }
    public void setSumNum(Long sumNum) 
    {
        this.sumNum = sumNum;
    }

    public Long getSumNum() 
    {
        return sumNum;
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
    public void setIsDelete(Integer isDelete) 
    {
        this.isDelete = isDelete;
    }

    public Integer getIsDelete() 
    {
        return isDelete;
    }
    public void setIsDeduct(Integer isDeduct) 
    {
        this.isDeduct = isDeduct;
    }

    public Integer getIsDeduct() 
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
            .append("big", getBig())
            .append("small", getSmall())
            .append("single", getSingle())
            .append("doubleAmount", getDoubleAmount())
            .append("muchBig", getMuchBig())
            .append("bigSingle", getBigSingle())
            .append("smallSingle", getSmallSingle())
            .append("bigDouble", getBigDouble())
            .append("smallDouble", getSmallDouble())
            .append("muchSmall", getMuchSmall())
            .append("num0", getNum0())
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
            .append("num21", getNum21())
            .append("num22", getNum22())
            .append("num23", getNum23())
            .append("num24", getNum24())
            .append("num25", getNum25())
            .append("num26", getNum26())
            .append("num27", getNum27())
            .append("red", getRed())
            .append("green", getGreen())
            .append("blue", getBlue())
            .append("loong", getLoong())
            .append("tiger", getTiger())
            .append("close", getClose())
            .append("leopard", getLeopard())
            .append("pairs", getPairs())
            .append("shun", getShun())
            .append("vip", getVip())
            .append("n1", getN1())
            .append("n2", getN2())
            .append("n3", getN3())
            .append("sumNum", getSumNum())
            .append("hzId", getHzId())
            .append("hzUser", getHzUser())
            .append("isDelete", getIsDelete())
            .append("isDeduct", getIsDeduct())
            .append("house", getHouse())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
