package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投注话术对象 robot_bet_option
 * 
 * @author ruoyi
 * @date 2024-12-02
 */
public class RobotBetOption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 投注话术ID */
    private Long id;

    /** 机器人投注游戏 */
    @Excel(name = "机器人投注游戏")
    private Long gameId;


    /** 游戏名 */
    private String gameName;

    /** 投注类别/号码/金额 */
    @Excel(name = "投注类别/号码/金额")
    private String betItemOption;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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

    public void setBetItemOption(String betItemOption)
    {
        this.betItemOption = betItemOption;
    }

    public String getBetItemOption() 
    {
        return betItemOption;
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
            .append("id", getId())
            .append("gameId", getGameId())
            .append("betItemOption", getBetItemOption())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
