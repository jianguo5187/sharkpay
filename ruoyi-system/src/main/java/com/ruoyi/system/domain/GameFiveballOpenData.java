package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 5球开奖历史对象 game_fiveball_open_data
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public class GameFiveballOpenData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 5球开奖历史ID */
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
    private Integer num1;

    /** 开奖号码2 */
    @Excel(name = "开奖号码2")
    private Integer num2;

    /** 开奖号码3 */
    @Excel(name = "开奖号码3")
    private Integer num3;

    /** 开奖号码4 */
    @Excel(name = "开奖号码4")
    private Integer num4;

    /** 开奖号码5 */
    @Excel(name = "开奖号码5")
    private Integer num5;

    /** 预开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预开奖时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date preTime;

    /** 预开奖号码1 */
    @Excel(name = "预开奖号码1")
    private Integer preNum1;

    /** 预开奖号码2 */
    @Excel(name = "预开奖号码2")
    private Integer preNum2;

    /** 预开奖号码3 */
    @Excel(name = "预开奖号码3")
    private Integer preNum3;

    /** 预开奖号码4 */
    @Excel(name = "预开奖号码4")
    private Integer preNum4;

    /** 预开奖号码5 */
    @Excel(name = "预开奖号码5")
    private Integer preNum5;

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

    public Integer getNum1() {
        return num1;
    }

    public void setNum1(Integer num1) {
        this.num1 = num1;
    }

    public Integer getNum2() {
        return num2;
    }

    public void setNum2(Integer num2) {
        this.num2 = num2;
    }

    public Integer getNum3() {
        return num3;
    }

    public void setNum3(Integer num3) {
        this.num3 = num3;
    }

    public Integer getNum4() {
        return num4;
    }

    public void setNum4(Integer num4) {
        this.num4 = num4;
    }

    public Integer getNum5() {
        return num5;
    }

    public void setNum5(Integer num5) {
        this.num5 = num5;
    }
    public void setPreTime(Date preTime)
    {
        this.preTime = preTime;
    }

    public Date getPreTime()
    {
        return preTime;
    }
    public void setPreNum1(Integer preNum1)
    {
        this.preNum1 = preNum1;
    }

    public Integer getPreNum1()
    {
        return preNum1;
    }
    public void setPreNum2(Integer preNum2)
    {
        this.preNum2 = preNum2;
    }

    public Integer getPreNum2()
    {
        return preNum2;
    }
    public void setPreNum3(Integer preNum3)
    {
        this.preNum3 = preNum3;
    }

    public Integer getPreNum3()
    {
        return preNum3;
    }
    public void setPreNum4(Integer preNum4)
    {
        this.preNum4 = preNum4;
    }

    public Integer getPreNum4()
    {
        return preNum4;
    }
    public void setPreNum5(Integer preNum5)
    {
        this.preNum5 = preNum5;
    }

    public Integer getPreNum5()
    {
        return preNum5;
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
            .append("periods", getPeriods())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("time", getTime())
            .append("num1", getNum1())
            .append("num2", getNum2())
            .append("num3", getNum3())
            .append("num4", getNum4())
            .append("num5", getNum5())
            .append("preTime", getPreTime())
            .append("preNum1", getPreNum1())
            .append("preNum2", getPreNum2())
            .append("preNum3", getPreNum3())
            .append("preNum4", getPreNum4())
            .append("preNum5", getPreNum5())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
