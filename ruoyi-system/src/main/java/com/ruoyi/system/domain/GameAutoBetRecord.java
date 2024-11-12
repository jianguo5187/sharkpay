package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 追号对象 game_auto_bet_record
 *
 * @author ruoyi
 * @date 2024-11-11
 */
public class GameAutoBetRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 追号表ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 起始期数 */
    @Excel(name = "起始期数")
    private Long startPeriods;

    /** 当前期数 */
    @Excel(name = "当前期数")
    private Long nowPeriods;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 追号投注类型 */
    @Excel(name = "追号投注类型")
    private Integer autoBetType;

    /** 追号投注号码 */
    @Excel(name = "追号投注号码")
    private String autoBetNumber;

    /** 追停状态（0否 1是） */
    @Excel(name = "追停状态", readConverterExp = "0=否,1=是")
    private String winStopStatus;

    /** 追号期数 */
    @Excel(name = "追号期数")
    private Integer autoBetCount;

    /** 追号倍数 */
    @Excel(name = "追号倍数")
    private Integer autoBetTimes;

    /** 追号金额 */
    @Excel(name = "追号金额")
    private Float autoBetMoney;

    /** 剩余期数 */
    @Excel(name = "剩余期数")
    private Integer remainCount;

    /** 下注金额 */
    @Excel(name = "下注金额")
    private Float countMoney;

    /** 中奖金额 */
    @Excel(name = "中奖金额")
    private Float winMoney;

    /** 中奖次数 */
    @Excel(name = "中奖次数")
    private Integer winCount;

    /** 追号状态（0正常 1已停） */
    @Excel(name = "追号状态", readConverterExp = "0=正常,1=已停")
    private String status;

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
    public void setStartPeriods(Long startPeriods)
    {
        this.startPeriods = startPeriods;
    }

    public Long getStartPeriods()
    {
        return startPeriods;
    }
    public void setNowPeriods(Long nowPeriods)
    {
        this.nowPeriods = nowPeriods;
    }

    public Long getNowPeriods()
    {
        return nowPeriods;
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
    public void setAutoBetType(Integer autoBetType)
    {
        this.autoBetType = autoBetType;
    }

    public Integer getAutoBetType()
    {
        return autoBetType;
    }
    public void setAutoBetNumber(String autoBetNumber)
    {
        this.autoBetNumber = autoBetNumber;
    }

    public String getAutoBetNumber()
    {
        return autoBetNumber;
    }
    public void setWinStopStatus(String winStopStatus)
    {
        this.winStopStatus = winStopStatus;
    }

    public String getWinStopStatus()
    {
        return winStopStatus;
    }
    public void setAutoBetCount(Integer autoBetCount)
    {
        this.autoBetCount = autoBetCount;
    }

    public Integer getAutoBetCount()
    {
        return autoBetCount;
    }
    public void setAutoBetTimes(Integer autoBetTimes)
    {
        this.autoBetTimes = autoBetTimes;
    }

    public Integer getAutoBetTimes()
    {
        return autoBetTimes;
    }
    public void setAutoBetMoney(Float autoBetMoney)
    {
        this.autoBetMoney = autoBetMoney;
    }

    public Float getAutoBetMoney()
    {
        return autoBetMoney;
    }
    public void setRemainCount(Integer remainCount)
    {
        this.remainCount = remainCount;
    }

    public Integer getRemainCount()
    {
        return remainCount;
    }
    public void setCountMoney(Float countMoney)
    {
        this.countMoney = countMoney;
    }

    public Float getCountMoney()
    {
        return countMoney;
    }
    public void setWinMoney(Float winMoney)
    {
        this.winMoney = winMoney;
    }

    public Float getWinMoney()
    {
        return winMoney;
    }
    public void setWinCount(Integer winCount)
    {
        this.winCount = winCount;
    }

    public Integer getWinCount()
    {
        return winCount;
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
                .append("userId", getUserId())
                .append("startPeriods", getStartPeriods())
                .append("nowPeriods", getNowPeriods())
                .append("gameId", getGameId())
                .append("gameName", getGameName())
                .append("autoBetType", getAutoBetType())
                .append("autoBetNumber", getAutoBetNumber())
                .append("winStopStatus", getWinStopStatus())
                .append("autoBetCount", getAutoBetCount())
                .append("autoBetTimes", getAutoBetTimes())
                .append("autoBetMoney", getAutoBetMoney())
                .append("remainCount", getRemainCount())
                .append("countMoney", getCountMoney())
                .append("winMoney", getWinMoney())
                .append("winCount", getWinCount())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
