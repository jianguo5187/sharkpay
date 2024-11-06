package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 系统开奖开奖历史对象 game_system_open_data
 * 
 * @author ruoyi
 * @date 2024-11-06
 */
public class GameSystemOpenData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 5球开奖历史ID */
    private Long id;

    /** 期数 */
    @Excel(name = "期数")
    private Long periods;

    /** 游戏开奖识别码 */
    @Excel(name = "游戏开奖识别码")
    private String gameSystemMark;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date openTime;

    /** 开奖号码 */
    @Excel(name = "开奖号码")
    private String openCode;

    /** 预开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 预开奖时间 */
    @Excel(name = "预开奖时间")
    private String preOpenCode;

    /** 开奖数据状态(0已开奖,1预开奖号码) */
    @Excel(name = "开奖数据状态(0已开奖,1预开奖号码)")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPeriods(Long periods) 
    {
        this.periods = periods;
    }

    public Long getPeriods() 
    {
        return periods;
    }
    public void setGameSystemMark(String gameSystemMark) 
    {
        this.gameSystemMark = gameSystemMark;
    }

    public String getGameSystemMark() 
    {
        return gameSystemMark;
    }
    public void setOpenTime(Date openTime) 
    {
        this.openTime = openTime;
    }

    public Date getOpenTime() 
    {
        return openTime;
    }
    public void setOpenCode(String openCode) 
    {
        this.openCode = openCode;
    }

    public String getOpenCode() 
    {
        return openCode;
    }
    public void setPreTime(Date preTime) 
    {
        this.preTime = preTime;
    }

    public Date getPreTime() 
    {
        return preTime;
    }
    public void setPreOpenCode(String preOpenCode) 
    {
        this.preOpenCode = preOpenCode;
    }

    public String getPreOpenCode() 
    {
        return preOpenCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("periods", getPeriods())
            .append("gameSystemMark", getGameSystemMark())
            .append("openTime", getOpenTime())
            .append("openCode", getOpenCode())
            .append("preTime", getPreTime())
            .append("preOpenCode", getPreOpenCode())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
