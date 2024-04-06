package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 5球下注对象 game_fiveball_record
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameFiveballRecord extends BaseEntity
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

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 投注状态（0投注 1撤单） */
    @Excel(name = "投注状态", readConverterExp = "0=投注,1=撤单")
    private String status;

    /** 投注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "投注时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordTime;

    /** 确认时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkTime;

    /** 下注金额 */
    @Excel(name = "下注金额")
    private Float countMoney;

    /** 中奖金额 */
    @Excel(name = "中奖金额")
    private Float winMoney;

    /** 下注和值大的金额 */
    @Excel(name = "下注和值大的金额")
    private Float sumBig;

    /** 下注和值小的金额 */
    @Excel(name = "下注和值小的金额")
    private Float sumSmall;

    /** 下注和值单的金额 */
    @Excel(name = "下注和值单的金额")
    private Float sumSingle;

    /** 下注和值双的金额 */
    @Excel(name = "下注和值双的金额")
    private Float sumDouble;

    /** 下注和值龙的金额 */
    @Excel(name = "下注和值龙的金额")
    private Float sumLoong;

    /** 下注和值虎的金额 */
    @Excel(name = "下注和值虎的金额")
    private Float sumTiger;

    /** 下注和值和的金额 */
    @Excel(name = "下注和值和的金额")
    private Float sumSum;

    /** 下注买球1球大的金额 */
    @Excel(name = "下注买球1球大的金额")
    private Float num1Big;

    /** 下注买球1球小的金额 */
    @Excel(name = "下注买球1球小的金额")
    private Float num1Small;

    /** 下注买球1球单的金额 */
    @Excel(name = "下注买球1球单的金额")
    private Float num1Single;

    /** 下注买球1球双的金额 */
    @Excel(name = "下注买球1球双的金额")
    private Float num1Double;

    /** 下注买球1号码0的金额 */
    @Excel(name = "下注买球1号码0的金额")
    private Float num1Ball0;

    /** 下注买球1号码1的金额 */
    @Excel(name = "下注买球1号码1的金额")
    private Float num1Ball1;

    /** 下注买球1号码2的金额 */
    @Excel(name = "下注买球1号码2的金额")
    private Float num1Ball2;

    /** 下注买球1号码3的金额 */
    @Excel(name = "下注买球1号码3的金额")
    private Float num1Ball3;

    /** 下注买球1号码4的金额 */
    @Excel(name = "下注买球1号码4的金额")
    private Float num1Ball4;

    /** 下注买球1号码5的金额 */
    @Excel(name = "下注买球1号码5的金额")
    private Float num1Ball5;

    /** 下注买球1号码6的金额 */
    @Excel(name = "下注买球1号码6的金额")
    private Float num1Ball6;

    /** 下注买球1号码7的金额 */
    @Excel(name = "下注买球1号码7的金额")
    private Float num1Ball7;

    /** 下注买球1号码8的金额 */
    @Excel(name = "下注买球1号码8的金额")
    private Float num1Ball8;

    /** 下注买球1号码9的金额 */
    @Excel(name = "下注买球1号码9的金额")
    private Float num1Ball9;

    /** 下注买球2球大的金额 */
    @Excel(name = "下注买球2球大的金额")
    private Float num2Big;

    /** 下注买球2球小的金额 */
    @Excel(name = "下注买球2球小的金额")
    private Float num2Small;

    /** 下注买球2球单的金额 */
    @Excel(name = "下注买球2球单的金额")
    private Float num2Single;

    /** 下注买球2球双的金额 */
    @Excel(name = "下注买球2球双的金额")
    private Float num2Double;

    /** 下注买球2号码0的金额 */
    @Excel(name = "下注买球2号码0的金额")
    private Float num2Ball0;

    /** 下注买球2号码1的金额 */
    @Excel(name = "下注买球2号码1的金额")
    private Float num2Ball1;

    /** 下注买球2号码2的金额 */
    @Excel(name = "下注买球2号码2的金额")
    private Float num2Ball2;

    /** 下注买球2号码3的金额 */
    @Excel(name = "下注买球2号码3的金额")
    private Float num2Ball3;

    /** 下注买球2号码4的金额 */
    @Excel(name = "下注买球2号码4的金额")
    private Float num2Ball4;

    /** 下注买球2号码5的金额 */
    @Excel(name = "下注买球2号码5的金额")
    private Float num2Ball5;

    /** 下注买球2号码6的金额 */
    @Excel(name = "下注买球2号码6的金额")
    private Float num2Ball6;

    /** 下注买球2号码7的金额 */
    @Excel(name = "下注买球2号码7的金额")
    private Float num2Ball7;

    /** 下注买球2号码8的金额 */
    @Excel(name = "下注买球2号码8的金额")
    private Float num2Ball8;

    /** 下注买球2号码9的金额 */
    @Excel(name = "下注买球2号码9的金额")
    private Float num2Ball9;

    /** 下注买球3球大的金额 */
    @Excel(name = "下注买球3球大的金额")
    private Float num3Big;

    /** 下注买球3球小的金额 */
    @Excel(name = "下注买球3球小的金额")
    private Float num3Small;

    /** 下注买球3球单的金额 */
    @Excel(name = "下注买球3球单的金额")
    private Float num3Single;

    /** 下注买球3球双的金额 */
    @Excel(name = "下注买球3球双的金额")
    private Float num3Double;

    /** 下注买球3号码0的金额 */
    @Excel(name = "下注买球3号码0的金额")
    private Float num3Ball0;

    /** 下注买球3号码1的金额 */
    @Excel(name = "下注买球3号码1的金额")
    private Float num3Ball1;

    /** 下注买球3号码2的金额 */
    @Excel(name = "下注买球3号码2的金额")
    private Float num3Ball2;

    /** 下注买球3号码3的金额 */
    @Excel(name = "下注买球3号码3的金额")
    private Float num3Ball3;

    /** 下注买球3号码4的金额 */
    @Excel(name = "下注买球3号码4的金额")
    private Float num3Ball4;

    /** 下注买球3号码5的金额 */
    @Excel(name = "下注买球3号码5的金额")
    private Float num3Ball5;

    /** 下注买球3号码6的金额 */
    @Excel(name = "下注买球3号码6的金额")
    private Float num3Ball6;

    /** 下注买球3号码7的金额 */
    @Excel(name = "下注买球3号码7的金额")
    private Float num3Ball7;

    /** 下注买球3号码8的金额 */
    @Excel(name = "下注买球3号码8的金额")
    private Float num3Ball8;

    /** 下注买球3号码9的金额 */
    @Excel(name = "下注买球3号码9的金额")
    private Float num3Ball9;

    /** 下注买球4球大的金额 */
    @Excel(name = "下注买球4球大的金额")
    private Float num4Big;

    /** 下注买球4球小的金额 */
    @Excel(name = "下注买球4球小的金额")
    private Float num4Small;

    /** 下注买球4球单的金额 */
    @Excel(name = "下注买球4球单的金额")
    private Float num4Single;

    /** 下注买球4球双的金额 */
    @Excel(name = "下注买球4球双的金额")
    private Float num4Double;

    /** 下注买球4号码0的金额 */
    @Excel(name = "下注买球4号码0的金额")
    private Float num4Ball0;

    /** 下注买球4号码1的金额 */
    @Excel(name = "下注买球4号码1的金额")
    private Float num4Ball1;

    /** 下注买球4号码2的金额 */
    @Excel(name = "下注买球4号码2的金额")
    private Float num4Ball2;

    /** 下注买球4号码3的金额 */
    @Excel(name = "下注买球4号码3的金额")
    private Float num4Ball3;

    /** 下注买球4号码4的金额 */
    @Excel(name = "下注买球4号码4的金额")
    private Float num4Ball4;

    /** 下注买球4号码5的金额 */
    @Excel(name = "下注买球4号码5的金额")
    private Float num4Ball5;

    /** 下注买球4号码6的金额 */
    @Excel(name = "下注买球4号码6的金额")
    private Float num4Ball6;

    /** 下注买球4号码7的金额 */
    @Excel(name = "下注买球4号码7的金额")
    private Float num4Ball7;

    /** 下注买球4号码8的金额 */
    @Excel(name = "下注买球4号码8的金额")
    private Float num4Ball8;

    /** 下注买球4号码9的金额 */
    @Excel(name = "下注买球4号码9的金额")
    private Float num4Ball9;

    /** 下注买球5球大的金额 */
    @Excel(name = "下注买球5球大的金额")
    private Float num5Big;

    /** 下注买球5球小的金额 */
    @Excel(name = "下注买球5球小的金额")
    private Float num5Small;

    /** 下注买球5球单的金额 */
    @Excel(name = "下注买球5球单的金额")
    private Float num5Single;

    /** 下注买球5球双的金额 */
    @Excel(name = "下注买球5球双的金额")
    private Float num5Double;

    /** 下注买球5号码0的金额 */
    @Excel(name = "下注买球5号码0的金额")
    private Float num5Ball0;

    /** 下注买球5号码1的金额 */
    @Excel(name = "下注买球5号码1的金额")
    private Float num5Ball1;

    /** 下注买球5号码2的金额 */
    @Excel(name = "下注买球5号码2的金额")
    private Float num5Ball2;

    /** 下注买球5号码3的金额 */
    @Excel(name = "下注买球5号码3的金额")
    private Float num5Ball3;

    /** 下注买球5号码4的金额 */
    @Excel(name = "下注买球5号码4的金额")
    private Float num5Ball4;

    /** 下注买球5号码5的金额 */
    @Excel(name = "下注买球5号码5的金额")
    private Float num5Ball5;

    /** 下注买球5号码6的金额 */
    @Excel(name = "下注买球5号码6的金额")
    private Float num5Ball6;

    /** 下注买球5号码7的金额 */
    @Excel(name = "下注买球5号码7的金额")
    private Float num5Ball7;

    /** 下注买球5号码8的金额 */
    @Excel(name = "下注买球5号码8的金额")
    private Float num5Ball8;

    /** 下注买球5号码9的金额 */
    @Excel(name = "下注买球5号码9的金额")
    private Float num5Ball9;

    /** 下注买前三豹的金额 */
    @Excel(name = "下注买前三豹的金额")
    private Float firstBao;

    /** 下注买前三对的金额 */
    @Excel(name = "下注买前三对的金额")
    private Float firstDui;

    /** 下注买前三顺的金额 */
    @Excel(name = "下注买前三顺的金额")
    private Float firstSun;

    /** 下注买前三半的金额 */
    @Excel(name = "下注买前三半的金额")
    private Float firstBan;

    /** 下注买前三杂的金额 */
    @Excel(name = "下注买前三杂的金额")
    private Float firstZa;

    /** 下注买中三豹的的金额 */
    @Excel(name = "下注买中三豹的的金额")
    private Float midBao;

    /** 下注买中三对的的金额 */
    @Excel(name = "下注买中三对的的金额")
    private Float midDui;

    /** 下注买中三顺的的金额 */
    @Excel(name = "下注买中三顺的的金额")
    private Float midSun;

    /** 下注买中三半的的金额 */
    @Excel(name = "下注买中三半的的金额")
    private Float midBan;

    /** 下注买中三杂的的金额 */
    @Excel(name = "下注买中三杂的的金额")
    private Float midZa;

    /** 下注买后三豹的的金额 */
    @Excel(name = "下注买后三豹的的金额")
    private Float backBao;

    /** 下注买后三对的的金额 */
    @Excel(name = "下注买后三对的的金额")
    private Float backDui;

    /** 下注买后三顺的的金额 */
    @Excel(name = "下注买后三顺的的金额")
    private Float backSun;

    /** 下注买后三半的的金额 */
    @Excel(name = "下注买后三半的的金额")
    private Float backBan;

    /** 下注买后三杂的的金额 */
    @Excel(name = "下注买后三杂的的金额")
    private Float backZa;

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

    /** 开奖合算数字 */
    @Excel(name = "开奖合算数字")
    private Integer sum;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Float getCountMoney() {
        return countMoney;
    }

    public void setCountMoney(Float countMoney) {
        this.countMoney = countMoney;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public Float getSumBig() {
        return sumBig;
    }

    public void setSumBig(Float sumBig) {
        this.sumBig = sumBig;
    }

    public Float getSumSmall() {
        return sumSmall;
    }

    public void setSumSmall(Float sumSmall) {
        this.sumSmall = sumSmall;
    }

    public Float getSumSingle() {
        return sumSingle;
    }

    public void setSumSingle(Float sumSingle) {
        this.sumSingle = sumSingle;
    }

    public Float getSumDouble() {
        return sumDouble;
    }

    public void setSumDouble(Float sumDouble) {
        this.sumDouble = sumDouble;
    }

    public Float getSumLoong() {
        return sumLoong;
    }

    public void setSumLoong(Float sumLoong) {
        this.sumLoong = sumLoong;
    }

    public Float getSumTiger() {
        return sumTiger;
    }

    public void setSumTiger(Float sumTiger) {
        this.sumTiger = sumTiger;
    }

    public Float getSumSum() {
        return sumSum;
    }

    public void setSumSum(Float sumSum) {
        this.sumSum = sumSum;
    }

    public Float getNum1Big() {
        return num1Big;
    }

    public void setNum1Big(Float num1Big) {
        this.num1Big = num1Big;
    }

    public Float getNum1Small() {
        return num1Small;
    }

    public void setNum1Small(Float num1Small) {
        this.num1Small = num1Small;
    }

    public Float getNum1Single() {
        return num1Single;
    }

    public void setNum1Single(Float num1Single) {
        this.num1Single = num1Single;
    }

    public Float getNum1Double() {
        return num1Double;
    }

    public void setNum1Double(Float num1Double) {
        this.num1Double = num1Double;
    }

    public Float getNum1Ball0() {
        return num1Ball0;
    }

    public void setNum1Ball0(Float num1Ball0) {
        this.num1Ball0 = num1Ball0;
    }

    public Float getNum1Ball1() {
        return num1Ball1;
    }

    public void setNum1Ball1(Float num1Ball1) {
        this.num1Ball1 = num1Ball1;
    }

    public Float getNum1Ball2() {
        return num1Ball2;
    }

    public void setNum1Ball2(Float num1Ball2) {
        this.num1Ball2 = num1Ball2;
    }

    public Float getNum1Ball3() {
        return num1Ball3;
    }

    public void setNum1Ball3(Float num1Ball3) {
        this.num1Ball3 = num1Ball3;
    }

    public Float getNum1Ball4() {
        return num1Ball4;
    }

    public void setNum1Ball4(Float num1Ball4) {
        this.num1Ball4 = num1Ball4;
    }

    public Float getNum1Ball5() {
        return num1Ball5;
    }

    public void setNum1Ball5(Float num1Ball5) {
        this.num1Ball5 = num1Ball5;
    }

    public Float getNum1Ball6() {
        return num1Ball6;
    }

    public void setNum1Ball6(Float num1Ball6) {
        this.num1Ball6 = num1Ball6;
    }

    public Float getNum1Ball7() {
        return num1Ball7;
    }

    public void setNum1Ball7(Float num1Ball7) {
        this.num1Ball7 = num1Ball7;
    }

    public Float getNum1Ball8() {
        return num1Ball8;
    }

    public void setNum1Ball8(Float num1Ball8) {
        this.num1Ball8 = num1Ball8;
    }

    public Float getNum1Ball9() {
        return num1Ball9;
    }

    public void setNum1Ball9(Float num1Ball9) {
        this.num1Ball9 = num1Ball9;
    }

    public Float getNum2Big() {
        return num2Big;
    }

    public void setNum2Big(Float num2Big) {
        this.num2Big = num2Big;
    }

    public Float getNum2Small() {
        return num2Small;
    }

    public void setNum2Small(Float num2Small) {
        this.num2Small = num2Small;
    }

    public Float getNum2Single() {
        return num2Single;
    }

    public void setNum2Single(Float num2Single) {
        this.num2Single = num2Single;
    }

    public Float getNum2Double() {
        return num2Double;
    }

    public void setNum2Double(Float num2Double) {
        this.num2Double = num2Double;
    }

    public Float getNum2Ball0() {
        return num2Ball0;
    }

    public void setNum2Ball0(Float num2Ball0) {
        this.num2Ball0 = num2Ball0;
    }

    public Float getNum2Ball1() {
        return num2Ball1;
    }

    public void setNum2Ball1(Float num2Ball1) {
        this.num2Ball1 = num2Ball1;
    }

    public Float getNum2Ball2() {
        return num2Ball2;
    }

    public void setNum2Ball2(Float num2Ball2) {
        this.num2Ball2 = num2Ball2;
    }

    public Float getNum2Ball3() {
        return num2Ball3;
    }

    public void setNum2Ball3(Float num2Ball3) {
        this.num2Ball3 = num2Ball3;
    }

    public Float getNum2Ball4() {
        return num2Ball4;
    }

    public void setNum2Ball4(Float num2Ball4) {
        this.num2Ball4 = num2Ball4;
    }

    public Float getNum2Ball5() {
        return num2Ball5;
    }

    public void setNum2Ball5(Float num2Ball5) {
        this.num2Ball5 = num2Ball5;
    }

    public Float getNum2Ball6() {
        return num2Ball6;
    }

    public void setNum2Ball6(Float num2Ball6) {
        this.num2Ball6 = num2Ball6;
    }

    public Float getNum2Ball7() {
        return num2Ball7;
    }

    public void setNum2Ball7(Float num2Ball7) {
        this.num2Ball7 = num2Ball7;
    }

    public Float getNum2Ball8() {
        return num2Ball8;
    }

    public void setNum2Ball8(Float num2Ball8) {
        this.num2Ball8 = num2Ball8;
    }

    public Float getNum2Ball9() {
        return num2Ball9;
    }

    public void setNum2Ball9(Float num2Ball9) {
        this.num2Ball9 = num2Ball9;
    }

    public Float getNum3Big() {
        return num3Big;
    }

    public void setNum3Big(Float num3Big) {
        this.num3Big = num3Big;
    }

    public Float getNum3Small() {
        return num3Small;
    }

    public void setNum3Small(Float num3Small) {
        this.num3Small = num3Small;
    }

    public Float getNum3Single() {
        return num3Single;
    }

    public void setNum3Single(Float num3Single) {
        this.num3Single = num3Single;
    }

    public Float getNum3Double() {
        return num3Double;
    }

    public void setNum3Double(Float num3Double) {
        this.num3Double = num3Double;
    }

    public Float getNum3Ball0() {
        return num3Ball0;
    }

    public void setNum3Ball0(Float num3Ball0) {
        this.num3Ball0 = num3Ball0;
    }

    public Float getNum3Ball1() {
        return num3Ball1;
    }

    public void setNum3Ball1(Float num3Ball1) {
        this.num3Ball1 = num3Ball1;
    }

    public Float getNum3Ball2() {
        return num3Ball2;
    }

    public void setNum3Ball2(Float num3Ball2) {
        this.num3Ball2 = num3Ball2;
    }

    public Float getNum3Ball3() {
        return num3Ball3;
    }

    public void setNum3Ball3(Float num3Ball3) {
        this.num3Ball3 = num3Ball3;
    }

    public Float getNum3Ball4() {
        return num3Ball4;
    }

    public void setNum3Ball4(Float num3Ball4) {
        this.num3Ball4 = num3Ball4;
    }

    public Float getNum3Ball5() {
        return num3Ball5;
    }

    public void setNum3Ball5(Float num3Ball5) {
        this.num3Ball5 = num3Ball5;
    }

    public Float getNum3Ball6() {
        return num3Ball6;
    }

    public void setNum3Ball6(Float num3Ball6) {
        this.num3Ball6 = num3Ball6;
    }

    public Float getNum3Ball7() {
        return num3Ball7;
    }

    public void setNum3Ball7(Float num3Ball7) {
        this.num3Ball7 = num3Ball7;
    }

    public Float getNum3Ball8() {
        return num3Ball8;
    }

    public void setNum3Ball8(Float num3Ball8) {
        this.num3Ball8 = num3Ball8;
    }

    public Float getNum3Ball9() {
        return num3Ball9;
    }

    public void setNum3Ball9(Float num3Ball9) {
        this.num3Ball9 = num3Ball9;
    }

    public Float getNum4Big() {
        return num4Big;
    }

    public void setNum4Big(Float num4Big) {
        this.num4Big = num4Big;
    }

    public Float getNum4Small() {
        return num4Small;
    }

    public void setNum4Small(Float num4Small) {
        this.num4Small = num4Small;
    }

    public Float getNum4Single() {
        return num4Single;
    }

    public void setNum4Single(Float num4Single) {
        this.num4Single = num4Single;
    }

    public Float getNum4Double() {
        return num4Double;
    }

    public void setNum4Double(Float num4Double) {
        this.num4Double = num4Double;
    }

    public Float getNum4Ball0() {
        return num4Ball0;
    }

    public void setNum4Ball0(Float num4Ball0) {
        this.num4Ball0 = num4Ball0;
    }

    public Float getNum4Ball1() {
        return num4Ball1;
    }

    public void setNum4Ball1(Float num4Ball1) {
        this.num4Ball1 = num4Ball1;
    }

    public Float getNum4Ball2() {
        return num4Ball2;
    }

    public void setNum4Ball2(Float num4Ball2) {
        this.num4Ball2 = num4Ball2;
    }

    public Float getNum4Ball3() {
        return num4Ball3;
    }

    public void setNum4Ball3(Float num4Ball3) {
        this.num4Ball3 = num4Ball3;
    }

    public Float getNum4Ball4() {
        return num4Ball4;
    }

    public void setNum4Ball4(Float num4Ball4) {
        this.num4Ball4 = num4Ball4;
    }

    public Float getNum4Ball5() {
        return num4Ball5;
    }

    public void setNum4Ball5(Float num4Ball5) {
        this.num4Ball5 = num4Ball5;
    }

    public Float getNum4Ball6() {
        return num4Ball6;
    }

    public void setNum4Ball6(Float num4Ball6) {
        this.num4Ball6 = num4Ball6;
    }

    public Float getNum4Ball7() {
        return num4Ball7;
    }

    public void setNum4Ball7(Float num4Ball7) {
        this.num4Ball7 = num4Ball7;
    }

    public Float getNum4Ball8() {
        return num4Ball8;
    }

    public void setNum4Ball8(Float num4Ball8) {
        this.num4Ball8 = num4Ball8;
    }

    public Float getNum4Ball9() {
        return num4Ball9;
    }

    public void setNum4Ball9(Float num4Ball9) {
        this.num4Ball9 = num4Ball9;
    }

    public Float getNum5Big() {
        return num5Big;
    }

    public void setNum5Big(Float num5Big) {
        this.num5Big = num5Big;
    }

    public Float getNum5Small() {
        return num5Small;
    }

    public void setNum5Small(Float num5Small) {
        this.num5Small = num5Small;
    }

    public Float getNum5Single() {
        return num5Single;
    }

    public void setNum5Single(Float num5Single) {
        this.num5Single = num5Single;
    }

    public Float getNum5Double() {
        return num5Double;
    }

    public void setNum5Double(Float num5Double) {
        this.num5Double = num5Double;
    }

    public Float getNum5Ball0() {
        return num5Ball0;
    }

    public void setNum5Ball0(Float num5Ball0) {
        this.num5Ball0 = num5Ball0;
    }

    public Float getNum5Ball1() {
        return num5Ball1;
    }

    public void setNum5Ball1(Float num5Ball1) {
        this.num5Ball1 = num5Ball1;
    }

    public Float getNum5Ball2() {
        return num5Ball2;
    }

    public void setNum5Ball2(Float num5Ball2) {
        this.num5Ball2 = num5Ball2;
    }

    public Float getNum5Ball3() {
        return num5Ball3;
    }

    public void setNum5Ball3(Float num5Ball3) {
        this.num5Ball3 = num5Ball3;
    }

    public Float getNum5Ball4() {
        return num5Ball4;
    }

    public void setNum5Ball4(Float num5Ball4) {
        this.num5Ball4 = num5Ball4;
    }

    public Float getNum5Ball5() {
        return num5Ball5;
    }

    public void setNum5Ball5(Float num5Ball5) {
        this.num5Ball5 = num5Ball5;
    }

    public Float getNum5Ball6() {
        return num5Ball6;
    }

    public void setNum5Ball6(Float num5Ball6) {
        this.num5Ball6 = num5Ball6;
    }

    public Float getNum5Ball7() {
        return num5Ball7;
    }

    public void setNum5Ball7(Float num5Ball7) {
        this.num5Ball7 = num5Ball7;
    }

    public Float getNum5Ball8() {
        return num5Ball8;
    }

    public void setNum5Ball8(Float num5Ball8) {
        this.num5Ball8 = num5Ball8;
    }

    public Float getNum5Ball9() {
        return num5Ball9;
    }

    public void setNum5Ball9(Float num5Ball9) {
        this.num5Ball9 = num5Ball9;
    }

    public Float getFirstBao() {
        return firstBao;
    }

    public void setFirstBao(Float firstBao) {
        this.firstBao = firstBao;
    }

    public Float getFirstDui() {
        return firstDui;
    }

    public void setFirstDui(Float firstDui) {
        this.firstDui = firstDui;
    }

    public Float getFirstSun() {
        return firstSun;
    }

    public void setFirstSun(Float firstSun) {
        this.firstSun = firstSun;
    }

    public Float getFirstBan() {
        return firstBan;
    }

    public void setFirstBan(Float firstBan) {
        this.firstBan = firstBan;
    }

    public Float getFirstZa() {
        return firstZa;
    }

    public void setFirstZa(Float firstZa) {
        this.firstZa = firstZa;
    }

    public Float getMidBao() {
        return midBao;
    }

    public void setMidBao(Float midBao) {
        this.midBao = midBao;
    }

    public Float getMidDui() {
        return midDui;
    }

    public void setMidDui(Float midDui) {
        this.midDui = midDui;
    }

    public Float getMidSun() {
        return midSun;
    }

    public void setMidSun(Float midSun) {
        this.midSun = midSun;
    }

    public Float getMidBan() {
        return midBan;
    }

    public void setMidBan(Float midBan) {
        this.midBan = midBan;
    }

    public Float getMidZa() {
        return midZa;
    }

    public void setMidZa(Float midZa) {
        this.midZa = midZa;
    }

    public Float getBackBao() {
        return backBao;
    }

    public void setBackBao(Float backBao) {
        this.backBao = backBao;
    }

    public Float getBackDui() {
        return backDui;
    }

    public void setBackDui(Float backDui) {
        this.backDui = backDui;
    }

    public Float getBackSun() {
        return backSun;
    }

    public void setBackSun(Float backSun) {
        this.backSun = backSun;
    }

    public Float getBackBan() {
        return backBan;
    }

    public void setBackBan(Float backBan) {
        this.backBan = backBan;
    }

    public Float getBackZa() {
        return backZa;
    }

    public void setBackZa(Float backZa) {
        this.backZa = backZa;
    }

    public Integer getNum1() {
        return num1;
    }

    public void setNum1(Integer num1) {
        this.num1 = num1;
    }

    public Integer getNum2() {
        return num2;
    }

    public void setNum2(Integer num2) {
        this.num2 = num2;
    }

    public Integer getNum3() {
        return num3;
    }

    public void setNum3(Integer num3) {
        this.num3 = num3;
    }

    public Integer getNum4() {
        return num4;
    }

    public void setNum4(Integer num4) {
        this.num4 = num4;
    }

    public Integer getNum5() {
        return num5;
    }

    public void setNum5(Integer num5) {
        this.num5 = num5;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getIsDeduct() {
        return isDeduct;
    }

    public void setIsDeduct(String isDeduct) {
        this.isDeduct = isDeduct;
    }

    public Integer getHouse() {
        return house;
    }

    public void setHouse(Integer house) {
        this.house = house;
    }

    public String getHzId() {
        return hzId;
    }

    public void setHzId(String hzId) {
        this.hzId = hzId;
    }

    public String getHzUser() {
        return hzUser;
    }

    public void setHzUser(String hzUser) {
        this.hzUser = hzUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("periods", getPeriods())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
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
            .append("num1Ball0", getNum1Ball0())
            .append("num1Ball1", getNum1Ball1())
            .append("num1Ball2", getNum1Ball2())
            .append("num1Ball3", getNum1Ball3())
            .append("num1Ball4", getNum1Ball4())
            .append("num1Ball5", getNum1Ball5())
            .append("num1Ball6", getNum1Ball6())
            .append("num1Ball7", getNum1Ball7())
            .append("num1Ball8", getNum1Ball8())
            .append("num1Ball9", getNum1Ball9())
            .append("num2Big", getNum2Big())
            .append("num2Small", getNum2Small())
            .append("num2Single", getNum2Single())
            .append("num2Double", getNum2Double())
            .append("num2Ball0", getNum2Ball0())
            .append("num2Ball1", getNum2Ball1())
            .append("num2Ball2", getNum2Ball2())
            .append("num2Ball3", getNum2Ball3())
            .append("num2Ball4", getNum2Ball4())
            .append("num2Ball5", getNum2Ball5())
            .append("num2Ball6", getNum2Ball6())
            .append("num2Ball7", getNum2Ball7())
            .append("num2Ball8", getNum2Ball8())
            .append("num2Ball9", getNum2Ball9())
            .append("num3Big", getNum3Big())
            .append("num3Small", getNum3Small())
            .append("num3Single", getNum3Single())
            .append("num3Double", getNum3Double())
            .append("num3Ball0", getNum3Ball0())
            .append("num3Ball1", getNum3Ball1())
            .append("num3Ball2", getNum3Ball2())
            .append("num3Ball3", getNum3Ball3())
            .append("num3Ball4", getNum3Ball4())
            .append("num3Ball5", getNum3Ball5())
            .append("num3Ball6", getNum3Ball6())
            .append("num3Ball7", getNum3Ball7())
            .append("num3Ball8", getNum3Ball8())
            .append("num3Ball9", getNum3Ball9())
            .append("num4Big", getNum4Big())
            .append("num4Small", getNum4Small())
            .append("num4Single", getNum4Single())
            .append("num4Double", getNum4Double())
            .append("num4Ball0", getNum4Ball0())
            .append("num4Ball1", getNum4Ball1())
            .append("num4Ball2", getNum4Ball2())
            .append("num4Ball3", getNum4Ball3())
            .append("num4Ball4", getNum4Ball4())
            .append("num4Ball5", getNum4Ball5())
            .append("num4Ball6", getNum4Ball6())
            .append("num4Ball7", getNum4Ball7())
            .append("num4Ball8", getNum4Ball8())
            .append("num4Ball9", getNum4Ball9())
            .append("num5Big", getNum5Big())
            .append("num5Small", getNum5Small())
            .append("num5Single", getNum5Single())
            .append("num5Double", getNum5Double())
            .append("num5Ball0", getNum5Ball0())
            .append("num5Ball1", getNum5Ball1())
            .append("num5Ball2", getNum5Ball2())
            .append("num5Ball3", getNum5Ball3())
            .append("num5Ball4", getNum5Ball4())
            .append("num5Ball5", getNum5Ball5())
            .append("num5Ball6", getNum5Ball6())
            .append("num5Ball7", getNum5Ball7())
            .append("num5Ball8", getNum5Ball8())
            .append("num5Ball9", getNum5Ball9())
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
