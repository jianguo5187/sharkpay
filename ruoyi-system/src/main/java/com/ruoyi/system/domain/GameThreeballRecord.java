package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 3球下注对象 game_threeball_record
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameThreeballRecord extends BaseEntity
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

    /** 下注大的金额 */
    @Excel(name = "下注大的金额")
    private Float big;

    /** 下注小的金额 */
    @Excel(name = "下注小的金额")
    private Float small;

    /** 下注单的金额 */
    @Excel(name = "下注单的金额")
    private Float single;

    /** 下注双的金额 */
    @Excel(name = "下注双的金额")
    private Float doubleAmount;

    /** 下注极大的金额 */
    @Excel(name = "下注极大的金额")
    private Float muchBig;

    /** 下注大单的金额 */
    @Excel(name = "下注大单的金额")
    private Float bigSingle;

    /** 下注小单的金额 */
    @Excel(name = "下注小单的金额")
    private Float smallSingle;

    /** 下注大双的金额 */
    @Excel(name = "下注大双的金额")
    private Float bigDouble;

    /** 下注小双的金额 */
    @Excel(name = "下注小双的金额")
    private Float smallDouble;

    /** 下注极小的金额 */
    @Excel(name = "下注极小的金额")
    private Float muchSmall;

    /** 下注数字0的金额 */
    @Excel(name = "下注数字0的金额")
    private Float num0;

    /** 下注数字1的金额 */
    @Excel(name = "下注数字1的金额")
    private Float num1;

    /** 下注数字2的金额 */
    @Excel(name = "下注数字2的金额")
    private Float num2;

    /** 下注数字3的金额 */
    @Excel(name = "下注数字3的金额")
    private Float num3;

    /** 下注数字4的金额 */
    @Excel(name = "下注数字4的金额")
    private Float num4;

    /** 下注数字5的金额 */
    @Excel(name = "下注数字5的金额")
    private Float num5;

    /** 下注数字6的金额 */
    @Excel(name = "下注数字6的金额")
    private Float num6;

    /** 下注数字7的金额 */
    @Excel(name = "下注数字7的金额")
    private Float num7;

    /** 下注数字8的金额 */
    @Excel(name = "下注数字8的金额")
    private Float num8;

    /** 下注数字9的金额 */
    @Excel(name = "下注数字9的金额")
    private Float num9;

    /** 下注数字10的金额 */
    @Excel(name = "下注数字10的金额")
    private Float num10;

    /** 下注数字11的金额 */
    @Excel(name = "下注数字11的金额")
    private Float num11;

    /** 下注数字12的金额 */
    @Excel(name = "下注数字12的金额")
    private Float num12;

    /** 下注数字13的金额 */
    @Excel(name = "下注数字13的金额")
    private Float num13;

    /** 下注数字14的金额 */
    @Excel(name = "下注数字14的金额")
    private Float num14;

    /** 下注数字15的金额 */
    @Excel(name = "下注数字15的金额")
    private Float num15;

    /** 下注数字16的金额 */
    @Excel(name = "下注数字16的金额")
    private Float num16;

    /** 下注数字17的金额 */
    @Excel(name = "下注数字17的金额")
    private Float num17;

    /** 下注数字18的金额 */
    @Excel(name = "下注数字18的金额")
    private Float num18;

    /** 下注数字19的金额 */
    @Excel(name = "下注数字19的金额")
    private Float num19;

    /** 下注数字20的金额 */
    @Excel(name = "下注数字20的金额")
    private Float num20;

    /** 下注数字21的金额 */
    @Excel(name = "下注数字21的金额")
    private Float num21;

    /** 下注数字22的金额 */
    @Excel(name = "下注数字22的金额")
    private Float num22;

    /** 下注数字23的金额 */
    @Excel(name = "下注数字23的金额")
    private Float num23;

    /** 下注数字24的金额 */
    @Excel(name = "下注数字24的金额")
    private Float num24;

    /** 下注数字25的金额 */
    @Excel(name = "下注数字25的金额")
    private Float num25;

    /** 下注数字26的金额 */
    @Excel(name = "下注数字26的金额")
    private Float num26;

    /** 下注数字27的金额 */
    @Excel(name = "下注数字27的金额")
    private Float num27;

    /** 下注红的金额 */
    @Excel(name = "下注红的金额")
    private Float red;

    /** 下注绿的金额 */
    @Excel(name = "下注绿的金额")
    private Float green;

    /** 下注蓝的金额 */
    @Excel(name = "下注蓝的金额")
    private Float blue;

    /** 下注龙的金额 */
    @Excel(name = "下注龙的金额")
    private Float loong;

    /** 下注虎的金额 */
    @Excel(name = "下注虎的金额")
    private Float tiger;

    /** 下注合的金额 */
    @Excel(name = "下注合的金额")
    private Float close;

    /** 下注豹子的金额 */
    @Excel(name = "下注豹子的金额")
    private Float leopard;

    /** 下注对子的金额 */
    @Excel(name = "下注对子的金额")
    private Float pairs;

    /** 下注顺子的金额 */
    @Excel(name = "下注顺子的金额")
    private Float shun;

    /** VIP房间 */
    @Excel(name = "VIP房间")
    private Integer vip;

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Integer n1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer n2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer n3;

    /** 开奖合算数字 */
    @Excel(name = "开奖合算数字")
    private Integer sumNum;

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

    public Float getBig() {
        return big;
    }

    public void setBig(Float big) {
        this.big = big;
    }

    public Float getSmall() {
        return small;
    }

    public void setSmall(Float small) {
        this.small = small;
    }

    public Float getSingle() {
        return single;
    }

    public void setSingle(Float single) {
        this.single = single;
    }

    public Float getDoubleAmount() {
        return doubleAmount;
    }

    public void setDoubleAmount(Float doubleAmount) {
        this.doubleAmount = doubleAmount;
    }

    public Float getMuchBig() {
        return muchBig;
    }

    public void setMuchBig(Float muchBig) {
        this.muchBig = muchBig;
    }

    public Float getBigSingle() {
        return bigSingle;
    }

    public void setBigSingle(Float bigSingle) {
        this.bigSingle = bigSingle;
    }

    public Float getSmallSingle() {
        return smallSingle;
    }

    public void setSmallSingle(Float smallSingle) {
        this.smallSingle = smallSingle;
    }

    public Float getBigDouble() {
        return bigDouble;
    }

    public void setBigDouble(Float bigDouble) {
        this.bigDouble = bigDouble;
    }

    public Float getSmallDouble() {
        return smallDouble;
    }

    public void setSmallDouble(Float smallDouble) {
        this.smallDouble = smallDouble;
    }

    public Float getMuchSmall() {
        return muchSmall;
    }

    public void setMuchSmall(Float muchSmall) {
        this.muchSmall = muchSmall;
    }

    public Float getNum0() {
        return num0;
    }

    public void setNum0(Float num0) {
        this.num0 = num0;
    }

    public Float getNum1() {
        return num1;
    }

    public void setNum1(Float num1) {
        this.num1 = num1;
    }

    public Float getNum2() {
        return num2;
    }

    public void setNum2(Float num2) {
        this.num2 = num2;
    }

    public Float getNum3() {
        return num3;
    }

    public void setNum3(Float num3) {
        this.num3 = num3;
    }

    public Float getNum4() {
        return num4;
    }

    public void setNum4(Float num4) {
        this.num4 = num4;
    }

    public Float getNum5() {
        return num5;
    }

    public void setNum5(Float num5) {
        this.num5 = num5;
    }

    public Float getNum6() {
        return num6;
    }

    public void setNum6(Float num6) {
        this.num6 = num6;
    }

    public Float getNum7() {
        return num7;
    }

    public void setNum7(Float num7) {
        this.num7 = num7;
    }

    public Float getNum8() {
        return num8;
    }

    public void setNum8(Float num8) {
        this.num8 = num8;
    }

    public Float getNum9() {
        return num9;
    }

    public void setNum9(Float num9) {
        this.num9 = num9;
    }

    public Float getNum10() {
        return num10;
    }

    public void setNum10(Float num10) {
        this.num10 = num10;
    }

    public Float getNum11() {
        return num11;
    }

    public void setNum11(Float num11) {
        this.num11 = num11;
    }

    public Float getNum12() {
        return num12;
    }

    public void setNum12(Float num12) {
        this.num12 = num12;
    }

    public Float getNum13() {
        return num13;
    }

    public void setNum13(Float num13) {
        this.num13 = num13;
    }

    public Float getNum14() {
        return num14;
    }

    public void setNum14(Float num14) {
        this.num14 = num14;
    }

    public Float getNum15() {
        return num15;
    }

    public void setNum15(Float num15) {
        this.num15 = num15;
    }

    public Float getNum16() {
        return num16;
    }

    public void setNum16(Float num16) {
        this.num16 = num16;
    }

    public Float getNum17() {
        return num17;
    }

    public void setNum17(Float num17) {
        this.num17 = num17;
    }

    public Float getNum18() {
        return num18;
    }

    public void setNum18(Float num18) {
        this.num18 = num18;
    }

    public Float getNum19() {
        return num19;
    }

    public void setNum19(Float num19) {
        this.num19 = num19;
    }

    public Float getNum20() {
        return num20;
    }

    public void setNum20(Float num20) {
        this.num20 = num20;
    }

    public Float getNum21() {
        return num21;
    }

    public void setNum21(Float num21) {
        this.num21 = num21;
    }

    public Float getNum22() {
        return num22;
    }

    public void setNum22(Float num22) {
        this.num22 = num22;
    }

    public Float getNum23() {
        return num23;
    }

    public void setNum23(Float num23) {
        this.num23 = num23;
    }

    public Float getNum24() {
        return num24;
    }

    public void setNum24(Float num24) {
        this.num24 = num24;
    }

    public Float getNum25() {
        return num25;
    }

    public void setNum25(Float num25) {
        this.num25 = num25;
    }

    public Float getNum26() {
        return num26;
    }

    public void setNum26(Float num26) {
        this.num26 = num26;
    }

    public Float getNum27() {
        return num27;
    }

    public void setNum27(Float num27) {
        this.num27 = num27;
    }

    public Float getRed() {
        return red;
    }

    public void setRed(Float red) {
        this.red = red;
    }

    public Float getGreen() {
        return green;
    }

    public void setGreen(Float green) {
        this.green = green;
    }

    public Float getBlue() {
        return blue;
    }

    public void setBlue(Float blue) {
        this.blue = blue;
    }

    public Float getLoong() {
        return loong;
    }

    public void setLoong(Float loong) {
        this.loong = loong;
    }

    public Float getTiger() {
        return tiger;
    }

    public void setTiger(Float tiger) {
        this.tiger = tiger;
    }

    public Float getClose() {
        return close;
    }

    public void setClose(Float close) {
        this.close = close;
    }

    public Float getLeopard() {
        return leopard;
    }

    public void setLeopard(Float leopard) {
        this.leopard = leopard;
    }

    public Float getPairs() {
        return pairs;
    }

    public void setPairs(Float pairs) {
        this.pairs = pairs;
    }

    public Float getShun() {
        return shun;
    }

    public void setShun(Float shun) {
        this.shun = shun;
    }

    public Integer getVip() {
        return vip;
    }

    public void setVip(Integer vip) {
        this.vip = vip;
    }

    public Integer getN1() {
        return n1;
    }

    public void setN1(Integer n1) {
        this.n1 = n1;
    }

    public Integer getN2() {
        return n2;
    }

    public void setN2(Integer n2) {
        this.n2 = n2;
    }

    public Integer getN3() {
        return n3;
    }

    public void setN3(Integer n3) {
        this.n3 = n3;
    }

    public Integer getSumNum() {
        return sumNum;
    }

    public void setSumNum(Integer sumNum) {
        this.sumNum = sumNum;
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
