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
 * @date 2024-03-17
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

    /** 下注冠亚和大的金额 */
    @Excel(name = "下注冠亚和大的金额")
    private Long type1Big;

    /** 下注冠亚和小的金额 */
    @Excel(name = "下注冠亚和小的金额")
    private Long type1Small;

    /** 下注冠亚和单的金额 */
    @Excel(name = "下注冠亚和单的金额")
    private Long type1Single;

    /** 下注冠亚和双的金额 */
    @Excel(name = "下注冠亚和双的金额")
    private Long type1Double;

    /** 下注冠亚和3的金额 */
    @Excel(name = "下注冠亚和3的金额")
    private Long type1Num3;

    /** 下注冠亚和4的金额 */
    @Excel(name = "下注冠亚和4的金额")
    private Long type1Num4;

    /** 下注冠亚和5的金额 */
    @Excel(name = "下注冠亚和5的金额")
    private Long type1Num5;

    /** 下注冠亚和6的金额 */
    @Excel(name = "下注冠亚和6的金额")
    private Long type1Num6;

    /** 下注冠亚和7的金额 */
    @Excel(name = "下注冠亚和7的金额")
    private Long type1Num7;

    /** 下注冠亚和8的金额 */
    @Excel(name = "下注冠亚和8的金额")
    private Long type1Num8;

    /** 下注冠亚和9的金额 */
    @Excel(name = "下注冠亚和9的金额")
    private Long type1Num9;

    /** 下注冠亚和10的金额 */
    @Excel(name = "下注冠亚和10的金额")
    private Long type1Num10;

    /** 下注冠亚和11的金额 */
    @Excel(name = "下注冠亚和11的金额")
    private Long type1Num11;

    /** 下注冠亚和12的金额 */
    @Excel(name = "下注冠亚和12的金额")
    private Long type1Num12;

    /** 下注冠亚和13的金额 */
    @Excel(name = "下注冠亚和13的金额")
    private Long type1Num13;

    /** 下注冠亚和14的金额 */
    @Excel(name = "下注冠亚和14的金额")
    private Long type1Num14;

    /** 下注冠亚和15的金额 */
    @Excel(name = "下注冠亚和15的金额")
    private Long type1Num15;

    /** 下注冠亚和16的金额 */
    @Excel(name = "下注冠亚和16的金额")
    private Long type1Num16;

    /** 下注冠亚和17的金额 */
    @Excel(name = "下注冠亚和17的金额")
    private Long type1Num17;

    /** 下注冠亚和18的金额 */
    @Excel(name = "下注冠亚和18的金额")
    private Long type1Num18;

    /** 下注冠亚和19的金额 */
    @Excel(name = "下注冠亚和19的金额")
    private Long type1Num19;

    /** 下注冠军大的金额 */
    @Excel(name = "下注冠军大的金额")
    private Long type2Big;

    /** 下注冠军小的金额 */
    @Excel(name = "下注冠军小的金额")
    private Long type2Small;

    /** 下注冠军单的金额 */
    @Excel(name = "下注冠军单的金额")
    private Long type2Single;

    /** 下注冠军双的金额 */
    @Excel(name = "下注冠军双的金额")
    private Long type2Double;

    /** 下注冠军龙的金额 */
    @Excel(name = "下注冠军龙的金额")
    private Long type2Loong;

    /** 下注冠军虎的金额 */
    @Excel(name = "下注冠军虎的金额")
    private Long type2Tiger;

    /** 下注冠军1的金额 */
    @Excel(name = "下注冠军1的金额")
    private Long type2Num1;

    /** 下注冠军2的金额 */
    @Excel(name = "下注冠军2的金额")
    private Long type2Num2;

    /** 下注冠军3的金额 */
    @Excel(name = "下注冠军3的金额")
    private Long type2Num3;

    /** 下注冠军4的金额 */
    @Excel(name = "下注冠军4的金额")
    private Long type2Num4;

    /** 下注冠军5的金额 */
    @Excel(name = "下注冠军5的金额")
    private Long type2Num5;

    /** 下注冠军6的金额 */
    @Excel(name = "下注冠军6的金额")
    private Long type2Num6;

    /** 下注冠军7的金额 */
    @Excel(name = "下注冠军7的金额")
    private Long type2Num7;

    /** 下注冠军8的金额 */
    @Excel(name = "下注冠军8的金额")
    private Long type2Num8;

    /** 下注冠军9的金额 */
    @Excel(name = "下注冠军9的金额")
    private Long type2Num9;

    /** 下注冠军10的金额 */
    @Excel(name = "下注冠军10的金额")
    private Long type2Num10;

    /** 下注亚军大的金额 */
    @Excel(name = "下注亚军大的金额")
    private Long type3Big;

    /** 下注亚军小的金额 */
    @Excel(name = "下注亚军小的金额")
    private Long type3Small;

    /** 下注亚军单的金额 */
    @Excel(name = "下注亚军单的金额")
    private Long type3Single;

    /** 下注亚军双的金额 */
    @Excel(name = "下注亚军双的金额")
    private Long type3Double;

    /** 下注亚军龙的金额 */
    @Excel(name = "下注亚军龙的金额")
    private Long type3Loong;

    /** 下注亚军虎的金额 */
    @Excel(name = "下注亚军虎的金额")
    private Long type3Tiger;

    /** 下注亚军1的金额 */
    @Excel(name = "下注亚军1的金额")
    private Long type3Num1;

    /** 下注亚军2的金额 */
    @Excel(name = "下注亚军2的金额")
    private Long type3Num2;

    /** 下注亚军3的金额 */
    @Excel(name = "下注亚军3的金额")
    private Long type3Num3;

    /** 下注亚军4的金额 */
    @Excel(name = "下注亚军4的金额")
    private Long type3Num4;

    /** 下注亚军5的金额 */
    @Excel(name = "下注亚军5的金额")
    private Long type3Num5;

    /** 下注亚军6的金额 */
    @Excel(name = "下注亚军6的金额")
    private Long type3Num6;

    /** 下注亚军7的金额 */
    @Excel(name = "下注亚军7的金额")
    private Long type3Num7;

    /** 下注亚军8的金额 */
    @Excel(name = "下注亚军8的金额")
    private Long type3Num8;

    /** 下注亚军9的金额 */
    @Excel(name = "下注亚军9的金额")
    private Long type3Num9;

    /** 下注亚军10的金额 */
    @Excel(name = "下注亚军10的金额")
    private Long type3Num10;

    /** 下注第三名大的金额 */
    @Excel(name = "下注第三名大的金额")
    private Long type4Big;

    /** 下注第三名小的金额 */
    @Excel(name = "下注第三名小的金额")
    private Long type4Small;

    /** 下注第三名单的金额 */
    @Excel(name = "下注第三名单的金额")
    private Long type4Single;

    /** 下注第三名双的金额 */
    @Excel(name = "下注第三名双的金额")
    private Long type4Double;

    /** 下注第三名龙的金额 */
    @Excel(name = "下注第三名龙的金额")
    private Long type4Loong;

    /** 下注第三名虎的金额 */
    @Excel(name = "下注第三名虎的金额")
    private Long type4Tiger;

    /** 下注第三名1的金额 */
    @Excel(name = "下注第三名1的金额")
    private Long type4Num1;

    /** 下注第三名2的金额 */
    @Excel(name = "下注第三名2的金额")
    private Long type4Num2;

    /** 下注第三名3的金额 */
    @Excel(name = "下注第三名3的金额")
    private Long type4Num3;

    /** 下注第三名4的金额 */
    @Excel(name = "下注第三名4的金额")
    private Long type4Num4;

    /** 下注第三名5的金额 */
    @Excel(name = "下注第三名5的金额")
    private Long type4Num5;

    /** 下注第三名6的金额 */
    @Excel(name = "下注第三名6的金额")
    private Long type4Num6;

    /** 下注第三名7的金额 */
    @Excel(name = "下注第三名7的金额")
    private Long type4Num7;

    /** 下注第三名8的金额 */
    @Excel(name = "下注第三名8的金额")
    private Long type4Num8;

    /** 下注第三名9的金额 */
    @Excel(name = "下注第三名9的金额")
    private Long type4Num9;

    /** 下注第三名10的金额 */
    @Excel(name = "下注第三名10的金额")
    private Long type4Num10;

    /** 下注第四名大的金额 */
    @Excel(name = "下注第四名大的金额")
    private Long type5Big;

    /** 下注第四名小的金额 */
    @Excel(name = "下注第四名小的金额")
    private Long type5Small;

    /** 下注第四名单的金额 */
    @Excel(name = "下注第四名单的金额")
    private Long type5Single;

    /** 下注第四名双的金额 */
    @Excel(name = "下注第四名双的金额")
    private Long type5Double;

    /** 下注第四名龙的金额 */
    @Excel(name = "下注第四名龙的金额")
    private Long type5Loong;

    /** 下注第四名虎的金额 */
    @Excel(name = "下注第四名虎的金额")
    private Long type5Tiger;

    /** 下注第四名1的金额 */
    @Excel(name = "下注第四名1的金额")
    private Long type5Num1;

    /** 下注第四名2的金额 */
    @Excel(name = "下注第四名2的金额")
    private Long type5Num2;

    /** 下注第四名3的金额 */
    @Excel(name = "下注第四名3的金额")
    private Long type5Num3;

    /** 下注第四名4的金额 */
    @Excel(name = "下注第四名4的金额")
    private Long type5Num4;

    /** 下注第四名5的金额 */
    @Excel(name = "下注第四名5的金额")
    private Long type5Num5;

    /** 下注第四名6的金额 */
    @Excel(name = "下注第四名6的金额")
    private Long type5Num6;

    /** 下注第四名7的金额 */
    @Excel(name = "下注第四名7的金额")
    private Long type5Num7;

    /** 下注第四名8的金额 */
    @Excel(name = "下注第四名8的金额")
    private Long type5Num8;

    /** 下注第四名9的金额 */
    @Excel(name = "下注第四名9的金额")
    private Long type5Num9;

    /** 下注第四名10的金额 */
    @Excel(name = "下注第四名10的金额")
    private Long type5Num10;

    /** 下注第五名大的金额 */
    @Excel(name = "下注第五名大的金额")
    private Long type6Big;

    /** 下注第五名小的金额 */
    @Excel(name = "下注第五名小的金额")
    private Long type6Small;

    /** 下注第五名单的金额 */
    @Excel(name = "下注第五名单的金额")
    private Long type6Single;

    /** 下注第五名双的金额 */
    @Excel(name = "下注第五名双的金额")
    private Long type6Double;

    /** 下注第五名龙的金额 */
    @Excel(name = "下注第五名龙的金额")
    private Long type6Loong;

    /** 下注第五名虎的金额 */
    @Excel(name = "下注第五名虎的金额")
    private Long type6Tiger;

    /** 下注第五名1的金额 */
    @Excel(name = "下注第五名1的金额")
    private Long type6Num1;

    /** 下注第五名2的金额 */
    @Excel(name = "下注第五名2的金额")
    private Long type6Num2;

    /** 下注第五名3的金额 */
    @Excel(name = "下注第五名3的金额")
    private Long type6Num3;

    /** 下注第五名4的金额 */
    @Excel(name = "下注第五名4的金额")
    private Long type6Num4;

    /** 下注第五名5的金额 */
    @Excel(name = "下注第五名5的金额")
    private Long type6Num5;

    /** 下注第五名6的金额 */
    @Excel(name = "下注第五名6的金额")
    private Long type6Num6;

    /** 下注第五名7的金额 */
    @Excel(name = "下注第五名7的金额")
    private Long type6Num7;

    /** 下注第五名8的金额 */
    @Excel(name = "下注第五名8的金额")
    private Long type6Num8;

    /** 下注第五名9的金额 */
    @Excel(name = "下注第五名9的金额")
    private Long type6Num9;

    /** 下注第五名10的金额 */
    @Excel(name = "下注第五名10的金额")
    private Long type6Num10;

    /** 下注第六名大的金额 */
    @Excel(name = "下注第六名大的金额")
    private Long type7Big;

    /** 下注第六名小的金额 */
    @Excel(name = "下注第六名小的金额")
    private Long type7Small;

    /** 下注第六名单的金额 */
    @Excel(name = "下注第六名单的金额")
    private Long type7Single;

    /** 下注第六名双的金额 */
    @Excel(name = "下注第六名双的金额")
    private Long type7Double;

    /** 下注第六名龙的金额 */
    @Excel(name = "下注第六名龙的金额")
    private Long type7Loong;

    /** 下注第六名虎的金额 */
    @Excel(name = "下注第六名虎的金额")
    private Long type7Tiger;

    /** 下注第六名1的金额 */
    @Excel(name = "下注第六名1的金额")
    private Long type7Num1;

    /** 下注第六名2的金额 */
    @Excel(name = "下注第六名2的金额")
    private Long type7Num2;

    /** 下注第六名3的金额 */
    @Excel(name = "下注第六名3的金额")
    private Long type7Num3;

    /** 下注第六名4的金额 */
    @Excel(name = "下注第六名4的金额")
    private Long type7Num4;

    /** 下注第六名5的金额 */
    @Excel(name = "下注第六名5的金额")
    private Long type7Num5;

    /** 下注第六名6的金额 */
    @Excel(name = "下注第六名6的金额")
    private Long type7Num6;

    /** 下注第六名7的金额 */
    @Excel(name = "下注第六名7的金额")
    private Long type7Num7;

    /** 下注第六名8的金额 */
    @Excel(name = "下注第六名8的金额")
    private Long type7Num8;

    /** 下注第六名9的金额 */
    @Excel(name = "下注第六名9的金额")
    private Long type7Num9;

    /** 下注第六名10的金额 */
    @Excel(name = "下注第六名10的金额")
    private Long type7Num10;

    /** 下注第七名大的金额 */
    @Excel(name = "下注第七名大的金额")
    private Long type8Big;

    /** 下注第七名小的金额 */
    @Excel(name = "下注第七名小的金额")
    private Long type8Small;

    /** 下注第七名单的金额 */
    @Excel(name = "下注第七名单的金额")
    private Long type8Single;

    /** 下注第七名双的金额 */
    @Excel(name = "下注第七名双的金额")
    private Long type8Double;

    /** 下注第七名龙的金额 */
    @Excel(name = "下注第七名龙的金额")
    private Long type8Loong;

    /** 下注第七名虎的金额 */
    @Excel(name = "下注第七名虎的金额")
    private Long type8Tiger;

    /** 下注第七名1的金额 */
    @Excel(name = "下注第七名1的金额")
    private Long type8Num1;

    /** 下注第七名2的金额 */
    @Excel(name = "下注第七名2的金额")
    private Long type8Num2;

    /** 下注第七名3的金额 */
    @Excel(name = "下注第七名3的金额")
    private Long type8Num3;

    /** 下注第七名4的金额 */
    @Excel(name = "下注第七名4的金额")
    private Long type8Num4;

    /** 下注第七名5的金额 */
    @Excel(name = "下注第七名5的金额")
    private Long type8Num5;

    /** 下注第七名6的金额 */
    @Excel(name = "下注第七名6的金额")
    private Long type8Num6;

    /** 下注第七名7的金额 */
    @Excel(name = "下注第七名7的金额")
    private Long type8Num7;

    /** 下注第七名8的金额 */
    @Excel(name = "下注第七名8的金额")
    private Long type8Num8;

    /** 下注第七名9的金额 */
    @Excel(name = "下注第七名9的金额")
    private Long type8Num9;

    /** 下注第七名10的金额 */
    @Excel(name = "下注第七名10的金额")
    private Long type8Num10;

    /** 下注第八名大的金额 */
    @Excel(name = "下注第八名大的金额")
    private Long type9Big;

    /** 下注第八名小的金额 */
    @Excel(name = "下注第八名小的金额")
    private Long type9Small;

    /** 下注第八名单的金额 */
    @Excel(name = "下注第八名单的金额")
    private Long type9Single;

    /** 下注第八名双的金额 */
    @Excel(name = "下注第八名双的金额")
    private Long type9Double;

    /** 下注第八名龙的金额 */
    @Excel(name = "下注第八名龙的金额")
    private Long type9Loong;

    /** 下注第八名虎的金额 */
    @Excel(name = "下注第八名虎的金额")
    private Long type9Tiger;

    /** 下注第八名1的金额 */
    @Excel(name = "下注第八名1的金额")
    private Long type9Num1;

    /** 下注第八名2的金额 */
    @Excel(name = "下注第八名2的金额")
    private Long type9Num2;

    /** 下注第八名3的金额 */
    @Excel(name = "下注第八名3的金额")
    private Long type9Num3;

    /** 下注第八名4的金额 */
    @Excel(name = "下注第八名4的金额")
    private Long type9Num4;

    /** 下注第八名5的金额 */
    @Excel(name = "下注第八名5的金额")
    private Long type9Num5;

    /** 下注第八名6的金额 */
    @Excel(name = "下注第八名6的金额")
    private Long type9Num6;

    /** 下注第八名7的金额 */
    @Excel(name = "下注第八名7的金额")
    private Long type9Num7;

    /** 下注第八名8的金额 */
    @Excel(name = "下注第八名8的金额")
    private Long type9Num8;

    /** 下注第八名9的金额 */
    @Excel(name = "下注第八名9的金额")
    private Long type9Num9;

    /** 下注第八名10的金额 */
    @Excel(name = "下注第八名10的金额")
    private Long type9Num10;

    /** 下注第九名大的金额 */
    @Excel(name = "下注第九名大的金额")
    private Long type10Big;

    /** 下注第九名小的金额 */
    @Excel(name = "下注第九名小的金额")
    private Long type10Small;

    /** 下注第九名单的金额 */
    @Excel(name = "下注第九名单的金额")
    private Long type10Single;

    /** 下注第九名双的金额 */
    @Excel(name = "下注第九名双的金额")
    private Long type10Double;

    /** 下注第九名龙的金额 */
    @Excel(name = "下注第九名龙的金额")
    private Long type10Loong;

    /** 下注第九名虎的金额 */
    @Excel(name = "下注第九名虎的金额")
    private Long type10Tiger;

    /** 下注第九名1的金额 */
    @Excel(name = "下注第九名1的金额")
    private Long type10Num1;

    /** 下注第九名2的金额 */
    @Excel(name = "下注第九名2的金额")
    private Long type10Num2;

    /** 下注第九名3的金额 */
    @Excel(name = "下注第九名3的金额")
    private Long type10Num3;

    /** 下注第九名4的金额 */
    @Excel(name = "下注第九名4的金额")
    private Long type10Num4;

    /** 下注第九名5的金额 */
    @Excel(name = "下注第九名5的金额")
    private Long type10Num5;

    /** 下注第九名6的金额 */
    @Excel(name = "下注第九名6的金额")
    private Long type10Num6;

    /** 下注第九名7的金额 */
    @Excel(name = "下注第九名7的金额")
    private Long type10Num7;

    /** 下注第九名8的金额 */
    @Excel(name = "下注第九名8的金额")
    private Long type10Num8;

    /** 下注第九名9的金额 */
    @Excel(name = "下注第九名9的金额")
    private Long type10Num9;

    /** 下注第九名10的金额 */
    @Excel(name = "下注第九名10的金额")
    private Long type10Num10;

    /** 下注第十名大的金额 */
    @Excel(name = "下注第十名大的金额")
    private Long type11Big;

    /** 下注第十名小的金额 */
    @Excel(name = "下注第十名小的金额")
    private Long type11Small;

    /** 下注第十名单的金额 */
    @Excel(name = "下注第十名单的金额")
    private Long type11Single;

    /** 下注第十名双的金额 */
    @Excel(name = "下注第十名双的金额")
    private Long type11Double;

    /** 下注第十名龙的金额 */
    @Excel(name = "下注第十名龙的金额")
    private Long type11Loong;

    /** 下注第十名虎的金额 */
    @Excel(name = "下注第十名虎的金额")
    private Long type11Tiger;

    /** 下注第十名1的金额 */
    @Excel(name = "下注第十名1的金额")
    private Long type11Num1;

    /** 下注第十名2的金额 */
    @Excel(name = "下注第十名2的金额")
    private Long type11Num2;

    /** 下注第十名3的金额 */
    @Excel(name = "下注第十名3的金额")
    private Long type11Num3;

    /** 下注第十名4的金额 */
    @Excel(name = "下注第十名4的金额")
    private Long type11Num4;

    /** 下注第十名5的金额 */
    @Excel(name = "下注第十名5的金额")
    private Long type11Num5;

    /** 下注第十名6的金额 */
    @Excel(name = "下注第十名6的金额")
    private Long type11Num6;

    /** 下注第十名7的金额 */
    @Excel(name = "下注第十名7的金额")
    private Long type11Num7;

    /** 下注第十名8的金额 */
    @Excel(name = "下注第十名8的金额")
    private Long type11Num8;

    /** 下注第十名9的金额 */
    @Excel(name = "下注第十名9的金额")
    private Long type11Num9;

    /** 下注第十名10的金额 */
    @Excel(name = "下注第十名10的金额")
    private Long type11Num10;

    /** 下注大单的金额 */
    @Excel(name = "下注大单的金额")
    private Long bigSingle;

    /** 下注大双的金额 */
    @Excel(name = "下注大双的金额")
    private Long bigDouble;

    /** 下注小单的金额 */
    @Excel(name = "下注小单的金额")
    private Long smallSingle;

    /** 下注小双的金额 */
    @Excel(name = "下注小双的金额")
    private Long smallDouble;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer house;

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
    public void setType1Big(Long type1Big) 
    {
        this.type1Big = type1Big;
    }

    public Long getType1Big() 
    {
        return type1Big;
    }
    public void setType1Small(Long type1Small) 
    {
        this.type1Small = type1Small;
    }

    public Long getType1Small() 
    {
        return type1Small;
    }
    public void setType1Single(Long type1Single) 
    {
        this.type1Single = type1Single;
    }

    public Long getType1Single() 
    {
        return type1Single;
    }
    public void setType1Double(Long type1Double) 
    {
        this.type1Double = type1Double;
    }

    public Long getType1Double() 
    {
        return type1Double;
    }
    public void setType1Num3(Long type1Num3) 
    {
        this.type1Num3 = type1Num3;
    }

    public Long getType1Num3() 
    {
        return type1Num3;
    }
    public void setType1Num4(Long type1Num4) 
    {
        this.type1Num4 = type1Num4;
    }

    public Long getType1Num4() 
    {
        return type1Num4;
    }
    public void setType1Num5(Long type1Num5) 
    {
        this.type1Num5 = type1Num5;
    }

    public Long getType1Num5() 
    {
        return type1Num5;
    }
    public void setType1Num6(Long type1Num6) 
    {
        this.type1Num6 = type1Num6;
    }

    public Long getType1Num6() 
    {
        return type1Num6;
    }
    public void setType1Num7(Long type1Num7) 
    {
        this.type1Num7 = type1Num7;
    }

    public Long getType1Num7() 
    {
        return type1Num7;
    }
    public void setType1Num8(Long type1Num8) 
    {
        this.type1Num8 = type1Num8;
    }

    public Long getType1Num8() 
    {
        return type1Num8;
    }
    public void setType1Num9(Long type1Num9) 
    {
        this.type1Num9 = type1Num9;
    }

    public Long getType1Num9() 
    {
        return type1Num9;
    }
    public void setType1Num10(Long type1Num10) 
    {
        this.type1Num10 = type1Num10;
    }

    public Long getType1Num10() 
    {
        return type1Num10;
    }
    public void setType1Num11(Long type1Num11) 
    {
        this.type1Num11 = type1Num11;
    }

    public Long getType1Num11() 
    {
        return type1Num11;
    }
    public void setType1Num12(Long type1Num12) 
    {
        this.type1Num12 = type1Num12;
    }

    public Long getType1Num12() 
    {
        return type1Num12;
    }
    public void setType1Num13(Long type1Num13) 
    {
        this.type1Num13 = type1Num13;
    }

    public Long getType1Num13() 
    {
        return type1Num13;
    }
    public void setType1Num14(Long type1Num14) 
    {
        this.type1Num14 = type1Num14;
    }

    public Long getType1Num14() 
    {
        return type1Num14;
    }
    public void setType1Num15(Long type1Num15) 
    {
        this.type1Num15 = type1Num15;
    }

    public Long getType1Num15() 
    {
        return type1Num15;
    }
    public void setType1Num16(Long type1Num16) 
    {
        this.type1Num16 = type1Num16;
    }

    public Long getType1Num16() 
    {
        return type1Num16;
    }
    public void setType1Num17(Long type1Num17) 
    {
        this.type1Num17 = type1Num17;
    }

    public Long getType1Num17() 
    {
        return type1Num17;
    }
    public void setType1Num18(Long type1Num18) 
    {
        this.type1Num18 = type1Num18;
    }

    public Long getType1Num18() 
    {
        return type1Num18;
    }
    public void setType1Num19(Long type1Num19) 
    {
        this.type1Num19 = type1Num19;
    }

    public Long getType1Num19() 
    {
        return type1Num19;
    }
    public void setType2Big(Long type2Big) 
    {
        this.type2Big = type2Big;
    }

    public Long getType2Big() 
    {
        return type2Big;
    }
    public void setType2Small(Long type2Small) 
    {
        this.type2Small = type2Small;
    }

    public Long getType2Small() 
    {
        return type2Small;
    }
    public void setType2Single(Long type2Single) 
    {
        this.type2Single = type2Single;
    }

    public Long getType2Single() 
    {
        return type2Single;
    }
    public void setType2Double(Long type2Double) 
    {
        this.type2Double = type2Double;
    }

    public Long getType2Double() 
    {
        return type2Double;
    }
    public void setType2Loong(Long type2Loong) 
    {
        this.type2Loong = type2Loong;
    }

    public Long getType2Loong() 
    {
        return type2Loong;
    }
    public void setType2Tiger(Long type2Tiger) 
    {
        this.type2Tiger = type2Tiger;
    }

    public Long getType2Tiger() 
    {
        return type2Tiger;
    }
    public void setType2Num1(Long type2Num1) 
    {
        this.type2Num1 = type2Num1;
    }

    public Long getType2Num1() 
    {
        return type2Num1;
    }
    public void setType2Num2(Long type2Num2) 
    {
        this.type2Num2 = type2Num2;
    }

    public Long getType2Num2() 
    {
        return type2Num2;
    }
    public void setType2Num3(Long type2Num3) 
    {
        this.type2Num3 = type2Num3;
    }

    public Long getType2Num3() 
    {
        return type2Num3;
    }
    public void setType2Num4(Long type2Num4) 
    {
        this.type2Num4 = type2Num4;
    }

    public Long getType2Num4() 
    {
        return type2Num4;
    }
    public void setType2Num5(Long type2Num5) 
    {
        this.type2Num5 = type2Num5;
    }

    public Long getType2Num5() 
    {
        return type2Num5;
    }
    public void setType2Num6(Long type2Num6) 
    {
        this.type2Num6 = type2Num6;
    }

    public Long getType2Num6() 
    {
        return type2Num6;
    }
    public void setType2Num7(Long type2Num7) 
    {
        this.type2Num7 = type2Num7;
    }

    public Long getType2Num7() 
    {
        return type2Num7;
    }
    public void setType2Num8(Long type2Num8) 
    {
        this.type2Num8 = type2Num8;
    }

    public Long getType2Num8() 
    {
        return type2Num8;
    }
    public void setType2Num9(Long type2Num9) 
    {
        this.type2Num9 = type2Num9;
    }

    public Long getType2Num9() 
    {
        return type2Num9;
    }
    public void setType2Num10(Long type2Num10) 
    {
        this.type2Num10 = type2Num10;
    }

    public Long getType2Num10() 
    {
        return type2Num10;
    }
    public void setType3Big(Long type3Big) 
    {
        this.type3Big = type3Big;
    }

    public Long getType3Big() 
    {
        return type3Big;
    }
    public void setType3Small(Long type3Small) 
    {
        this.type3Small = type3Small;
    }

    public Long getType3Small() 
    {
        return type3Small;
    }
    public void setType3Single(Long type3Single) 
    {
        this.type3Single = type3Single;
    }

    public Long getType3Single() 
    {
        return type3Single;
    }
    public void setType3Double(Long type3Double) 
    {
        this.type3Double = type3Double;
    }

    public Long getType3Double() 
    {
        return type3Double;
    }
    public void setType3Loong(Long type3Loong) 
    {
        this.type3Loong = type3Loong;
    }

    public Long getType3Loong() 
    {
        return type3Loong;
    }
    public void setType3Tiger(Long type3Tiger) 
    {
        this.type3Tiger = type3Tiger;
    }

    public Long getType3Tiger() 
    {
        return type3Tiger;
    }
    public void setType3Num1(Long type3Num1) 
    {
        this.type3Num1 = type3Num1;
    }

    public Long getType3Num1() 
    {
        return type3Num1;
    }
    public void setType3Num2(Long type3Num2) 
    {
        this.type3Num2 = type3Num2;
    }

    public Long getType3Num2() 
    {
        return type3Num2;
    }
    public void setType3Num3(Long type3Num3) 
    {
        this.type3Num3 = type3Num3;
    }

    public Long getType3Num3() 
    {
        return type3Num3;
    }
    public void setType3Num4(Long type3Num4) 
    {
        this.type3Num4 = type3Num4;
    }

    public Long getType3Num4() 
    {
        return type3Num4;
    }
    public void setType3Num5(Long type3Num5) 
    {
        this.type3Num5 = type3Num5;
    }

    public Long getType3Num5() 
    {
        return type3Num5;
    }
    public void setType3Num6(Long type3Num6) 
    {
        this.type3Num6 = type3Num6;
    }

    public Long getType3Num6() 
    {
        return type3Num6;
    }
    public void setType3Num7(Long type3Num7) 
    {
        this.type3Num7 = type3Num7;
    }

    public Long getType3Num7() 
    {
        return type3Num7;
    }
    public void setType3Num8(Long type3Num8) 
    {
        this.type3Num8 = type3Num8;
    }

    public Long getType3Num8() 
    {
        return type3Num8;
    }
    public void setType3Num9(Long type3Num9) 
    {
        this.type3Num9 = type3Num9;
    }

    public Long getType3Num9() 
    {
        return type3Num9;
    }
    public void setType3Num10(Long type3Num10) 
    {
        this.type3Num10 = type3Num10;
    }

    public Long getType3Num10() 
    {
        return type3Num10;
    }
    public void setType4Big(Long type4Big) 
    {
        this.type4Big = type4Big;
    }

    public Long getType4Big() 
    {
        return type4Big;
    }
    public void setType4Small(Long type4Small) 
    {
        this.type4Small = type4Small;
    }

    public Long getType4Small() 
    {
        return type4Small;
    }
    public void setType4Single(Long type4Single) 
    {
        this.type4Single = type4Single;
    }

    public Long getType4Single() 
    {
        return type4Single;
    }
    public void setType4Double(Long type4Double) 
    {
        this.type4Double = type4Double;
    }

    public Long getType4Double() 
    {
        return type4Double;
    }
    public void setType4Loong(Long type4Loong) 
    {
        this.type4Loong = type4Loong;
    }

    public Long getType4Loong() 
    {
        return type4Loong;
    }
    public void setType4Tiger(Long type4Tiger) 
    {
        this.type4Tiger = type4Tiger;
    }

    public Long getType4Tiger() 
    {
        return type4Tiger;
    }
    public void setType4Num1(Long type4Num1) 
    {
        this.type4Num1 = type4Num1;
    }

    public Long getType4Num1() 
    {
        return type4Num1;
    }
    public void setType4Num2(Long type4Num2) 
    {
        this.type4Num2 = type4Num2;
    }

    public Long getType4Num2() 
    {
        return type4Num2;
    }
    public void setType4Num3(Long type4Num3) 
    {
        this.type4Num3 = type4Num3;
    }

    public Long getType4Num3() 
    {
        return type4Num3;
    }
    public void setType4Num4(Long type4Num4) 
    {
        this.type4Num4 = type4Num4;
    }

    public Long getType4Num4() 
    {
        return type4Num4;
    }
    public void setType4Num5(Long type4Num5) 
    {
        this.type4Num5 = type4Num5;
    }

    public Long getType4Num5() 
    {
        return type4Num5;
    }
    public void setType4Num6(Long type4Num6) 
    {
        this.type4Num6 = type4Num6;
    }

    public Long getType4Num6() 
    {
        return type4Num6;
    }
    public void setType4Num7(Long type4Num7) 
    {
        this.type4Num7 = type4Num7;
    }

    public Long getType4Num7() 
    {
        return type4Num7;
    }
    public void setType4Num8(Long type4Num8) 
    {
        this.type4Num8 = type4Num8;
    }

    public Long getType4Num8() 
    {
        return type4Num8;
    }
    public void setType4Num9(Long type4Num9) 
    {
        this.type4Num9 = type4Num9;
    }

    public Long getType4Num9() 
    {
        return type4Num9;
    }
    public void setType4Num10(Long type4Num10) 
    {
        this.type4Num10 = type4Num10;
    }

    public Long getType4Num10() 
    {
        return type4Num10;
    }
    public void setType5Big(Long type5Big) 
    {
        this.type5Big = type5Big;
    }

    public Long getType5Big() 
    {
        return type5Big;
    }
    public void setType5Small(Long type5Small) 
    {
        this.type5Small = type5Small;
    }

    public Long getType5Small() 
    {
        return type5Small;
    }
    public void setType5Single(Long type5Single) 
    {
        this.type5Single = type5Single;
    }

    public Long getType5Single() 
    {
        return type5Single;
    }
    public void setType5Double(Long type5Double) 
    {
        this.type5Double = type5Double;
    }

    public Long getType5Double() 
    {
        return type5Double;
    }
    public void setType5Loong(Long type5Loong) 
    {
        this.type5Loong = type5Loong;
    }

    public Long getType5Loong() 
    {
        return type5Loong;
    }
    public void setType5Tiger(Long type5Tiger) 
    {
        this.type5Tiger = type5Tiger;
    }

    public Long getType5Tiger() 
    {
        return type5Tiger;
    }
    public void setType5Num1(Long type5Num1) 
    {
        this.type5Num1 = type5Num1;
    }

    public Long getType5Num1() 
    {
        return type5Num1;
    }
    public void setType5Num2(Long type5Num2) 
    {
        this.type5Num2 = type5Num2;
    }

    public Long getType5Num2() 
    {
        return type5Num2;
    }
    public void setType5Num3(Long type5Num3) 
    {
        this.type5Num3 = type5Num3;
    }

    public Long getType5Num3() 
    {
        return type5Num3;
    }
    public void setType5Num4(Long type5Num4) 
    {
        this.type5Num4 = type5Num4;
    }

    public Long getType5Num4() 
    {
        return type5Num4;
    }
    public void setType5Num5(Long type5Num5) 
    {
        this.type5Num5 = type5Num5;
    }

    public Long getType5Num5() 
    {
        return type5Num5;
    }
    public void setType5Num6(Long type5Num6) 
    {
        this.type5Num6 = type5Num6;
    }

    public Long getType5Num6() 
    {
        return type5Num6;
    }
    public void setType5Num7(Long type5Num7) 
    {
        this.type5Num7 = type5Num7;
    }

    public Long getType5Num7() 
    {
        return type5Num7;
    }
    public void setType5Num8(Long type5Num8) 
    {
        this.type5Num8 = type5Num8;
    }

    public Long getType5Num8() 
    {
        return type5Num8;
    }
    public void setType5Num9(Long type5Num9) 
    {
        this.type5Num9 = type5Num9;
    }

    public Long getType5Num9() 
    {
        return type5Num9;
    }
    public void setType5Num10(Long type5Num10) 
    {
        this.type5Num10 = type5Num10;
    }

    public Long getType5Num10() 
    {
        return type5Num10;
    }
    public void setType6Big(Long type6Big) 
    {
        this.type6Big = type6Big;
    }

    public Long getType6Big() 
    {
        return type6Big;
    }
    public void setType6Small(Long type6Small) 
    {
        this.type6Small = type6Small;
    }

    public Long getType6Small() 
    {
        return type6Small;
    }
    public void setType6Single(Long type6Single) 
    {
        this.type6Single = type6Single;
    }

    public Long getType6Single() 
    {
        return type6Single;
    }
    public void setType6Double(Long type6Double) 
    {
        this.type6Double = type6Double;
    }

    public Long getType6Double() 
    {
        return type6Double;
    }
    public void setType6Loong(Long type6Loong) 
    {
        this.type6Loong = type6Loong;
    }

    public Long getType6Loong() 
    {
        return type6Loong;
    }
    public void setType6Tiger(Long type6Tiger) 
    {
        this.type6Tiger = type6Tiger;
    }

    public Long getType6Tiger() 
    {
        return type6Tiger;
    }
    public void setType6Num1(Long type6Num1) 
    {
        this.type6Num1 = type6Num1;
    }

    public Long getType6Num1() 
    {
        return type6Num1;
    }
    public void setType6Num2(Long type6Num2) 
    {
        this.type6Num2 = type6Num2;
    }

    public Long getType6Num2() 
    {
        return type6Num2;
    }
    public void setType6Num3(Long type6Num3) 
    {
        this.type6Num3 = type6Num3;
    }

    public Long getType6Num3() 
    {
        return type6Num3;
    }
    public void setType6Num4(Long type6Num4) 
    {
        this.type6Num4 = type6Num4;
    }

    public Long getType6Num4() 
    {
        return type6Num4;
    }
    public void setType6Num5(Long type6Num5) 
    {
        this.type6Num5 = type6Num5;
    }

    public Long getType6Num5() 
    {
        return type6Num5;
    }
    public void setType6Num6(Long type6Num6) 
    {
        this.type6Num6 = type6Num6;
    }

    public Long getType6Num6() 
    {
        return type6Num6;
    }
    public void setType6Num7(Long type6Num7) 
    {
        this.type6Num7 = type6Num7;
    }

    public Long getType6Num7() 
    {
        return type6Num7;
    }
    public void setType6Num8(Long type6Num8) 
    {
        this.type6Num8 = type6Num8;
    }

    public Long getType6Num8() 
    {
        return type6Num8;
    }
    public void setType6Num9(Long type6Num9) 
    {
        this.type6Num9 = type6Num9;
    }

    public Long getType6Num9() 
    {
        return type6Num9;
    }
    public void setType6Num10(Long type6Num10) 
    {
        this.type6Num10 = type6Num10;
    }

    public Long getType6Num10() 
    {
        return type6Num10;
    }
    public void setType7Big(Long type7Big) 
    {
        this.type7Big = type7Big;
    }

    public Long getType7Big() 
    {
        return type7Big;
    }
    public void setType7Small(Long type7Small) 
    {
        this.type7Small = type7Small;
    }

    public Long getType7Small() 
    {
        return type7Small;
    }
    public void setType7Single(Long type7Single) 
    {
        this.type7Single = type7Single;
    }

    public Long getType7Single() 
    {
        return type7Single;
    }
    public void setType7Double(Long type7Double) 
    {
        this.type7Double = type7Double;
    }

    public Long getType7Double() 
    {
        return type7Double;
    }
    public void setType7Loong(Long type7Loong) 
    {
        this.type7Loong = type7Loong;
    }

    public Long getType7Loong() 
    {
        return type7Loong;
    }
    public void setType7Tiger(Long type7Tiger) 
    {
        this.type7Tiger = type7Tiger;
    }

    public Long getType7Tiger() 
    {
        return type7Tiger;
    }
    public void setType7Num1(Long type7Num1) 
    {
        this.type7Num1 = type7Num1;
    }

    public Long getType7Num1() 
    {
        return type7Num1;
    }
    public void setType7Num2(Long type7Num2) 
    {
        this.type7Num2 = type7Num2;
    }

    public Long getType7Num2() 
    {
        return type7Num2;
    }
    public void setType7Num3(Long type7Num3) 
    {
        this.type7Num3 = type7Num3;
    }

    public Long getType7Num3() 
    {
        return type7Num3;
    }
    public void setType7Num4(Long type7Num4) 
    {
        this.type7Num4 = type7Num4;
    }

    public Long getType7Num4() 
    {
        return type7Num4;
    }
    public void setType7Num5(Long type7Num5) 
    {
        this.type7Num5 = type7Num5;
    }

    public Long getType7Num5() 
    {
        return type7Num5;
    }
    public void setType7Num6(Long type7Num6) 
    {
        this.type7Num6 = type7Num6;
    }

    public Long getType7Num6() 
    {
        return type7Num6;
    }
    public void setType7Num7(Long type7Num7) 
    {
        this.type7Num7 = type7Num7;
    }

    public Long getType7Num7() 
    {
        return type7Num7;
    }
    public void setType7Num8(Long type7Num8) 
    {
        this.type7Num8 = type7Num8;
    }

    public Long getType7Num8() 
    {
        return type7Num8;
    }
    public void setType7Num9(Long type7Num9) 
    {
        this.type7Num9 = type7Num9;
    }

    public Long getType7Num9() 
    {
        return type7Num9;
    }
    public void setType7Num10(Long type7Num10) 
    {
        this.type7Num10 = type7Num10;
    }

    public Long getType7Num10() 
    {
        return type7Num10;
    }
    public void setType8Big(Long type8Big) 
    {
        this.type8Big = type8Big;
    }

    public Long getType8Big() 
    {
        return type8Big;
    }
    public void setType8Small(Long type8Small) 
    {
        this.type8Small = type8Small;
    }

    public Long getType8Small() 
    {
        return type8Small;
    }
    public void setType8Single(Long type8Single) 
    {
        this.type8Single = type8Single;
    }

    public Long getType8Single() 
    {
        return type8Single;
    }
    public void setType8Double(Long type8Double) 
    {
        this.type8Double = type8Double;
    }

    public Long getType8Double() 
    {
        return type8Double;
    }
    public void setType8Loong(Long type8Loong) 
    {
        this.type8Loong = type8Loong;
    }

    public Long getType8Loong() 
    {
        return type8Loong;
    }
    public void setType8Tiger(Long type8Tiger) 
    {
        this.type8Tiger = type8Tiger;
    }

    public Long getType8Tiger() 
    {
        return type8Tiger;
    }
    public void setType8Num1(Long type8Num1) 
    {
        this.type8Num1 = type8Num1;
    }

    public Long getType8Num1() 
    {
        return type8Num1;
    }
    public void setType8Num2(Long type8Num2) 
    {
        this.type8Num2 = type8Num2;
    }

    public Long getType8Num2() 
    {
        return type8Num2;
    }
    public void setType8Num3(Long type8Num3) 
    {
        this.type8Num3 = type8Num3;
    }

    public Long getType8Num3() 
    {
        return type8Num3;
    }
    public void setType8Num4(Long type8Num4) 
    {
        this.type8Num4 = type8Num4;
    }

    public Long getType8Num4() 
    {
        return type8Num4;
    }
    public void setType8Num5(Long type8Num5) 
    {
        this.type8Num5 = type8Num5;
    }

    public Long getType8Num5() 
    {
        return type8Num5;
    }
    public void setType8Num6(Long type8Num6) 
    {
        this.type8Num6 = type8Num6;
    }

    public Long getType8Num6() 
    {
        return type8Num6;
    }
    public void setType8Num7(Long type8Num7) 
    {
        this.type8Num7 = type8Num7;
    }

    public Long getType8Num7() 
    {
        return type8Num7;
    }
    public void setType8Num8(Long type8Num8) 
    {
        this.type8Num8 = type8Num8;
    }

    public Long getType8Num8() 
    {
        return type8Num8;
    }
    public void setType8Num9(Long type8Num9) 
    {
        this.type8Num9 = type8Num9;
    }

    public Long getType8Num9() 
    {
        return type8Num9;
    }
    public void setType8Num10(Long type8Num10) 
    {
        this.type8Num10 = type8Num10;
    }

    public Long getType8Num10() 
    {
        return type8Num10;
    }
    public void setType9Big(Long type9Big) 
    {
        this.type9Big = type9Big;
    }

    public Long getType9Big() 
    {
        return type9Big;
    }
    public void setType9Small(Long type9Small) 
    {
        this.type9Small = type9Small;
    }

    public Long getType9Small() 
    {
        return type9Small;
    }
    public void setType9Single(Long type9Single) 
    {
        this.type9Single = type9Single;
    }

    public Long getType9Single() 
    {
        return type9Single;
    }
    public void setType9Double(Long type9Double) 
    {
        this.type9Double = type9Double;
    }

    public Long getType9Double() 
    {
        return type9Double;
    }
    public void setType9Loong(Long type9Loong) 
    {
        this.type9Loong = type9Loong;
    }

    public Long getType9Loong() 
    {
        return type9Loong;
    }
    public void setType9Tiger(Long type9Tiger) 
    {
        this.type9Tiger = type9Tiger;
    }

    public Long getType9Tiger() 
    {
        return type9Tiger;
    }
    public void setType9Num1(Long type9Num1) 
    {
        this.type9Num1 = type9Num1;
    }

    public Long getType9Num1() 
    {
        return type9Num1;
    }
    public void setType9Num2(Long type9Num2) 
    {
        this.type9Num2 = type9Num2;
    }

    public Long getType9Num2() 
    {
        return type9Num2;
    }
    public void setType9Num3(Long type9Num3) 
    {
        this.type9Num3 = type9Num3;
    }

    public Long getType9Num3() 
    {
        return type9Num3;
    }
    public void setType9Num4(Long type9Num4) 
    {
        this.type9Num4 = type9Num4;
    }

    public Long getType9Num4() 
    {
        return type9Num4;
    }
    public void setType9Num5(Long type9Num5) 
    {
        this.type9Num5 = type9Num5;
    }

    public Long getType9Num5() 
    {
        return type9Num5;
    }
    public void setType9Num6(Long type9Num6) 
    {
        this.type9Num6 = type9Num6;
    }

    public Long getType9Num6() 
    {
        return type9Num6;
    }
    public void setType9Num7(Long type9Num7) 
    {
        this.type9Num7 = type9Num7;
    }

    public Long getType9Num7() 
    {
        return type9Num7;
    }
    public void setType9Num8(Long type9Num8) 
    {
        this.type9Num8 = type9Num8;
    }

    public Long getType9Num8() 
    {
        return type9Num8;
    }
    public void setType9Num9(Long type9Num9) 
    {
        this.type9Num9 = type9Num9;
    }

    public Long getType9Num9() 
    {
        return type9Num9;
    }
    public void setType9Num10(Long type9Num10) 
    {
        this.type9Num10 = type9Num10;
    }

    public Long getType9Num10() 
    {
        return type9Num10;
    }
    public void setType10Big(Long type10Big) 
    {
        this.type10Big = type10Big;
    }

    public Long getType10Big() 
    {
        return type10Big;
    }
    public void setType10Small(Long type10Small) 
    {
        this.type10Small = type10Small;
    }

    public Long getType10Small() 
    {
        return type10Small;
    }
    public void setType10Single(Long type10Single) 
    {
        this.type10Single = type10Single;
    }

    public Long getType10Single() 
    {
        return type10Single;
    }
    public void setType10Double(Long type10Double) 
    {
        this.type10Double = type10Double;
    }

    public Long getType10Double() 
    {
        return type10Double;
    }
    public void setType10Loong(Long type10Loong) 
    {
        this.type10Loong = type10Loong;
    }

    public Long getType10Loong() 
    {
        return type10Loong;
    }
    public void setType10Tiger(Long type10Tiger) 
    {
        this.type10Tiger = type10Tiger;
    }

    public Long getType10Tiger() 
    {
        return type10Tiger;
    }
    public void setType10Num1(Long type10Num1) 
    {
        this.type10Num1 = type10Num1;
    }

    public Long getType10Num1() 
    {
        return type10Num1;
    }
    public void setType10Num2(Long type10Num2) 
    {
        this.type10Num2 = type10Num2;
    }

    public Long getType10Num2() 
    {
        return type10Num2;
    }
    public void setType10Num3(Long type10Num3) 
    {
        this.type10Num3 = type10Num3;
    }

    public Long getType10Num3() 
    {
        return type10Num3;
    }
    public void setType10Num4(Long type10Num4) 
    {
        this.type10Num4 = type10Num4;
    }

    public Long getType10Num4() 
    {
        return type10Num4;
    }
    public void setType10Num5(Long type10Num5) 
    {
        this.type10Num5 = type10Num5;
    }

    public Long getType10Num5() 
    {
        return type10Num5;
    }
    public void setType10Num6(Long type10Num6) 
    {
        this.type10Num6 = type10Num6;
    }

    public Long getType10Num6() 
    {
        return type10Num6;
    }
    public void setType10Num7(Long type10Num7) 
    {
        this.type10Num7 = type10Num7;
    }

    public Long getType10Num7() 
    {
        return type10Num7;
    }
    public void setType10Num8(Long type10Num8) 
    {
        this.type10Num8 = type10Num8;
    }

    public Long getType10Num8() 
    {
        return type10Num8;
    }
    public void setType10Num9(Long type10Num9) 
    {
        this.type10Num9 = type10Num9;
    }

    public Long getType10Num9() 
    {
        return type10Num9;
    }
    public void setType10Num10(Long type10Num10) 
    {
        this.type10Num10 = type10Num10;
    }

    public Long getType10Num10() 
    {
        return type10Num10;
    }
    public void setType11Big(Long type11Big) 
    {
        this.type11Big = type11Big;
    }

    public Long getType11Big() 
    {
        return type11Big;
    }
    public void setType11Small(Long type11Small) 
    {
        this.type11Small = type11Small;
    }

    public Long getType11Small() 
    {
        return type11Small;
    }
    public void setType11Single(Long type11Single) 
    {
        this.type11Single = type11Single;
    }

    public Long getType11Single() 
    {
        return type11Single;
    }
    public void setType11Double(Long type11Double) 
    {
        this.type11Double = type11Double;
    }

    public Long getType11Double() 
    {
        return type11Double;
    }
    public void setType11Loong(Long type11Loong) 
    {
        this.type11Loong = type11Loong;
    }

    public Long getType11Loong() 
    {
        return type11Loong;
    }
    public void setType11Tiger(Long type11Tiger) 
    {
        this.type11Tiger = type11Tiger;
    }

    public Long getType11Tiger() 
    {
        return type11Tiger;
    }
    public void setType11Num1(Long type11Num1) 
    {
        this.type11Num1 = type11Num1;
    }

    public Long getType11Num1() 
    {
        return type11Num1;
    }
    public void setType11Num2(Long type11Num2) 
    {
        this.type11Num2 = type11Num2;
    }

    public Long getType11Num2() 
    {
        return type11Num2;
    }
    public void setType11Num3(Long type11Num3) 
    {
        this.type11Num3 = type11Num3;
    }

    public Long getType11Num3() 
    {
        return type11Num3;
    }
    public void setType11Num4(Long type11Num4) 
    {
        this.type11Num4 = type11Num4;
    }

    public Long getType11Num4() 
    {
        return type11Num4;
    }
    public void setType11Num5(Long type11Num5) 
    {
        this.type11Num5 = type11Num5;
    }

    public Long getType11Num5() 
    {
        return type11Num5;
    }
    public void setType11Num6(Long type11Num6) 
    {
        this.type11Num6 = type11Num6;
    }

    public Long getType11Num6() 
    {
        return type11Num6;
    }
    public void setType11Num7(Long type11Num7) 
    {
        this.type11Num7 = type11Num7;
    }

    public Long getType11Num7() 
    {
        return type11Num7;
    }
    public void setType11Num8(Long type11Num8) 
    {
        this.type11Num8 = type11Num8;
    }

    public Long getType11Num8() 
    {
        return type11Num8;
    }
    public void setType11Num9(Long type11Num9) 
    {
        this.type11Num9 = type11Num9;
    }

    public Long getType11Num9() 
    {
        return type11Num9;
    }
    public void setType11Num10(Long type11Num10) 
    {
        this.type11Num10 = type11Num10;
    }

    public Long getType11Num10() 
    {
        return type11Num10;
    }
    public void setBigSingle(Long bigSingle) 
    {
        this.bigSingle = bigSingle;
    }

    public Long getBigSingle() 
    {
        return bigSingle;
    }
    public void setBigDouble(Long bigDouble) 
    {
        this.bigDouble = bigDouble;
    }

    public Long getBigDouble() 
    {
        return bigDouble;
    }
    public void setSmallSingle(Long smallSingle) 
    {
        this.smallSingle = smallSingle;
    }

    public Long getSmallSingle() 
    {
        return smallSingle;
    }
    public void setSmallDouble(Long smallDouble) 
    {
        this.smallDouble = smallDouble;
    }

    public Long getSmallDouble() 
    {
        return smallDouble;
    }
    public void setHouse(Integer house) 
    {
        this.house = house;
    }

    public Integer getHouse() 
    {
        return house;
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
            .append("house", getHouse())
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
