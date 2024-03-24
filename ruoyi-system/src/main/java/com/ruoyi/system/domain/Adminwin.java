package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 管理员盈亏对象 adminwin
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public class Adminwin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 管理员盈亏ID */
    private Long id;

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "盈亏时间(YMD)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date winTime;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 今日盈亏金额 */
    @Excel(name = "今日盈亏金额")
    private Float winMoney;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setWinTime(Date winTime) 
    {
        this.winTime = winTime;
    }

    public Date getWinTime() 
    {
        return winTime;
    }
    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }
    public void setGameName(String gameName) 
    {
        this.gameName = gameName;
    }

    public String getGameName() 
    {
        return gameName;
    }
    public void setWinMoney(Float winMoney) 
    {
        this.winMoney = winMoney;
    }

    public Float getWinMoney() 
    {
        return winMoney;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("winTime", getWinTime())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("winMoney", getWinMoney())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
