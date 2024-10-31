package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 3球特殊赔率对象 game_threeball_mixed_odds
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
public class GameThreeballMixedOdds extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 赔率表ID */
    private Long mixedOddsId;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 13,14大小单双额度下限 */
    @Excel(name = "13,14大小单双额度下限")
    private Float numberMinQuota;

    /** 13,14大小单双额度上限 */
    @Excel(name = "13,14大小单双额度上限")
    private Float numberMaxQuota;

    /** 13,14大小单双小于下限赔率 */
    @Excel(name = "13,14大小单双小于下限赔率")
    private Float lessNumberOdd;

    /** 13,14大小单双中间赔率 */
    @Excel(name = "13,14大小单双中间赔率")
    private Float centerNumberOdd;

    /** 13,14大小单双大于下限赔率 */
    @Excel(name = "13,14大小单双大于下限赔率")
    private Float greaterNumberOdd;

    /** 13,14组合额度下限 */
    @Excel(name = "13,14组合额度下限")
    private Float comboNumberMinQuota;

    /** 13,14大小单双额度上限 */
    @Excel(name = "13,14组合额度上限")
    private Float comboNumberMaxQuota;

    /** 13,14大小单双小于下限赔率 */
    @Excel(name = "13,14组合小于下限赔率")
    private Float comboLessNumberOdd;

    /** 13,14大小单双中间赔率 */
    @Excel(name = "13,14组合中间赔率")
    private Float comboCenterNumberOdd;

    /** 13,14大小单双大于下限赔率 */
    @Excel(name = "13,14组合大于下限赔率")
    private Float comboGreaterNumberOdd;

    /** 顺对豹额度下限 */
    @Excel(name = "顺对豹额度下限")
    private Float sdbMinQuota;

    /** 顺对豹额度上限 */
    @Excel(name = "顺对豹额度上限")
    private Float sdbMaxQuota;

    /** 顺对豹小于下限赔率 */
    @Excel(name = "顺对豹小于下限赔率")
    private Float lessSdbOdd;

    /** 顺对豹中间赔率 */
    @Excel(name = "顺对豹中间赔率")
    private Float centerSdbOdd;

    /** 顺对豹大于下限赔率 */
    @Excel(name = "顺对豹大于下限赔率")
    private Float greaterSdbOdd;

    /** 0,9额度下限 */
    @Excel(name = "0,9额度下限")
    private Float zeroNineMinQuota;

    /** 0,9额度上限 */
    @Excel(name = "0,9额度上限")
    private Float zeroNineMaxQuota;

    /** 0,9小于下限赔率 */
    @Excel(name = "0,9小于下限赔率")
    private Float lessZeroNineOdd;

    /** 0,9中间赔率 */
    @Excel(name = "0,9中间赔率")
    private Float centerZeroNineOdd;

    /** 0,9大于下限赔率 */
    @Excel(name = "0,9大于下限赔率")
    private Float greaterZeroNineOdd;

    public void setMixedOddsId(Long mixedOddsId) 
    {
        this.mixedOddsId = mixedOddsId;
    }

    public Long getMixedOddsId() 
    {
        return mixedOddsId;
    }
    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }
    public void setNumberMinQuota(Float numberMinQuota) 
    {
        this.numberMinQuota = numberMinQuota;
    }

    public Float getNumberMinQuota() 
    {
        return numberMinQuota;
    }
    public void setNumberMaxQuota(Float numberMaxQuota) 
    {
        this.numberMaxQuota = numberMaxQuota;
    }

    public Float getNumberMaxQuota() 
    {
        return numberMaxQuota;
    }
    public void setLessNumberOdd(Float lessNumberOdd) 
    {
        this.lessNumberOdd = lessNumberOdd;
    }

    public Float getLessNumberOdd() 
    {
        return lessNumberOdd;
    }
    public void setCenterNumberOdd(Float centerNumberOdd) 
    {
        this.centerNumberOdd = centerNumberOdd;
    }

    public Float getCenterNumberOdd() 
    {
        return centerNumberOdd;
    }
    public void setGreaterNumberOdd(Float greaterNumberOdd) 
    {
        this.greaterNumberOdd = greaterNumberOdd;
    }

    public Float getGreaterNumberOdd() 
    {
        return greaterNumberOdd;
    }

    public Float getComboNumberMinQuota() {
        return comboNumberMinQuota;
    }

    public void setComboNumberMinQuota(Float comboNumberMinQuota) {
        this.comboNumberMinQuota = comboNumberMinQuota;
    }

    public Float getComboNumberMaxQuota() {
        return comboNumberMaxQuota;
    }

    public void setComboNumberMaxQuota(Float comboNumberMaxQuota) {
        this.comboNumberMaxQuota = comboNumberMaxQuota;
    }

    public Float getComboLessNumberOdd() {
        return comboLessNumberOdd;
    }

    public void setComboLessNumberOdd(Float comboLessNumberOdd) {
        this.comboLessNumberOdd = comboLessNumberOdd;
    }

    public Float getComboCenterNumberOdd() {
        return comboCenterNumberOdd;
    }

    public void setComboCenterNumberOdd(Float comboCenterNumberOdd) {
        this.comboCenterNumberOdd = comboCenterNumberOdd;
    }

    public Float getComboGreaterNumberOdd() {
        return comboGreaterNumberOdd;
    }

    public void setComboGreaterNumberOdd(Float comboGreaterNumberOdd) {
        this.comboGreaterNumberOdd = comboGreaterNumberOdd;
    }

    public void setSdbMinQuota(Float sdbMinQuota)
    {
        this.sdbMinQuota = sdbMinQuota;
    }

    public Float getSdbMinQuota() 
    {
        return sdbMinQuota;
    }
    public void setSdbMaxQuota(Float sdbMaxQuota) 
    {
        this.sdbMaxQuota = sdbMaxQuota;
    }

    public Float getSdbMaxQuota() 
    {
        return sdbMaxQuota;
    }
    public void setLessSdbOdd(Float lessSdbOdd) 
    {
        this.lessSdbOdd = lessSdbOdd;
    }

    public Float getLessSdbOdd() 
    {
        return lessSdbOdd;
    }
    public void setCenterSdbOdd(Float centerSdbOdd) 
    {
        this.centerSdbOdd = centerSdbOdd;
    }

    public Float getCenterSdbOdd() 
    {
        return centerSdbOdd;
    }
    public void setGreaterSdbOdd(Float greaterSdbOdd) 
    {
        this.greaterSdbOdd = greaterSdbOdd;
    }

    public Float getGreaterSdbOdd() 
    {
        return greaterSdbOdd;
    }
    public void setZeroNineMinQuota(Float zeroNineMinQuota) 
    {
        this.zeroNineMinQuota = zeroNineMinQuota;
    }

    public Float getZeroNineMinQuota() 
    {
        return zeroNineMinQuota;
    }
    public void setZeroNineMaxQuota(Float zeroNineMaxQuota) 
    {
        this.zeroNineMaxQuota = zeroNineMaxQuota;
    }

    public Float getZeroNineMaxQuota() 
    {
        return zeroNineMaxQuota;
    }
    public void setLessZeroNineOdd(Float lessZeroNineOdd) 
    {
        this.lessZeroNineOdd = lessZeroNineOdd;
    }

    public Float getLessZeroNineOdd() 
    {
        return lessZeroNineOdd;
    }
    public void setCenterZeroNineOdd(Float centerZeroNineOdd) 
    {
        this.centerZeroNineOdd = centerZeroNineOdd;
    }

    public Float getCenterZeroNineOdd() 
    {
        return centerZeroNineOdd;
    }
    public void setGreaterZeroNineOdd(Float greaterZeroNineOdd) 
    {
        this.greaterZeroNineOdd = greaterZeroNineOdd;
    }

    public Float getGreaterZeroNineOdd() 
    {
        return greaterZeroNineOdd;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("mixedOddsId", getMixedOddsId())
            .append("gameId", getGameId())
            .append("numberMinQuota", getNumberMinQuota())
            .append("numberMaxQuota", getNumberMaxQuota())
            .append("lessNumberOdd", getLessNumberOdd())
            .append("centerNumberOdd", getCenterNumberOdd())
            .append("greaterNumberOdd", getGreaterNumberOdd())
            .append("sdbMinQuota", getSdbMinQuota())
            .append("sdbMaxQuota", getSdbMaxQuota())
            .append("lessSdbOdd", getLessSdbOdd())
            .append("centerSdbOdd", getCenterSdbOdd())
            .append("greaterSdbOdd", getGreaterSdbOdd())
            .append("zeroNineMinQuota", getZeroNineMinQuota())
            .append("zeroNineMaxQuota", getZeroNineMaxQuota())
            .append("lessZeroNineOdd", getLessZeroNineOdd())
            .append("centerZeroNineOdd", getCenterZeroNineOdd())
            .append("greaterZeroNineOdd", getGreaterZeroNineOdd())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
