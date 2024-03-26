package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 游戏投注项对象 sys_bet_item
 * 
 * @author ruoyi
 * @date 2024-03-25
 */
public class SysBetItem extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 游戏投注项ID */
    private Long betItemId;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 投注项类别 */
    @Excel(name = "投注项类别")
    private Long betItemType;

    /** 投注项cd */
    @Excel(name = "投注项cd")
    private String betItemCode;

    /** 投注项名 */
    @Excel(name = "投注项名")
    private String betItemName;

    /** 特色定义内容 */
    @Excel(name = "特色定义内容")
    private String betItemDescribe;

    /** 赔率 */
    @Excel(name = "赔率")
    private Float odd;

    /** 最小投注金额 */
    @Excel(name = "最小投注金额")
    private Float minBetAmount;

    /** 最大投注金额 */
    @Excel(name = "最大投注金额")
    private Float maxBetAmount;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 投注项状态（0正常 1停用） */
    @Excel(name = "投注项状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setBetItemId(Long betItemId) 
    {
        this.betItemId = betItemId;
    }

    public Long getBetItemId() 
    {
        return betItemId;
    }
    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }
    public void setBetItemType(Long betItemType) 
    {
        this.betItemType = betItemType;
    }

    public Long getBetItemType() 
    {
        return betItemType;
    }
    public void setBetItemCode(String betItemCode) 
    {
        this.betItemCode = betItemCode;
    }

    public String getBetItemCode() 
    {
        return betItemCode;
    }
    public void setBetItemName(String betItemName) 
    {
        this.betItemName = betItemName;
    }

    public String getBetItemName() 
    {
        return betItemName;
    }
    public void setBetItemDescribe(String betItemDescribe) 
    {
        this.betItemDescribe = betItemDescribe;
    }

    public String getBetItemDescribe() 
    {
        return betItemDescribe;
    }
    public void setOdd(Float odd) 
    {
        this.odd = odd;
    }

    public Float getOdd() 
    {
        return odd;
    }
    public void setMinBetAmount(Float minBetAmount) 
    {
        this.minBetAmount = minBetAmount;
    }

    public Float getMinBetAmount() 
    {
        return minBetAmount;
    }
    public void setMaxBetAmount(Float maxBetAmount) 
    {
        this.maxBetAmount = maxBetAmount;
    }

    public Float getMaxBetAmount() 
    {
        return maxBetAmount;
    }
    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("betItemId", getBetItemId())
            .append("gameId", getGameId())
            .append("betItemType", getBetItemType())
            .append("betItemCode", getBetItemCode())
            .append("betItemName", getBetItemName())
            .append("betItemDescribe", getBetItemDescribe())
            .append("odd", getOdd())
            .append("minBetAmount", getMinBetAmount())
            .append("maxBetAmount", getMaxBetAmount())
            .append("sort", getSort())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
