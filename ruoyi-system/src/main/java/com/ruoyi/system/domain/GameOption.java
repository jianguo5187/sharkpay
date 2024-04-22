package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 转化对象 game_option
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
public class GameOption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 转化表ID */
    private Long id;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 投注字段KEY */
    @Excel(name = "投注字段KEY")
    private String key;

    /** 投注字段名称 */
    @Excel(name = "投注字段名称")
    private String title;

    /** 投注类型 */
    @Excel(name = "投注类型")
    private Integer playGroup;

    /** 投注类型名称 */
    @Excel(name = "投注类型名称")
    private String playGroupTitle;

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
    public void setKey(String key) 
    {
        this.key = key;
    }

    public String getKey() 
    {
        return key;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setPlayGroup(Integer playGroup) 
    {
        this.playGroup = playGroup;
    }

    public Integer getPlayGroup() 
    {
        return playGroup;
    }
    public void setPlayGroupTitle(String playGroupTitle) 
    {
        this.playGroupTitle = playGroupTitle;
    }

    public String getPlayGroupTitle() 
    {
        return playGroupTitle;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("gameId", getGameId())
            .append("key", getKey())
            .append("title", getTitle())
            .append("playGroup", getPlayGroup())
            .append("playGroupTitle", getPlayGroupTitle())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
