package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 3球开奖历史对象 game_threeball_open_data
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameThreeballOpenData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 3球开奖历史ID */
    private Long id;

    /** 期数 */
    @Excel(name = "期数")
    private Long periods;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date time;

    /** 开奖号码1 */
    @Excel(name = "开奖号码1")
    private Integer sum1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer sum2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer sum3;

    /** 预开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 预开奖号码1 */
    @Excel(name = "预开奖号码1")
    private Integer preSum1;

    /** 预开奖号码2 */
    @Excel(name = "预开奖号码2")
    private Integer preSum2;

    /** 预开奖号码3 */
    @Excel(name = "预开奖号码3")
    private Integer preSum3;

    /** 开奖数据状态(0已开奖,1预开奖号码) */
    @Excel(name = "开奖数据状态(0已开奖,1预开奖号码)")
    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSum1() {
        return sum1;
    }

    public void setSum1(Integer sum1) {
        this.sum1 = sum1;
    }

    public Integer getSum2() {
        return sum2;
    }

    public void setSum2(Integer sum2) {
        this.sum2 = sum2;
    }

    public Integer getSum3() {
        return sum3;
    }

    public void setSum3(Integer sum3) {
        this.sum3 = sum3;
    }
    public void setPreTime(Date preTime)
    {
        this.preTime = preTime;
    }

    public Date getPreTime()
    {
        return preTime;
    }
    public void setPreSum1(Integer preSum1)
    {
        this.preSum1 = preSum1;
    }

    public Integer getPreSum1()
    {
        return preSum1;
    }
    public void setPreSum2(Integer preSum2)
    {
        this.preSum2 = preSum2;
    }

    public Integer getPreSum2()
    {
        return preSum2;
    }
    public void setPreSum3(Integer preSum3)
    {
        this.preSum3 = preSum3;
    }

    public Integer getPreSum3()
    {
        return preSum3;
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
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("time", getTime())
            .append("sum1", getSum1())
            .append("sum2", getSum2())
            .append("sum3", getSum3())
            .append("preTime", getPreTime())
            .append("preSum1", getPreSum1())
            .append("preSum2", getPreSum2())
            .append("preSum3", getPreSum3())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
