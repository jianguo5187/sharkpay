package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 澳洲幸运10下注对象 azxy10record
 * 
 * @author ruoyi
 * @date 2024-03-23
 */
public class Azxy10record extends BaseEntity
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
    private BigDecimal countMoney;

    /** 中奖金额 */
    @Excel(name = "中奖金额")
    private BigDecimal winMoney;

    /** 下注冠亚和大的金额 */
    @Excel(name = "下注冠亚和大的金额")
    private BigDecimal type1Big;

    /** 下注冠亚和小的金额 */
    @Excel(name = "下注冠亚和小的金额")
    private BigDecimal type1Small;

    /** 下注冠亚和单的金额 */
    @Excel(name = "下注冠亚和单的金额")
    private BigDecimal type1Single;

    /** 下注冠亚和双的金额 */
    @Excel(name = "下注冠亚和双的金额")
    private BigDecimal type1Double;

    /** 下注冠亚和3的金额 */
    @Excel(name = "下注冠亚和3的金额")
    private BigDecimal type1Num3;

    /** 下注冠亚和4的金额 */
    @Excel(name = "下注冠亚和4的金额")
    private BigDecimal type1Num4;

    /** 下注冠亚和5的金额 */
    @Excel(name = "下注冠亚和5的金额")
    private BigDecimal type1Num5;

    /** 下注冠亚和6的金额 */
    @Excel(name = "下注冠亚和6的金额")
    private BigDecimal type1Num6;

    /** 下注冠亚和7的金额 */
    @Excel(name = "下注冠亚和7的金额")
    private BigDecimal type1Num7;

    /** 下注冠亚和8的金额 */
    @Excel(name = "下注冠亚和8的金额")
    private BigDecimal type1Num8;

    /** 下注冠亚和9的金额 */
    @Excel(name = "下注冠亚和9的金额")
    private BigDecimal type1Num9;

    /** 下注冠亚和10的金额 */
    @Excel(name = "下注冠亚和10的金额")
    private BigDecimal type1Num10;

    /** 下注冠亚和11的金额 */
    @Excel(name = "下注冠亚和11的金额")
    private BigDecimal type1Num11;

    /** 下注冠亚和12的金额 */
    @Excel(name = "下注冠亚和12的金额")
    private BigDecimal type1Num12;

    /** 下注冠亚和13的金额 */
    @Excel(name = "下注冠亚和13的金额")
    private BigDecimal type1Num13;

    /** 下注冠亚和14的金额 */
    @Excel(name = "下注冠亚和14的金额")
    private BigDecimal type1Num14;

    /** 下注冠亚和15的金额 */
    @Excel(name = "下注冠亚和15的金额")
    private BigDecimal type1Num15;

    /** 下注冠亚和16的金额 */
    @Excel(name = "下注冠亚和16的金额")
    private BigDecimal type1Num16;

    /** 下注冠亚和17的金额 */
    @Excel(name = "下注冠亚和17的金额")
    private BigDecimal type1Num17;

    /** 下注冠亚和18的金额 */
    @Excel(name = "下注冠亚和18的金额")
    private BigDecimal type1Num18;

    /** 下注冠亚和19的金额 */
    @Excel(name = "下注冠亚和19的金额")
    private BigDecimal type1Num19;

    /** 下注冠军大的金额 */
    @Excel(name = "下注冠军大的金额")
    private BigDecimal type2Big;

    /** 下注冠军小的金额 */
    @Excel(name = "下注冠军小的金额")
    private BigDecimal type2Small;

    /** 下注冠军单的金额 */
    @Excel(name = "下注冠军单的金额")
    private BigDecimal type2Single;

    /** 下注冠军双的金额 */
    @Excel(name = "下注冠军双的金额")
    private BigDecimal type2Double;

    /** 下注冠军龙的金额 */
    @Excel(name = "下注冠军龙的金额")
    private BigDecimal type2Loong;

    /** 下注冠军虎的金额 */
    @Excel(name = "下注冠军虎的金额")
    private BigDecimal type2Tiger;

    /** 下注冠军1的金额 */
    @Excel(name = "下注冠军1的金额")
    private BigDecimal type2Num1;

    /** 下注冠军2的金额 */
    @Excel(name = "下注冠军2的金额")
    private BigDecimal type2Num2;

    /** 下注冠军3的金额 */
    @Excel(name = "下注冠军3的金额")
    private BigDecimal type2Num3;

    /** 下注冠军4的金额 */
    @Excel(name = "下注冠军4的金额")
    private BigDecimal type2Num4;

    /** 下注冠军5的金额 */
    @Excel(name = "下注冠军5的金额")
    private BigDecimal type2Num5;

    /** 下注冠军6的金额 */
    @Excel(name = "下注冠军6的金额")
    private BigDecimal type2Num6;

    /** 下注冠军7的金额 */
    @Excel(name = "下注冠军7的金额")
    private BigDecimal type2Num7;

    /** 下注冠军8的金额 */
    @Excel(name = "下注冠军8的金额")
    private BigDecimal type2Num8;

    /** 下注冠军9的金额 */
    @Excel(name = "下注冠军9的金额")
    private BigDecimal type2Num9;

    /** 下注冠军10的金额 */
    @Excel(name = "下注冠军10的金额")
    private BigDecimal type2Num10;

    /** 下注亚军大的金额 */
    @Excel(name = "下注亚军大的金额")
    private BigDecimal type3Big;

    /** 下注亚军小的金额 */
    @Excel(name = "下注亚军小的金额")
    private BigDecimal type3Small;

    /** 下注亚军单的金额 */
    @Excel(name = "下注亚军单的金额")
    private BigDecimal type3Single;

    /** 下注亚军双的金额 */
    @Excel(name = "下注亚军双的金额")
    private BigDecimal type3Double;

    /** 下注亚军龙的金额 */
    @Excel(name = "下注亚军龙的金额")
    private BigDecimal type3Loong;

    /** 下注亚军虎的金额 */
    @Excel(name = "下注亚军虎的金额")
    private BigDecimal type3Tiger;

    /** 下注亚军1的金额 */
    @Excel(name = "下注亚军1的金额")
    private BigDecimal type3Num1;

    /** 下注亚军2的金额 */
    @Excel(name = "下注亚军2的金额")
    private BigDecimal type3Num2;

    /** 下注亚军3的金额 */
    @Excel(name = "下注亚军3的金额")
    private BigDecimal type3Num3;

    /** 下注亚军4的金额 */
    @Excel(name = "下注亚军4的金额")
    private BigDecimal type3Num4;

    /** 下注亚军5的金额 */
    @Excel(name = "下注亚军5的金额")
    private BigDecimal type3Num5;

    /** 下注亚军6的金额 */
    @Excel(name = "下注亚军6的金额")
    private BigDecimal type3Num6;

    /** 下注亚军7的金额 */
    @Excel(name = "下注亚军7的金额")
    private BigDecimal type3Num7;

    /** 下注亚军8的金额 */
    @Excel(name = "下注亚军8的金额")
    private BigDecimal type3Num8;

    /** 下注亚军9的金额 */
    @Excel(name = "下注亚军9的金额")
    private BigDecimal type3Num9;

    /** 下注亚军10的金额 */
    @Excel(name = "下注亚军10的金额")
    private BigDecimal type3Num10;

    /** 下注第三名大的金额 */
    @Excel(name = "下注第三名大的金额")
    private BigDecimal type4Big;

    /** 下注第三名小的金额 */
    @Excel(name = "下注第三名小的金额")
    private BigDecimal type4Small;

    /** 下注第三名单的金额 */
    @Excel(name = "下注第三名单的金额")
    private BigDecimal type4Single;

    /** 下注第三名双的金额 */
    @Excel(name = "下注第三名双的金额")
    private BigDecimal type4Double;

    /** 下注第三名龙的金额 */
    @Excel(name = "下注第三名龙的金额")
    private BigDecimal type4Loong;

    /** 下注第三名虎的金额 */
    @Excel(name = "下注第三名虎的金额")
    private BigDecimal type4Tiger;

    /** 下注第三名1的金额 */
    @Excel(name = "下注第三名1的金额")
    private BigDecimal type4Num1;

    /** 下注第三名2的金额 */
    @Excel(name = "下注第三名2的金额")
    private BigDecimal type4Num2;

    /** 下注第三名3的金额 */
    @Excel(name = "下注第三名3的金额")
    private BigDecimal type4Num3;

    /** 下注第三名4的金额 */
    @Excel(name = "下注第三名4的金额")
    private BigDecimal type4Num4;

    /** 下注第三名5的金额 */
    @Excel(name = "下注第三名5的金额")
    private BigDecimal type4Num5;

    /** 下注第三名6的金额 */
    @Excel(name = "下注第三名6的金额")
    private BigDecimal type4Num6;

    /** 下注第三名7的金额 */
    @Excel(name = "下注第三名7的金额")
    private BigDecimal type4Num7;

    /** 下注第三名8的金额 */
    @Excel(name = "下注第三名8的金额")
    private BigDecimal type4Num8;

    /** 下注第三名9的金额 */
    @Excel(name = "下注第三名9的金额")
    private BigDecimal type4Num9;

    /** 下注第三名10的金额 */
    @Excel(name = "下注第三名10的金额")
    private BigDecimal type4Num10;

    /** 下注第四名大的金额 */
    @Excel(name = "下注第四名大的金额")
    private BigDecimal type5Big;

    /** 下注第四名小的金额 */
    @Excel(name = "下注第四名小的金额")
    private BigDecimal type5Small;

    /** 下注第四名单的金额 */
    @Excel(name = "下注第四名单的金额")
    private BigDecimal type5Single;

    /** 下注第四名双的金额 */
    @Excel(name = "下注第四名双的金额")
    private BigDecimal type5Double;

    /** 下注第四名龙的金额 */
    @Excel(name = "下注第四名龙的金额")
    private BigDecimal type5Loong;

    /** 下注第四名虎的金额 */
    @Excel(name = "下注第四名虎的金额")
    private BigDecimal type5Tiger;

    /** 下注第四名1的金额 */
    @Excel(name = "下注第四名1的金额")
    private BigDecimal type5Num1;

    /** 下注第四名2的金额 */
    @Excel(name = "下注第四名2的金额")
    private BigDecimal type5Num2;

    /** 下注第四名3的金额 */
    @Excel(name = "下注第四名3的金额")
    private BigDecimal type5Num3;

    /** 下注第四名4的金额 */
    @Excel(name = "下注第四名4的金额")
    private BigDecimal type5Num4;

    /** 下注第四名5的金额 */
    @Excel(name = "下注第四名5的金额")
    private BigDecimal type5Num5;

    /** 下注第四名6的金额 */
    @Excel(name = "下注第四名6的金额")
    private BigDecimal type5Num6;

    /** 下注第四名7的金额 */
    @Excel(name = "下注第四名7的金额")
    private BigDecimal type5Num7;

    /** 下注第四名8的金额 */
    @Excel(name = "下注第四名8的金额")
    private BigDecimal type5Num8;

    /** 下注第四名9的金额 */
    @Excel(name = "下注第四名9的金额")
    private BigDecimal type5Num9;

    /** 下注第四名10的金额 */
    @Excel(name = "下注第四名10的金额")
    private BigDecimal type5Num10;

    /** 下注第五名大的金额 */
    @Excel(name = "下注第五名大的金额")
    private BigDecimal type6Big;

    /** 下注第五名小的金额 */
    @Excel(name = "下注第五名小的金额")
    private BigDecimal type6Small;

    /** 下注第五名单的金额 */
    @Excel(name = "下注第五名单的金额")
    private BigDecimal type6Single;

    /** 下注第五名双的金额 */
    @Excel(name = "下注第五名双的金额")
    private BigDecimal type6Double;

    /** 下注第五名龙的金额 */
    @Excel(name = "下注第五名龙的金额")
    private BigDecimal type6Loong;

    /** 下注第五名虎的金额 */
    @Excel(name = "下注第五名虎的金额")
    private BigDecimal type6Tiger;

    /** 下注第五名1的金额 */
    @Excel(name = "下注第五名1的金额")
    private BigDecimal type6Num1;

    /** 下注第五名2的金额 */
    @Excel(name = "下注第五名2的金额")
    private BigDecimal type6Num2;

    /** 下注第五名3的金额 */
    @Excel(name = "下注第五名3的金额")
    private BigDecimal type6Num3;

    /** 下注第五名4的金额 */
    @Excel(name = "下注第五名4的金额")
    private BigDecimal type6Num4;

    /** 下注第五名5的金额 */
    @Excel(name = "下注第五名5的金额")
    private BigDecimal type6Num5;

    /** 下注第五名6的金额 */
    @Excel(name = "下注第五名6的金额")
    private BigDecimal type6Num6;

    /** 下注第五名7的金额 */
    @Excel(name = "下注第五名7的金额")
    private BigDecimal type6Num7;

    /** 下注第五名8的金额 */
    @Excel(name = "下注第五名8的金额")
    private BigDecimal type6Num8;

    /** 下注第五名9的金额 */
    @Excel(name = "下注第五名9的金额")
    private BigDecimal type6Num9;

    /** 下注第五名10的金额 */
    @Excel(name = "下注第五名10的金额")
    private BigDecimal type6Num10;

    /** 下注第六名大的金额 */
    @Excel(name = "下注第六名大的金额")
    private BigDecimal type7Big;

    /** 下注第六名小的金额 */
    @Excel(name = "下注第六名小的金额")
    private BigDecimal type7Small;

    /** 下注第六名单的金额 */
    @Excel(name = "下注第六名单的金额")
    private BigDecimal type7Single;

    /** 下注第六名双的金额 */
    @Excel(name = "下注第六名双的金额")
    private BigDecimal type7Double;

    /** 下注第六名龙的金额 */
    @Excel(name = "下注第六名龙的金额")
    private BigDecimal type7Loong;

    /** 下注第六名虎的金额 */
    @Excel(name = "下注第六名虎的金额")
    private BigDecimal type7Tiger;

    /** 下注第六名1的金额 */
    @Excel(name = "下注第六名1的金额")
    private BigDecimal type7Num1;

    /** 下注第六名2的金额 */
    @Excel(name = "下注第六名2的金额")
    private BigDecimal type7Num2;

    /** 下注第六名3的金额 */
    @Excel(name = "下注第六名3的金额")
    private BigDecimal type7Num3;

    /** 下注第六名4的金额 */
    @Excel(name = "下注第六名4的金额")
    private BigDecimal type7Num4;

    /** 下注第六名5的金额 */
    @Excel(name = "下注第六名5的金额")
    private BigDecimal type7Num5;

    /** 下注第六名6的金额 */
    @Excel(name = "下注第六名6的金额")
    private BigDecimal type7Num6;

    /** 下注第六名7的金额 */
    @Excel(name = "下注第六名7的金额")
    private BigDecimal type7Num7;

    /** 下注第六名8的金额 */
    @Excel(name = "下注第六名8的金额")
    private BigDecimal type7Num8;

    /** 下注第六名9的金额 */
    @Excel(name = "下注第六名9的金额")
    private BigDecimal type7Num9;

    /** 下注第六名10的金额 */
    @Excel(name = "下注第六名10的金额")
    private BigDecimal type7Num10;

    /** 下注第七名大的金额 */
    @Excel(name = "下注第七名大的金额")
    private BigDecimal type8Big;

    /** 下注第七名小的金额 */
    @Excel(name = "下注第七名小的金额")
    private BigDecimal type8Small;

    /** 下注第七名单的金额 */
    @Excel(name = "下注第七名单的金额")
    private BigDecimal type8Single;

    /** 下注第七名双的金额 */
    @Excel(name = "下注第七名双的金额")
    private BigDecimal type8Double;

    /** 下注第七名龙的金额 */
    @Excel(name = "下注第七名龙的金额")
    private BigDecimal type8Loong;

    /** 下注第七名虎的金额 */
    @Excel(name = "下注第七名虎的金额")
    private BigDecimal type8Tiger;

    /** 下注第七名1的金额 */
    @Excel(name = "下注第七名1的金额")
    private BigDecimal type8Num1;

    /** 下注第七名2的金额 */
    @Excel(name = "下注第七名2的金额")
    private BigDecimal type8Num2;

    /** 下注第七名3的金额 */
    @Excel(name = "下注第七名3的金额")
    private BigDecimal type8Num3;

    /** 下注第七名4的金额 */
    @Excel(name = "下注第七名4的金额")
    private BigDecimal type8Num4;

    /** 下注第七名5的金额 */
    @Excel(name = "下注第七名5的金额")
    private BigDecimal type8Num5;

    /** 下注第七名6的金额 */
    @Excel(name = "下注第七名6的金额")
    private BigDecimal type8Num6;

    /** 下注第七名7的金额 */
    @Excel(name = "下注第七名7的金额")
    private BigDecimal type8Num7;

    /** 下注第七名8的金额 */
    @Excel(name = "下注第七名8的金额")
    private BigDecimal type8Num8;

    /** 下注第七名9的金额 */
    @Excel(name = "下注第七名9的金额")
    private BigDecimal type8Num9;

    /** 下注第七名10的金额 */
    @Excel(name = "下注第七名10的金额")
    private BigDecimal type8Num10;

    /** 下注第八名大的金额 */
    @Excel(name = "下注第八名大的金额")
    private BigDecimal type9Big;

    /** 下注第八名小的金额 */
    @Excel(name = "下注第八名小的金额")
    private BigDecimal type9Small;

    /** 下注第八名单的金额 */
    @Excel(name = "下注第八名单的金额")
    private BigDecimal type9Single;

    /** 下注第八名双的金额 */
    @Excel(name = "下注第八名双的金额")
    private BigDecimal type9Double;

    /** 下注第八名龙的金额 */
    @Excel(name = "下注第八名龙的金额")
    private BigDecimal type9Loong;

    /** 下注第八名虎的金额 */
    @Excel(name = "下注第八名虎的金额")
    private BigDecimal type9Tiger;

    /** 下注第八名1的金额 */
    @Excel(name = "下注第八名1的金额")
    private BigDecimal type9Num1;

    /** 下注第八名2的金额 */
    @Excel(name = "下注第八名2的金额")
    private BigDecimal type9Num2;

    /** 下注第八名3的金额 */
    @Excel(name = "下注第八名3的金额")
    private BigDecimal type9Num3;

    /** 下注第八名4的金额 */
    @Excel(name = "下注第八名4的金额")
    private BigDecimal type9Num4;

    /** 下注第八名5的金额 */
    @Excel(name = "下注第八名5的金额")
    private BigDecimal type9Num5;

    /** 下注第八名6的金额 */
    @Excel(name = "下注第八名6的金额")
    private BigDecimal type9Num6;

    /** 下注第八名7的金额 */
    @Excel(name = "下注第八名7的金额")
    private BigDecimal type9Num7;

    /** 下注第八名8的金额 */
    @Excel(name = "下注第八名8的金额")
    private BigDecimal type9Num8;

    /** 下注第八名9的金额 */
    @Excel(name = "下注第八名9的金额")
    private BigDecimal type9Num9;

    /** 下注第八名10的金额 */
    @Excel(name = "下注第八名10的金额")
    private BigDecimal type9Num10;

    /** 下注第九名大的金额 */
    @Excel(name = "下注第九名大的金额")
    private BigDecimal type10Big;

    /** 下注第九名小的金额 */
    @Excel(name = "下注第九名小的金额")
    private BigDecimal type10Small;

    /** 下注第九名单的金额 */
    @Excel(name = "下注第九名单的金额")
    private BigDecimal type10Single;

    /** 下注第九名双的金额 */
    @Excel(name = "下注第九名双的金额")
    private BigDecimal type10Double;

    /** 下注第九名龙的金额 */
    @Excel(name = "下注第九名龙的金额")
    private BigDecimal type10Loong;

    /** 下注第九名虎的金额 */
    @Excel(name = "下注第九名虎的金额")
    private BigDecimal type10Tiger;

    /** 下注第九名1的金额 */
    @Excel(name = "下注第九名1的金额")
    private BigDecimal type10Num1;

    /** 下注第九名2的金额 */
    @Excel(name = "下注第九名2的金额")
    private BigDecimal type10Num2;

    /** 下注第九名3的金额 */
    @Excel(name = "下注第九名3的金额")
    private BigDecimal type10Num3;

    /** 下注第九名4的金额 */
    @Excel(name = "下注第九名4的金额")
    private BigDecimal type10Num4;

    /** 下注第九名5的金额 */
    @Excel(name = "下注第九名5的金额")
    private BigDecimal type10Num5;

    /** 下注第九名6的金额 */
    @Excel(name = "下注第九名6的金额")
    private BigDecimal type10Num6;

    /** 下注第九名7的金额 */
    @Excel(name = "下注第九名7的金额")
    private BigDecimal type10Num7;

    /** 下注第九名8的金额 */
    @Excel(name = "下注第九名8的金额")
    private BigDecimal type10Num8;

    /** 下注第九名9的金额 */
    @Excel(name = "下注第九名9的金额")
    private BigDecimal type10Num9;

    /** 下注第九名10的金额 */
    @Excel(name = "下注第九名10的金额")
    private BigDecimal type10Num10;

    /** 下注第十名大的金额 */
    @Excel(name = "下注第十名大的金额")
    private BigDecimal type11Big;

    /** 下注第十名小的金额 */
    @Excel(name = "下注第十名小的金额")
    private BigDecimal type11Small;

    /** 下注第十名单的金额 */
    @Excel(name = "下注第十名单的金额")
    private BigDecimal type11Single;

    /** 下注第十名双的金额 */
    @Excel(name = "下注第十名双的金额")
    private BigDecimal type11Double;

    /** 下注第十名龙的金额 */
    @Excel(name = "下注第十名龙的金额")
    private BigDecimal type11Loong;

    /** 下注第十名虎的金额 */
    @Excel(name = "下注第十名虎的金额")
    private BigDecimal type11Tiger;

    /** 下注第十名1的金额 */
    @Excel(name = "下注第十名1的金额")
    private BigDecimal type11Num1;

    /** 下注第十名2的金额 */
    @Excel(name = "下注第十名2的金额")
    private BigDecimal type11Num2;

    /** 下注第十名3的金额 */
    @Excel(name = "下注第十名3的金额")
    private BigDecimal type11Num3;

    /** 下注第十名4的金额 */
    @Excel(name = "下注第十名4的金额")
    private BigDecimal type11Num4;

    /** 下注第十名5的金额 */
    @Excel(name = "下注第十名5的金额")
    private BigDecimal type11Num5;

    /** 下注第十名6的金额 */
    @Excel(name = "下注第十名6的金额")
    private BigDecimal type11Num6;

    /** 下注第十名7的金额 */
    @Excel(name = "下注第十名7的金额")
    private BigDecimal type11Num7;

    /** 下注第十名8的金额 */
    @Excel(name = "下注第十名8的金额")
    private BigDecimal type11Num8;

    /** 下注第十名9的金额 */
    @Excel(name = "下注第十名9的金额")
    private BigDecimal type11Num9;

    /** 下注第十名10的金额 */
    @Excel(name = "下注第十名10的金额")
    private BigDecimal type11Num10;

    /** 下注大单的金额 */
    @Excel(name = "下注大单的金额")
    private BigDecimal bigSingle;

    /** 下注大双的金额 */
    @Excel(name = "下注大双的金额")
    private BigDecimal bigDouble;

    /** 下注小单的金额 */
    @Excel(name = "下注小单的金额")
    private BigDecimal smallSingle;

    /** 下注小双的金额 */
    @Excel(name = "下注小双的金额")
    private BigDecimal smallDouble;

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

    /** 开奖合算数字 */
    @Excel(name = "开奖合算数字")
    private Long sumNum;

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
    public void setType1Big(BigDecimal type1Big) 
    {
        this.type1Big = type1Big;
    }

    public BigDecimal getType1Big() 
    {
        return type1Big;
    }
    public void setType1Small(BigDecimal type1Small) 
    {
        this.type1Small = type1Small;
    }

    public BigDecimal getType1Small() 
    {
        return type1Small;
    }
    public void setType1Single(BigDecimal type1Single) 
    {
        this.type1Single = type1Single;
    }

    public BigDecimal getType1Single() 
    {
        return type1Single;
    }
    public void setType1Double(BigDecimal type1Double) 
    {
        this.type1Double = type1Double;
    }

    public BigDecimal getType1Double() 
    {
        return type1Double;
    }
    public void setType1Num3(BigDecimal type1Num3) 
    {
        this.type1Num3 = type1Num3;
    }

    public BigDecimal getType1Num3() 
    {
        return type1Num3;
    }
    public void setType1Num4(BigDecimal type1Num4) 
    {
        this.type1Num4 = type1Num4;
    }

    public BigDecimal getType1Num4() 
    {
        return type1Num4;
    }
    public void setType1Num5(BigDecimal type1Num5) 
    {
        this.type1Num5 = type1Num5;
    }

    public BigDecimal getType1Num5() 
    {
        return type1Num5;
    }
    public void setType1Num6(BigDecimal type1Num6) 
    {
        this.type1Num6 = type1Num6;
    }

    public BigDecimal getType1Num6() 
    {
        return type1Num6;
    }
    public void setType1Num7(BigDecimal type1Num7) 
    {
        this.type1Num7 = type1Num7;
    }

    public BigDecimal getType1Num7() 
    {
        return type1Num7;
    }
    public void setType1Num8(BigDecimal type1Num8) 
    {
        this.type1Num8 = type1Num8;
    }

    public BigDecimal getType1Num8() 
    {
        return type1Num8;
    }
    public void setType1Num9(BigDecimal type1Num9) 
    {
        this.type1Num9 = type1Num9;
    }

    public BigDecimal getType1Num9() 
    {
        return type1Num9;
    }
    public void setType1Num10(BigDecimal type1Num10) 
    {
        this.type1Num10 = type1Num10;
    }

    public BigDecimal getType1Num10() 
    {
        return type1Num10;
    }
    public void setType1Num11(BigDecimal type1Num11) 
    {
        this.type1Num11 = type1Num11;
    }

    public BigDecimal getType1Num11() 
    {
        return type1Num11;
    }
    public void setType1Num12(BigDecimal type1Num12) 
    {
        this.type1Num12 = type1Num12;
    }

    public BigDecimal getType1Num12() 
    {
        return type1Num12;
    }
    public void setType1Num13(BigDecimal type1Num13) 
    {
        this.type1Num13 = type1Num13;
    }

    public BigDecimal getType1Num13() 
    {
        return type1Num13;
    }
    public void setType1Num14(BigDecimal type1Num14) 
    {
        this.type1Num14 = type1Num14;
    }

    public BigDecimal getType1Num14() 
    {
        return type1Num14;
    }
    public void setType1Num15(BigDecimal type1Num15) 
    {
        this.type1Num15 = type1Num15;
    }

    public BigDecimal getType1Num15() 
    {
        return type1Num15;
    }
    public void setType1Num16(BigDecimal type1Num16) 
    {
        this.type1Num16 = type1Num16;
    }

    public BigDecimal getType1Num16() 
    {
        return type1Num16;
    }
    public void setType1Num17(BigDecimal type1Num17) 
    {
        this.type1Num17 = type1Num17;
    }

    public BigDecimal getType1Num17() 
    {
        return type1Num17;
    }
    public void setType1Num18(BigDecimal type1Num18) 
    {
        this.type1Num18 = type1Num18;
    }

    public BigDecimal getType1Num18() 
    {
        return type1Num18;
    }
    public void setType1Num19(BigDecimal type1Num19) 
    {
        this.type1Num19 = type1Num19;
    }

    public BigDecimal getType1Num19() 
    {
        return type1Num19;
    }
    public void setType2Big(BigDecimal type2Big) 
    {
        this.type2Big = type2Big;
    }

    public BigDecimal getType2Big() 
    {
        return type2Big;
    }
    public void setType2Small(BigDecimal type2Small) 
    {
        this.type2Small = type2Small;
    }

    public BigDecimal getType2Small() 
    {
        return type2Small;
    }
    public void setType2Single(BigDecimal type2Single) 
    {
        this.type2Single = type2Single;
    }

    public BigDecimal getType2Single() 
    {
        return type2Single;
    }
    public void setType2Double(BigDecimal type2Double) 
    {
        this.type2Double = type2Double;
    }

    public BigDecimal getType2Double() 
    {
        return type2Double;
    }
    public void setType2Loong(BigDecimal type2Loong) 
    {
        this.type2Loong = type2Loong;
    }

    public BigDecimal getType2Loong() 
    {
        return type2Loong;
    }
    public void setType2Tiger(BigDecimal type2Tiger) 
    {
        this.type2Tiger = type2Tiger;
    }

    public BigDecimal getType2Tiger() 
    {
        return type2Tiger;
    }
    public void setType2Num1(BigDecimal type2Num1) 
    {
        this.type2Num1 = type2Num1;
    }

    public BigDecimal getType2Num1() 
    {
        return type2Num1;
    }
    public void setType2Num2(BigDecimal type2Num2) 
    {
        this.type2Num2 = type2Num2;
    }

    public BigDecimal getType2Num2() 
    {
        return type2Num2;
    }
    public void setType2Num3(BigDecimal type2Num3) 
    {
        this.type2Num3 = type2Num3;
    }

    public BigDecimal getType2Num3() 
    {
        return type2Num3;
    }
    public void setType2Num4(BigDecimal type2Num4) 
    {
        this.type2Num4 = type2Num4;
    }

    public BigDecimal getType2Num4() 
    {
        return type2Num4;
    }
    public void setType2Num5(BigDecimal type2Num5) 
    {
        this.type2Num5 = type2Num5;
    }

    public BigDecimal getType2Num5() 
    {
        return type2Num5;
    }
    public void setType2Num6(BigDecimal type2Num6) 
    {
        this.type2Num6 = type2Num6;
    }

    public BigDecimal getType2Num6() 
    {
        return type2Num6;
    }
    public void setType2Num7(BigDecimal type2Num7) 
    {
        this.type2Num7 = type2Num7;
    }

    public BigDecimal getType2Num7() 
    {
        return type2Num7;
    }
    public void setType2Num8(BigDecimal type2Num8) 
    {
        this.type2Num8 = type2Num8;
    }

    public BigDecimal getType2Num8() 
    {
        return type2Num8;
    }
    public void setType2Num9(BigDecimal type2Num9) 
    {
        this.type2Num9 = type2Num9;
    }

    public BigDecimal getType2Num9() 
    {
        return type2Num9;
    }
    public void setType2Num10(BigDecimal type2Num10) 
    {
        this.type2Num10 = type2Num10;
    }

    public BigDecimal getType2Num10() 
    {
        return type2Num10;
    }
    public void setType3Big(BigDecimal type3Big) 
    {
        this.type3Big = type3Big;
    }

    public BigDecimal getType3Big() 
    {
        return type3Big;
    }
    public void setType3Small(BigDecimal type3Small) 
    {
        this.type3Small = type3Small;
    }

    public BigDecimal getType3Small() 
    {
        return type3Small;
    }
    public void setType3Single(BigDecimal type3Single) 
    {
        this.type3Single = type3Single;
    }

    public BigDecimal getType3Single() 
    {
        return type3Single;
    }
    public void setType3Double(BigDecimal type3Double) 
    {
        this.type3Double = type3Double;
    }

    public BigDecimal getType3Double() 
    {
        return type3Double;
    }
    public void setType3Loong(BigDecimal type3Loong) 
    {
        this.type3Loong = type3Loong;
    }

    public BigDecimal getType3Loong() 
    {
        return type3Loong;
    }
    public void setType3Tiger(BigDecimal type3Tiger) 
    {
        this.type3Tiger = type3Tiger;
    }

    public BigDecimal getType3Tiger() 
    {
        return type3Tiger;
    }
    public void setType3Num1(BigDecimal type3Num1) 
    {
        this.type3Num1 = type3Num1;
    }

    public BigDecimal getType3Num1() 
    {
        return type3Num1;
    }
    public void setType3Num2(BigDecimal type3Num2) 
    {
        this.type3Num2 = type3Num2;
    }

    public BigDecimal getType3Num2() 
    {
        return type3Num2;
    }
    public void setType3Num3(BigDecimal type3Num3) 
    {
        this.type3Num3 = type3Num3;
    }

    public BigDecimal getType3Num3() 
    {
        return type3Num3;
    }
    public void setType3Num4(BigDecimal type3Num4) 
    {
        this.type3Num4 = type3Num4;
    }

    public BigDecimal getType3Num4() 
    {
        return type3Num4;
    }
    public void setType3Num5(BigDecimal type3Num5) 
    {
        this.type3Num5 = type3Num5;
    }

    public BigDecimal getType3Num5() 
    {
        return type3Num5;
    }
    public void setType3Num6(BigDecimal type3Num6) 
    {
        this.type3Num6 = type3Num6;
    }

    public BigDecimal getType3Num6() 
    {
        return type3Num6;
    }
    public void setType3Num7(BigDecimal type3Num7) 
    {
        this.type3Num7 = type3Num7;
    }

    public BigDecimal getType3Num7() 
    {
        return type3Num7;
    }
    public void setType3Num8(BigDecimal type3Num8) 
    {
        this.type3Num8 = type3Num8;
    }

    public BigDecimal getType3Num8() 
    {
        return type3Num8;
    }
    public void setType3Num9(BigDecimal type3Num9) 
    {
        this.type3Num9 = type3Num9;
    }

    public BigDecimal getType3Num9() 
    {
        return type3Num9;
    }
    public void setType3Num10(BigDecimal type3Num10) 
    {
        this.type3Num10 = type3Num10;
    }

    public BigDecimal getType3Num10() 
    {
        return type3Num10;
    }
    public void setType4Big(BigDecimal type4Big) 
    {
        this.type4Big = type4Big;
    }

    public BigDecimal getType4Big() 
    {
        return type4Big;
    }
    public void setType4Small(BigDecimal type4Small) 
    {
        this.type4Small = type4Small;
    }

    public BigDecimal getType4Small() 
    {
        return type4Small;
    }
    public void setType4Single(BigDecimal type4Single) 
    {
        this.type4Single = type4Single;
    }

    public BigDecimal getType4Single() 
    {
        return type4Single;
    }
    public void setType4Double(BigDecimal type4Double) 
    {
        this.type4Double = type4Double;
    }

    public BigDecimal getType4Double() 
    {
        return type4Double;
    }
    public void setType4Loong(BigDecimal type4Loong) 
    {
        this.type4Loong = type4Loong;
    }

    public BigDecimal getType4Loong() 
    {
        return type4Loong;
    }
    public void setType4Tiger(BigDecimal type4Tiger) 
    {
        this.type4Tiger = type4Tiger;
    }

    public BigDecimal getType4Tiger() 
    {
        return type4Tiger;
    }
    public void setType4Num1(BigDecimal type4Num1) 
    {
        this.type4Num1 = type4Num1;
    }

    public BigDecimal getType4Num1() 
    {
        return type4Num1;
    }
    public void setType4Num2(BigDecimal type4Num2) 
    {
        this.type4Num2 = type4Num2;
    }

    public BigDecimal getType4Num2() 
    {
        return type4Num2;
    }
    public void setType4Num3(BigDecimal type4Num3) 
    {
        this.type4Num3 = type4Num3;
    }

    public BigDecimal getType4Num3() 
    {
        return type4Num3;
    }
    public void setType4Num4(BigDecimal type4Num4) 
    {
        this.type4Num4 = type4Num4;
    }

    public BigDecimal getType4Num4() 
    {
        return type4Num4;
    }
    public void setType4Num5(BigDecimal type4Num5) 
    {
        this.type4Num5 = type4Num5;
    }

    public BigDecimal getType4Num5() 
    {
        return type4Num5;
    }
    public void setType4Num6(BigDecimal type4Num6) 
    {
        this.type4Num6 = type4Num6;
    }

    public BigDecimal getType4Num6() 
    {
        return type4Num6;
    }
    public void setType4Num7(BigDecimal type4Num7) 
    {
        this.type4Num7 = type4Num7;
    }

    public BigDecimal getType4Num7() 
    {
        return type4Num7;
    }
    public void setType4Num8(BigDecimal type4Num8) 
    {
        this.type4Num8 = type4Num8;
    }

    public BigDecimal getType4Num8() 
    {
        return type4Num8;
    }
    public void setType4Num9(BigDecimal type4Num9) 
    {
        this.type4Num9 = type4Num9;
    }

    public BigDecimal getType4Num9() 
    {
        return type4Num9;
    }
    public void setType4Num10(BigDecimal type4Num10) 
    {
        this.type4Num10 = type4Num10;
    }

    public BigDecimal getType4Num10() 
    {
        return type4Num10;
    }
    public void setType5Big(BigDecimal type5Big) 
    {
        this.type5Big = type5Big;
    }

    public BigDecimal getType5Big() 
    {
        return type5Big;
    }
    public void setType5Small(BigDecimal type5Small) 
    {
        this.type5Small = type5Small;
    }

    public BigDecimal getType5Small() 
    {
        return type5Small;
    }
    public void setType5Single(BigDecimal type5Single) 
    {
        this.type5Single = type5Single;
    }

    public BigDecimal getType5Single() 
    {
        return type5Single;
    }
    public void setType5Double(BigDecimal type5Double) 
    {
        this.type5Double = type5Double;
    }

    public BigDecimal getType5Double() 
    {
        return type5Double;
    }
    public void setType5Loong(BigDecimal type5Loong) 
    {
        this.type5Loong = type5Loong;
    }

    public BigDecimal getType5Loong() 
    {
        return type5Loong;
    }
    public void setType5Tiger(BigDecimal type5Tiger) 
    {
        this.type5Tiger = type5Tiger;
    }

    public BigDecimal getType5Tiger() 
    {
        return type5Tiger;
    }
    public void setType5Num1(BigDecimal type5Num1) 
    {
        this.type5Num1 = type5Num1;
    }

    public BigDecimal getType5Num1() 
    {
        return type5Num1;
    }
    public void setType5Num2(BigDecimal type5Num2) 
    {
        this.type5Num2 = type5Num2;
    }

    public BigDecimal getType5Num2() 
    {
        return type5Num2;
    }
    public void setType5Num3(BigDecimal type5Num3) 
    {
        this.type5Num3 = type5Num3;
    }

    public BigDecimal getType5Num3() 
    {
        return type5Num3;
    }
    public void setType5Num4(BigDecimal type5Num4) 
    {
        this.type5Num4 = type5Num4;
    }

    public BigDecimal getType5Num4() 
    {
        return type5Num4;
    }
    public void setType5Num5(BigDecimal type5Num5) 
    {
        this.type5Num5 = type5Num5;
    }

    public BigDecimal getType5Num5() 
    {
        return type5Num5;
    }
    public void setType5Num6(BigDecimal type5Num6) 
    {
        this.type5Num6 = type5Num6;
    }

    public BigDecimal getType5Num6() 
    {
        return type5Num6;
    }
    public void setType5Num7(BigDecimal type5Num7) 
    {
        this.type5Num7 = type5Num7;
    }

    public BigDecimal getType5Num7() 
    {
        return type5Num7;
    }
    public void setType5Num8(BigDecimal type5Num8) 
    {
        this.type5Num8 = type5Num8;
    }

    public BigDecimal getType5Num8() 
    {
        return type5Num8;
    }
    public void setType5Num9(BigDecimal type5Num9) 
    {
        this.type5Num9 = type5Num9;
    }

    public BigDecimal getType5Num9() 
    {
        return type5Num9;
    }
    public void setType5Num10(BigDecimal type5Num10) 
    {
        this.type5Num10 = type5Num10;
    }

    public BigDecimal getType5Num10() 
    {
        return type5Num10;
    }
    public void setType6Big(BigDecimal type6Big) 
    {
        this.type6Big = type6Big;
    }

    public BigDecimal getType6Big() 
    {
        return type6Big;
    }
    public void setType6Small(BigDecimal type6Small) 
    {
        this.type6Small = type6Small;
    }

    public BigDecimal getType6Small() 
    {
        return type6Small;
    }
    public void setType6Single(BigDecimal type6Single) 
    {
        this.type6Single = type6Single;
    }

    public BigDecimal getType6Single() 
    {
        return type6Single;
    }
    public void setType6Double(BigDecimal type6Double) 
    {
        this.type6Double = type6Double;
    }

    public BigDecimal getType6Double() 
    {
        return type6Double;
    }
    public void setType6Loong(BigDecimal type6Loong) 
    {
        this.type6Loong = type6Loong;
    }

    public BigDecimal getType6Loong() 
    {
        return type6Loong;
    }
    public void setType6Tiger(BigDecimal type6Tiger) 
    {
        this.type6Tiger = type6Tiger;
    }

    public BigDecimal getType6Tiger() 
    {
        return type6Tiger;
    }
    public void setType6Num1(BigDecimal type6Num1) 
    {
        this.type6Num1 = type6Num1;
    }

    public BigDecimal getType6Num1() 
    {
        return type6Num1;
    }
    public void setType6Num2(BigDecimal type6Num2) 
    {
        this.type6Num2 = type6Num2;
    }

    public BigDecimal getType6Num2() 
    {
        return type6Num2;
    }
    public void setType6Num3(BigDecimal type6Num3) 
    {
        this.type6Num3 = type6Num3;
    }

    public BigDecimal getType6Num3() 
    {
        return type6Num3;
    }
    public void setType6Num4(BigDecimal type6Num4) 
    {
        this.type6Num4 = type6Num4;
    }

    public BigDecimal getType6Num4() 
    {
        return type6Num4;
    }
    public void setType6Num5(BigDecimal type6Num5) 
    {
        this.type6Num5 = type6Num5;
    }

    public BigDecimal getType6Num5() 
    {
        return type6Num5;
    }
    public void setType6Num6(BigDecimal type6Num6) 
    {
        this.type6Num6 = type6Num6;
    }

    public BigDecimal getType6Num6() 
    {
        return type6Num6;
    }
    public void setType6Num7(BigDecimal type6Num7) 
    {
        this.type6Num7 = type6Num7;
    }

    public BigDecimal getType6Num7() 
    {
        return type6Num7;
    }
    public void setType6Num8(BigDecimal type6Num8) 
    {
        this.type6Num8 = type6Num8;
    }

    public BigDecimal getType6Num8() 
    {
        return type6Num8;
    }
    public void setType6Num9(BigDecimal type6Num9) 
    {
        this.type6Num9 = type6Num9;
    }

    public BigDecimal getType6Num9() 
    {
        return type6Num9;
    }
    public void setType6Num10(BigDecimal type6Num10) 
    {
        this.type6Num10 = type6Num10;
    }

    public BigDecimal getType6Num10() 
    {
        return type6Num10;
    }
    public void setType7Big(BigDecimal type7Big) 
    {
        this.type7Big = type7Big;
    }

    public BigDecimal getType7Big() 
    {
        return type7Big;
    }
    public void setType7Small(BigDecimal type7Small) 
    {
        this.type7Small = type7Small;
    }

    public BigDecimal getType7Small() 
    {
        return type7Small;
    }
    public void setType7Single(BigDecimal type7Single) 
    {
        this.type7Single = type7Single;
    }

    public BigDecimal getType7Single() 
    {
        return type7Single;
    }
    public void setType7Double(BigDecimal type7Double) 
    {
        this.type7Double = type7Double;
    }

    public BigDecimal getType7Double() 
    {
        return type7Double;
    }
    public void setType7Loong(BigDecimal type7Loong) 
    {
        this.type7Loong = type7Loong;
    }

    public BigDecimal getType7Loong() 
    {
        return type7Loong;
    }
    public void setType7Tiger(BigDecimal type7Tiger) 
    {
        this.type7Tiger = type7Tiger;
    }

    public BigDecimal getType7Tiger() 
    {
        return type7Tiger;
    }
    public void setType7Num1(BigDecimal type7Num1) 
    {
        this.type7Num1 = type7Num1;
    }

    public BigDecimal getType7Num1() 
    {
        return type7Num1;
    }
    public void setType7Num2(BigDecimal type7Num2) 
    {
        this.type7Num2 = type7Num2;
    }

    public BigDecimal getType7Num2() 
    {
        return type7Num2;
    }
    public void setType7Num3(BigDecimal type7Num3) 
    {
        this.type7Num3 = type7Num3;
    }

    public BigDecimal getType7Num3() 
    {
        return type7Num3;
    }
    public void setType7Num4(BigDecimal type7Num4) 
    {
        this.type7Num4 = type7Num4;
    }

    public BigDecimal getType7Num4() 
    {
        return type7Num4;
    }
    public void setType7Num5(BigDecimal type7Num5) 
    {
        this.type7Num5 = type7Num5;
    }

    public BigDecimal getType7Num5() 
    {
        return type7Num5;
    }
    public void setType7Num6(BigDecimal type7Num6) 
    {
        this.type7Num6 = type7Num6;
    }

    public BigDecimal getType7Num6() 
    {
        return type7Num6;
    }
    public void setType7Num7(BigDecimal type7Num7) 
    {
        this.type7Num7 = type7Num7;
    }

    public BigDecimal getType7Num7() 
    {
        return type7Num7;
    }
    public void setType7Num8(BigDecimal type7Num8) 
    {
        this.type7Num8 = type7Num8;
    }

    public BigDecimal getType7Num8() 
    {
        return type7Num8;
    }
    public void setType7Num9(BigDecimal type7Num9) 
    {
        this.type7Num9 = type7Num9;
    }

    public BigDecimal getType7Num9() 
    {
        return type7Num9;
    }
    public void setType7Num10(BigDecimal type7Num10) 
    {
        this.type7Num10 = type7Num10;
    }

    public BigDecimal getType7Num10() 
    {
        return type7Num10;
    }
    public void setType8Big(BigDecimal type8Big) 
    {
        this.type8Big = type8Big;
    }

    public BigDecimal getType8Big() 
    {
        return type8Big;
    }
    public void setType8Small(BigDecimal type8Small) 
    {
        this.type8Small = type8Small;
    }

    public BigDecimal getType8Small() 
    {
        return type8Small;
    }
    public void setType8Single(BigDecimal type8Single) 
    {
        this.type8Single = type8Single;
    }

    public BigDecimal getType8Single() 
    {
        return type8Single;
    }
    public void setType8Double(BigDecimal type8Double) 
    {
        this.type8Double = type8Double;
    }

    public BigDecimal getType8Double() 
    {
        return type8Double;
    }
    public void setType8Loong(BigDecimal type8Loong) 
    {
        this.type8Loong = type8Loong;
    }

    public BigDecimal getType8Loong() 
    {
        return type8Loong;
    }
    public void setType8Tiger(BigDecimal type8Tiger) 
    {
        this.type8Tiger = type8Tiger;
    }

    public BigDecimal getType8Tiger() 
    {
        return type8Tiger;
    }
    public void setType8Num1(BigDecimal type8Num1) 
    {
        this.type8Num1 = type8Num1;
    }

    public BigDecimal getType8Num1() 
    {
        return type8Num1;
    }
    public void setType8Num2(BigDecimal type8Num2) 
    {
        this.type8Num2 = type8Num2;
    }

    public BigDecimal getType8Num2() 
    {
        return type8Num2;
    }
    public void setType8Num3(BigDecimal type8Num3) 
    {
        this.type8Num3 = type8Num3;
    }

    public BigDecimal getType8Num3() 
    {
        return type8Num3;
    }
    public void setType8Num4(BigDecimal type8Num4) 
    {
        this.type8Num4 = type8Num4;
    }

    public BigDecimal getType8Num4() 
    {
        return type8Num4;
    }
    public void setType8Num5(BigDecimal type8Num5) 
    {
        this.type8Num5 = type8Num5;
    }

    public BigDecimal getType8Num5() 
    {
        return type8Num5;
    }
    public void setType8Num6(BigDecimal type8Num6) 
    {
        this.type8Num6 = type8Num6;
    }

    public BigDecimal getType8Num6() 
    {
        return type8Num6;
    }
    public void setType8Num7(BigDecimal type8Num7) 
    {
        this.type8Num7 = type8Num7;
    }

    public BigDecimal getType8Num7() 
    {
        return type8Num7;
    }
    public void setType8Num8(BigDecimal type8Num8) 
    {
        this.type8Num8 = type8Num8;
    }

    public BigDecimal getType8Num8() 
    {
        return type8Num8;
    }
    public void setType8Num9(BigDecimal type8Num9) 
    {
        this.type8Num9 = type8Num9;
    }

    public BigDecimal getType8Num9() 
    {
        return type8Num9;
    }
    public void setType8Num10(BigDecimal type8Num10) 
    {
        this.type8Num10 = type8Num10;
    }

    public BigDecimal getType8Num10() 
    {
        return type8Num10;
    }
    public void setType9Big(BigDecimal type9Big) 
    {
        this.type9Big = type9Big;
    }

    public BigDecimal getType9Big() 
    {
        return type9Big;
    }
    public void setType9Small(BigDecimal type9Small) 
    {
        this.type9Small = type9Small;
    }

    public BigDecimal getType9Small() 
    {
        return type9Small;
    }
    public void setType9Single(BigDecimal type9Single) 
    {
        this.type9Single = type9Single;
    }

    public BigDecimal getType9Single() 
    {
        return type9Single;
    }
    public void setType9Double(BigDecimal type9Double) 
    {
        this.type9Double = type9Double;
    }

    public BigDecimal getType9Double() 
    {
        return type9Double;
    }
    public void setType9Loong(BigDecimal type9Loong) 
    {
        this.type9Loong = type9Loong;
    }

    public BigDecimal getType9Loong() 
    {
        return type9Loong;
    }
    public void setType9Tiger(BigDecimal type9Tiger) 
    {
        this.type9Tiger = type9Tiger;
    }

    public BigDecimal getType9Tiger() 
    {
        return type9Tiger;
    }
    public void setType9Num1(BigDecimal type9Num1) 
    {
        this.type9Num1 = type9Num1;
    }

    public BigDecimal getType9Num1() 
    {
        return type9Num1;
    }
    public void setType9Num2(BigDecimal type9Num2) 
    {
        this.type9Num2 = type9Num2;
    }

    public BigDecimal getType9Num2() 
    {
        return type9Num2;
    }
    public void setType9Num3(BigDecimal type9Num3) 
    {
        this.type9Num3 = type9Num3;
    }

    public BigDecimal getType9Num3() 
    {
        return type9Num3;
    }
    public void setType9Num4(BigDecimal type9Num4) 
    {
        this.type9Num4 = type9Num4;
    }

    public BigDecimal getType9Num4() 
    {
        return type9Num4;
    }
    public void setType9Num5(BigDecimal type9Num5) 
    {
        this.type9Num5 = type9Num5;
    }

    public BigDecimal getType9Num5() 
    {
        return type9Num5;
    }
    public void setType9Num6(BigDecimal type9Num6) 
    {
        this.type9Num6 = type9Num6;
    }

    public BigDecimal getType9Num6() 
    {
        return type9Num6;
    }
    public void setType9Num7(BigDecimal type9Num7) 
    {
        this.type9Num7 = type9Num7;
    }

    public BigDecimal getType9Num7() 
    {
        return type9Num7;
    }
    public void setType9Num8(BigDecimal type9Num8) 
    {
        this.type9Num8 = type9Num8;
    }

    public BigDecimal getType9Num8() 
    {
        return type9Num8;
    }
    public void setType9Num9(BigDecimal type9Num9) 
    {
        this.type9Num9 = type9Num9;
    }

    public BigDecimal getType9Num9() 
    {
        return type9Num9;
    }
    public void setType9Num10(BigDecimal type9Num10) 
    {
        this.type9Num10 = type9Num10;
    }

    public BigDecimal getType9Num10() 
    {
        return type9Num10;
    }
    public void setType10Big(BigDecimal type10Big) 
    {
        this.type10Big = type10Big;
    }

    public BigDecimal getType10Big() 
    {
        return type10Big;
    }
    public void setType10Small(BigDecimal type10Small) 
    {
        this.type10Small = type10Small;
    }

    public BigDecimal getType10Small() 
    {
        return type10Small;
    }
    public void setType10Single(BigDecimal type10Single) 
    {
        this.type10Single = type10Single;
    }

    public BigDecimal getType10Single() 
    {
        return type10Single;
    }
    public void setType10Double(BigDecimal type10Double) 
    {
        this.type10Double = type10Double;
    }

    public BigDecimal getType10Double() 
    {
        return type10Double;
    }
    public void setType10Loong(BigDecimal type10Loong) 
    {
        this.type10Loong = type10Loong;
    }

    public BigDecimal getType10Loong() 
    {
        return type10Loong;
    }
    public void setType10Tiger(BigDecimal type10Tiger) 
    {
        this.type10Tiger = type10Tiger;
    }

    public BigDecimal getType10Tiger() 
    {
        return type10Tiger;
    }
    public void setType10Num1(BigDecimal type10Num1) 
    {
        this.type10Num1 = type10Num1;
    }

    public BigDecimal getType10Num1() 
    {
        return type10Num1;
    }
    public void setType10Num2(BigDecimal type10Num2) 
    {
        this.type10Num2 = type10Num2;
    }

    public BigDecimal getType10Num2() 
    {
        return type10Num2;
    }
    public void setType10Num3(BigDecimal type10Num3) 
    {
        this.type10Num3 = type10Num3;
    }

    public BigDecimal getType10Num3() 
    {
        return type10Num3;
    }
    public void setType10Num4(BigDecimal type10Num4) 
    {
        this.type10Num4 = type10Num4;
    }

    public BigDecimal getType10Num4() 
    {
        return type10Num4;
    }
    public void setType10Num5(BigDecimal type10Num5) 
    {
        this.type10Num5 = type10Num5;
    }

    public BigDecimal getType10Num5() 
    {
        return type10Num5;
    }
    public void setType10Num6(BigDecimal type10Num6) 
    {
        this.type10Num6 = type10Num6;
    }

    public BigDecimal getType10Num6() 
    {
        return type10Num6;
    }
    public void setType10Num7(BigDecimal type10Num7) 
    {
        this.type10Num7 = type10Num7;
    }

    public BigDecimal getType10Num7() 
    {
        return type10Num7;
    }
    public void setType10Num8(BigDecimal type10Num8) 
    {
        this.type10Num8 = type10Num8;
    }

    public BigDecimal getType10Num8() 
    {
        return type10Num8;
    }
    public void setType10Num9(BigDecimal type10Num9) 
    {
        this.type10Num9 = type10Num9;
    }

    public BigDecimal getType10Num9() 
    {
        return type10Num9;
    }
    public void setType10Num10(BigDecimal type10Num10) 
    {
        this.type10Num10 = type10Num10;
    }

    public BigDecimal getType10Num10() 
    {
        return type10Num10;
    }
    public void setType11Big(BigDecimal type11Big) 
    {
        this.type11Big = type11Big;
    }

    public BigDecimal getType11Big() 
    {
        return type11Big;
    }
    public void setType11Small(BigDecimal type11Small) 
    {
        this.type11Small = type11Small;
    }

    public BigDecimal getType11Small() 
    {
        return type11Small;
    }
    public void setType11Single(BigDecimal type11Single) 
    {
        this.type11Single = type11Single;
    }

    public BigDecimal getType11Single() 
    {
        return type11Single;
    }
    public void setType11Double(BigDecimal type11Double) 
    {
        this.type11Double = type11Double;
    }

    public BigDecimal getType11Double() 
    {
        return type11Double;
    }
    public void setType11Loong(BigDecimal type11Loong) 
    {
        this.type11Loong = type11Loong;
    }

    public BigDecimal getType11Loong() 
    {
        return type11Loong;
    }
    public void setType11Tiger(BigDecimal type11Tiger) 
    {
        this.type11Tiger = type11Tiger;
    }

    public BigDecimal getType11Tiger() 
    {
        return type11Tiger;
    }
    public void setType11Num1(BigDecimal type11Num1) 
    {
        this.type11Num1 = type11Num1;
    }

    public BigDecimal getType11Num1() 
    {
        return type11Num1;
    }
    public void setType11Num2(BigDecimal type11Num2) 
    {
        this.type11Num2 = type11Num2;
    }

    public BigDecimal getType11Num2() 
    {
        return type11Num2;
    }
    public void setType11Num3(BigDecimal type11Num3) 
    {
        this.type11Num3 = type11Num3;
    }

    public BigDecimal getType11Num3() 
    {
        return type11Num3;
    }
    public void setType11Num4(BigDecimal type11Num4) 
    {
        this.type11Num4 = type11Num4;
    }

    public BigDecimal getType11Num4() 
    {
        return type11Num4;
    }
    public void setType11Num5(BigDecimal type11Num5) 
    {
        this.type11Num5 = type11Num5;
    }

    public BigDecimal getType11Num5() 
    {
        return type11Num5;
    }
    public void setType11Num6(BigDecimal type11Num6) 
    {
        this.type11Num6 = type11Num6;
    }

    public BigDecimal getType11Num6() 
    {
        return type11Num6;
    }
    public void setType11Num7(BigDecimal type11Num7) 
    {
        this.type11Num7 = type11Num7;
    }

    public BigDecimal getType11Num7() 
    {
        return type11Num7;
    }
    public void setType11Num8(BigDecimal type11Num8) 
    {
        this.type11Num8 = type11Num8;
    }

    public BigDecimal getType11Num8() 
    {
        return type11Num8;
    }
    public void setType11Num9(BigDecimal type11Num9) 
    {
        this.type11Num9 = type11Num9;
    }

    public BigDecimal getType11Num9() 
    {
        return type11Num9;
    }
    public void setType11Num10(BigDecimal type11Num10) 
    {
        this.type11Num10 = type11Num10;
    }

    public BigDecimal getType11Num10() 
    {
        return type11Num10;
    }
    public void setBigSingle(BigDecimal bigSingle) 
    {
        this.bigSingle = bigSingle;
    }

    public BigDecimal getBigSingle() 
    {
        return bigSingle;
    }
    public void setBigDouble(BigDecimal bigDouble) 
    {
        this.bigDouble = bigDouble;
    }

    public BigDecimal getBigDouble() 
    {
        return bigDouble;
    }
    public void setSmallSingle(BigDecimal smallSingle) 
    {
        this.smallSingle = smallSingle;
    }

    public BigDecimal getSmallSingle() 
    {
        return smallSingle;
    }
    public void setSmallDouble(BigDecimal smallDouble) 
    {
        this.smallDouble = smallDouble;
    }

    public BigDecimal getSmallDouble() 
    {
        return smallDouble;
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
    public void setSumNum(Long sumNum) 
    {
        this.sumNum = sumNum;
    }

    public Long getSumNum() 
    {
        return sumNum;
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
            .append("type1Big", getType1Big())
            .append("type1Small", getType1Small())
            .append("type1Single", getType1Single())
            .append("type1Double", getType1Double())
            .append("type1Num3", getType1Num3())
            .append("type1Num4", getType1Num4())
            .append("type1Num5", getType1Num5())
            .append("type1Num6", getType1Num6())
            .append("type1Num7", getType1Num7())
            .append("type1Num8", getType1Num8())
            .append("type1Num9", getType1Num9())
            .append("type1Num10", getType1Num10())
            .append("type1Num11", getType1Num11())
            .append("type1Num12", getType1Num12())
            .append("type1Num13", getType1Num13())
            .append("type1Num14", getType1Num14())
            .append("type1Num15", getType1Num15())
            .append("type1Num16", getType1Num16())
            .append("type1Num17", getType1Num17())
            .append("type1Num18", getType1Num18())
            .append("type1Num19", getType1Num19())
            .append("type2Big", getType2Big())
            .append("type2Small", getType2Small())
            .append("type2Single", getType2Single())
            .append("type2Double", getType2Double())
            .append("type2Loong", getType2Loong())
            .append("type2Tiger", getType2Tiger())
            .append("type2Num1", getType2Num1())
            .append("type2Num2", getType2Num2())
            .append("type2Num3", getType2Num3())
            .append("type2Num4", getType2Num4())
            .append("type2Num5", getType2Num5())
            .append("type2Num6", getType2Num6())
            .append("type2Num7", getType2Num7())
            .append("type2Num8", getType2Num8())
            .append("type2Num9", getType2Num9())
            .append("type2Num10", getType2Num10())
            .append("type3Big", getType3Big())
            .append("type3Small", getType3Small())
            .append("type3Single", getType3Single())
            .append("type3Double", getType3Double())
            .append("type3Loong", getType3Loong())
            .append("type3Tiger", getType3Tiger())
            .append("type3Num1", getType3Num1())
            .append("type3Num2", getType3Num2())
            .append("type3Num3", getType3Num3())
            .append("type3Num4", getType3Num4())
            .append("type3Num5", getType3Num5())
            .append("type3Num6", getType3Num6())
            .append("type3Num7", getType3Num7())
            .append("type3Num8", getType3Num8())
            .append("type3Num9", getType3Num9())
            .append("type3Num10", getType3Num10())
            .append("type4Big", getType4Big())
            .append("type4Small", getType4Small())
            .append("type4Single", getType4Single())
            .append("type4Double", getType4Double())
            .append("type4Loong", getType4Loong())
            .append("type4Tiger", getType4Tiger())
            .append("type4Num1", getType4Num1())
            .append("type4Num2", getType4Num2())
            .append("type4Num3", getType4Num3())
            .append("type4Num4", getType4Num4())
            .append("type4Num5", getType4Num5())
            .append("type4Num6", getType4Num6())
            .append("type4Num7", getType4Num7())
            .append("type4Num8", getType4Num8())
            .append("type4Num9", getType4Num9())
            .append("type4Num10", getType4Num10())
            .append("type5Big", getType5Big())
            .append("type5Small", getType5Small())
            .append("type5Single", getType5Single())
            .append("type5Double", getType5Double())
            .append("type5Loong", getType5Loong())
            .append("type5Tiger", getType5Tiger())
            .append("type5Num1", getType5Num1())
            .append("type5Num2", getType5Num2())
            .append("type5Num3", getType5Num3())
            .append("type5Num4", getType5Num4())
            .append("type5Num5", getType5Num5())
            .append("type5Num6", getType5Num6())
            .append("type5Num7", getType5Num7())
            .append("type5Num8", getType5Num8())
            .append("type5Num9", getType5Num9())
            .append("type5Num10", getType5Num10())
            .append("type6Big", getType6Big())
            .append("type6Small", getType6Small())
            .append("type6Single", getType6Single())
            .append("type6Double", getType6Double())
            .append("type6Loong", getType6Loong())
            .append("type6Tiger", getType6Tiger())
            .append("type6Num1", getType6Num1())
            .append("type6Num2", getType6Num2())
            .append("type6Num3", getType6Num3())
            .append("type6Num4", getType6Num4())
            .append("type6Num5", getType6Num5())
            .append("type6Num6", getType6Num6())
            .append("type6Num7", getType6Num7())
            .append("type6Num8", getType6Num8())
            .append("type6Num9", getType6Num9())
            .append("type6Num10", getType6Num10())
            .append("type7Big", getType7Big())
            .append("type7Small", getType7Small())
            .append("type7Single", getType7Single())
            .append("type7Double", getType7Double())
            .append("type7Loong", getType7Loong())
            .append("type7Tiger", getType7Tiger())
            .append("type7Num1", getType7Num1())
            .append("type7Num2", getType7Num2())
            .append("type7Num3", getType7Num3())
            .append("type7Num4", getType7Num4())
            .append("type7Num5", getType7Num5())
            .append("type7Num6", getType7Num6())
            .append("type7Num7", getType7Num7())
            .append("type7Num8", getType7Num8())
            .append("type7Num9", getType7Num9())
            .append("type7Num10", getType7Num10())
            .append("type8Big", getType8Big())
            .append("type8Small", getType8Small())
            .append("type8Single", getType8Single())
            .append("type8Double", getType8Double())
            .append("type8Loong", getType8Loong())
            .append("type8Tiger", getType8Tiger())
            .append("type8Num1", getType8Num1())
            .append("type8Num2", getType8Num2())
            .append("type8Num3", getType8Num3())
            .append("type8Num4", getType8Num4())
            .append("type8Num5", getType8Num5())
            .append("type8Num6", getType8Num6())
            .append("type8Num7", getType8Num7())
            .append("type8Num8", getType8Num8())
            .append("type8Num9", getType8Num9())
            .append("type8Num10", getType8Num10())
            .append("type9Big", getType9Big())
            .append("type9Small", getType9Small())
            .append("type9Single", getType9Single())
            .append("type9Double", getType9Double())
            .append("type9Loong", getType9Loong())
            .append("type9Tiger", getType9Tiger())
            .append("type9Num1", getType9Num1())
            .append("type9Num2", getType9Num2())
            .append("type9Num3", getType9Num3())
            .append("type9Num4", getType9Num4())
            .append("type9Num5", getType9Num5())
            .append("type9Num6", getType9Num6())
            .append("type9Num7", getType9Num7())
            .append("type9Num8", getType9Num8())
            .append("type9Num9", getType9Num9())
            .append("type9Num10", getType9Num10())
            .append("type10Big", getType10Big())
            .append("type10Small", getType10Small())
            .append("type10Single", getType10Single())
            .append("type10Double", getType10Double())
            .append("type10Loong", getType10Loong())
            .append("type10Tiger", getType10Tiger())
            .append("type10Num1", getType10Num1())
            .append("type10Num2", getType10Num2())
            .append("type10Num3", getType10Num3())
            .append("type10Num4", getType10Num4())
            .append("type10Num5", getType10Num5())
            .append("type10Num6", getType10Num6())
            .append("type10Num7", getType10Num7())
            .append("type10Num8", getType10Num8())
            .append("type10Num9", getType10Num9())
            .append("type10Num10", getType10Num10())
            .append("type11Big", getType11Big())
            .append("type11Small", getType11Small())
            .append("type11Single", getType11Single())
            .append("type11Double", getType11Double())
            .append("type11Loong", getType11Loong())
            .append("type11Tiger", getType11Tiger())
            .append("type11Num1", getType11Num1())
            .append("type11Num2", getType11Num2())
            .append("type11Num3", getType11Num3())
            .append("type11Num4", getType11Num4())
            .append("type11Num5", getType11Num5())
            .append("type11Num6", getType11Num6())
            .append("type11Num7", getType11Num7())
            .append("type11Num8", getType11Num8())
            .append("type11Num9", getType11Num9())
            .append("type11Num10", getType11Num10())
            .append("bigSingle", getBigSingle())
            .append("bigDouble", getBigDouble())
            .append("smallSingle", getSmallSingle())
            .append("smallDouble", getSmallDouble())
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
