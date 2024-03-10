package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 游戏玩法对象 sys_bet_type
 * 
 * @author ruoyi
 * @date 2024-03-10
 */
public class SysBetType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 游戏玩法ID */
    private Long betTypeId;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 游戏玩法名 */
    @Excel(name = "游戏玩法名")
    private String betTypeName;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 游戏状态（0正常 1停用） */
    @Excel(name = "游戏状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setBetTypeId(Long betTypeId) 
    {
        this.betTypeId = betTypeId;
    }

    public Long getBetTypeId() 
    {
        return betTypeId;
    }
    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public void setBetTypeName(String betTypeName)
    {
        this.betTypeName = betTypeName;
    }

    public String getBetTypeName() 
    {
        return betTypeName;
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
            .append("betTypeId", getBetTypeId())
            .append("gameId", getGameId())
            .append("betTypeName", getBetTypeName())
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
