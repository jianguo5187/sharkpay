package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 游戏对象 sys_game
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
public class SysGame extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 游戏ID */
    private Long gameId;

    /** 游戏图片 */
    @Excel(name = "游戏图片")
    private String gameImg;

    /** 游戏类别 */
    @Excel(name = "游戏类别")
    private String gameType;

    /** 游戏标识ID */
    @Excel(name = "游戏标识ID")
    private String gameMarkId;

    /** 游戏开奖code */
    @Excel(name = "游戏开奖code")
    private String gameOpenCode;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 游戏别名 */
    @Excel(name = "游戏别名")
    private String gameAliasName;

    /** 描述 */
    @Excel(name = "描述")
    private String gameDescribe;

    /** 盈亏名 */
    @Excel(name = "盈亏名")
    private String profitLossName;

    /** 记录表 */
    @Excel(name = "记录表")
    private String gameRecord;

    /** 开奖表 */
    @Excel(name = "开奖表")
    private String gameKj;

    /** 佣金 */
    @Excel(name = "佣金")
    private Float gameCommission;

    /** 2级佣金 */
    @Excel(name = "2级佣金")
    private Float gameCommissionTwo;

    /** 回水彩种 */
    @Excel(name = "回水彩种")
    private String gameCate;

    /** 回水 */
    @Excel(name = "回水")
    private Float gameCashback;

    /** 最小投注金额 */
    @Excel(name = "最小投注金额")
    private Float minBetAmount;

    /** 最大投注金额 */
    @Excel(name = "最大投注金额")
    private Float maxBetAmount;

    /** 预计开奖延后时间 */
    @Excel(name = "预计开奖延后时间")
    private Integer leadTime;

    /** 封盘秒数 */
    @Excel(name = "封盘秒数")
    private Integer endTime;

    /** 开奖间隔秒数 */
    @Excel(name = "开奖间隔秒数")
    private Integer lotteryInterval;

    /** 机器人比例 */
    @Excel(name = "机器人比例")
    private Integer robotRate;

    /** 房间规则 */
    private String roomRule;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 游戏状态（0正常 1停用） */
    @Excel(name = "游戏状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 是否隐藏（N否 Y是） */
    @Excel(name = "是否隐藏", readConverterExp = "N=否,Y=是")
    private String isHidden;

    /** 房间模式 */
    private Long houseOpen;

    /** 游戏有效开奖开始时间 */
    @Excel(name = "游戏有效开奖开始时间")
    private String validOpenStartTime;

    /** 游戏有效开奖结束时间 */
    @Excel(name = "游戏有效开奖结束时间")
    private String validOpenEndTime;

    public void setGameId(Long gameId) 
    {
        this.gameId = gameId;
    }

    public Long getGameId() 
    {
        return gameId;
    }
    public void setGameImg(String gameImg) 
    {
        this.gameImg = gameImg;
    }

    public String getGameImg() 
    {
        return gameImg;
    }
    public void setGameType(String gameType)
    {
        this.gameType = gameType;
    }

    public String getGameType()
    {
        return gameType;
    }
    public void setGameMarkId(String gameMarkId) 
    {
        this.gameMarkId = gameMarkId;
    }

    public String getGameMarkId() 
    {
        return gameMarkId;
    }

    public String getGameOpenCode() {
        return gameOpenCode;
    }

    public void setGameOpenCode(String gameOpenCode) {
        this.gameOpenCode = gameOpenCode;
    }

    public void setGameName(String gameName)
    {
        this.gameName = gameName;
    }

    public String getGameName() 
    {
        return gameName;
    }
    public void setGameAliasName(String gameAliasName) 
    {
        this.gameAliasName = gameAliasName;
    }

    public String getGameAliasName() 
    {
        return gameAliasName;
    }
    public void setGameDescribe(String gameDescribe) 
    {
        this.gameDescribe = gameDescribe;
    }

    public String getGameDescribe() 
    {
        return gameDescribe;
    }
    public void setProfitLossName(String profitLossName) 
    {
        this.profitLossName = profitLossName;
    }

    public String getProfitLossName() 
    {
        return profitLossName;
    }
    public void setGameRecord(String gameRecord) 
    {
        this.gameRecord = gameRecord;
    }

    public String getGameRecord() 
    {
        return gameRecord;
    }
    public void setGameKj(String gameKj) 
    {
        this.gameKj = gameKj;
    }

    public String getGameKj() 
    {
        return gameKj;
    }
    public void setGameCommission(Float gameCommission)
    {
        this.gameCommission = gameCommission;
    }

    public Float getGameCommission()
    {
        return gameCommission;
    }
    public void setGameCommissionTwo(Float gameCommissionTwo)
    {
        this.gameCommissionTwo = gameCommissionTwo;
    }

    public Float getGameCommissionTwo()
    {
        return gameCommissionTwo;
    }
    public void setGameCate(String gameCate) 
    {
        this.gameCate = gameCate;
    }

    public String getGameCate() 
    {
        return gameCate;
    }
    public void setGameCashback(Float gameCashback)
    {
        this.gameCashback = gameCashback;
    }

    public Float getGameCashback()
    {
        return gameCashback;
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
    public void setEndTime(Integer endTime)
    {
        this.endTime = endTime;
    }

    public Integer getEndTime()
    {
        return endTime;
    }

    public Integer getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(Integer leadTime) {
        this.leadTime = leadTime;
    }

    public Integer getLotteryInterval() {
        return lotteryInterval;
    }

    public void setLotteryInterval(Integer lotteryInterval) {
        this.lotteryInterval = lotteryInterval;
    }

    public void setRobotRate(Integer robotRate)
    {
        this.robotRate = robotRate;
    }

    public Integer getRobotRate() 
    {
        return robotRate;
    }
    public void setRoomRule(String roomRule) 
    {
        this.roomRule = roomRule;
    }

    public String getRoomRule() 
    {
        return roomRule;
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
    public void setIsHidden(String isHidden) 
    {
        this.isHidden = isHidden;
    }

    public String getIsHidden() 
    {
        return isHidden;
    }
    public void setHouseOpen(Long houseOpen) 
    {
        this.houseOpen = houseOpen;
    }

    public Long getHouseOpen() 
    {
        return houseOpen;
    }
    public void setValidOpenStartTime(String validOpenStartTime)
    {
        this.validOpenStartTime = validOpenStartTime;
    }

    public String getValidOpenStartTime()
    {
        return validOpenStartTime;
    }
    public void setValidOpenEndTime(String validOpenEndTime)
    {
        this.validOpenEndTime = validOpenEndTime;
    }

    public String getValidOpenEndTime()
    {
        return validOpenEndTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("gameId", getGameId())
            .append("gameImg", getGameImg())
            .append("gameType", getGameType())
            .append("gameMarkId", getGameMarkId())
            .append("gameName", getGameName())
            .append("gameAliasName", getGameAliasName())
            .append("gameDescribe", getGameDescribe())
            .append("profitLossName", getProfitLossName())
            .append("gameRecord", getGameRecord())
            .append("gameKj", getGameKj())
            .append("gameCommission", getGameCommission())
            .append("gameCommissionTwo", getGameCommissionTwo())
            .append("gameCate", getGameCate())
            .append("gameCashback", getGameCashback())
            .append("minBetAmount", getMinBetAmount())
            .append("maxBetAmount", getMaxBetAmount())
            .append("endTime", getEndTime())
            .append("robotRate", getRobotRate())
            .append("roomRule", getRoomRule())
            .append("sort", getSort())
            .append("status", getStatus())
            .append("isHidden", getIsHidden())
            .append("houseOpen", getHouseOpen())
            .append("validOpenStartTime", getValidOpenStartTime())
            .append("validOpenEndTime", getValidOpenEndTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
