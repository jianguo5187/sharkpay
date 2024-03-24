package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投注单对象 bet_record
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class BetRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 投注单ID */
    private Long betId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 期数 */
    @Excel(name = "期数")
    private Long periods;

    /** 投注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "投注时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordTime;

    /** 校准时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "校准时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timeCheckpoint;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 玩法分类 */
    @Excel(name = "玩法分类")
    private String playType;

    /** 投注内容 */
    @Excel(name = "投注内容")
    private String playDetail;

    /** 游戏种类 */
    @Excel(name = "游戏种类")
    private Integer playGroup;

    /** 操作 */
    @Excel(name = "操作")
    private Integer option;

    /** 投注金额 */
    @Excel(name = "投注金额")
    private Float money;

    /** 投注后用户余额 */
    @Excel(name = "投注后用户余额")
    private Float balance;

    /** 输赢结果 */
    @Excel(name = "输赢结果")
    private Float accountResult;

    /** 结算区分（0未结算 1已结算） */
    @Excel(name = "结算区分", readConverterExp = "0=未结算,1=已结算")
    private String settleFlg;

    /** 开奖结果 */
    @Excel(name = "开奖结果")
    private String gameResult;

    /** 是否删除(0否 1是) */
    @Excel(name = "是否删除(0否 1是)")
    private String isDelete;

    /** 是否机器人下注 */
    @Excel(name = "是否机器人下注")
    private String isRobot;

    /** 机器人下注昵称 */
    @Excel(name = "机器人下注昵称")
    private String robotNickName;

    /** 机器人下注头像 */
    @Excel(name = "机器人下注头像")
    private String robotPic;

    /** 机器人下注图片 */
    @Excel(name = "机器人下注图片")
    private String robotImg;

    /** 房间号 */
    @Excel(name = "房间号")
    private Long houseId;

    public void setBetId(Long betId) 
    {
        this.betId = betId;
    }

    public Long getBetId() 
    {
        return betId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setPeriods(Long periods) 
    {
        this.periods = periods;
    }

    public Long getPeriods() 
    {
        return periods;
    }
    public void setRecordTime(Date recordTime) 
    {
        this.recordTime = recordTime;
    }

    public Date getRecordTime() 
    {
        return recordTime;
    }
    public void setTimeCheckpoint(Date timeCheckpoint) 
    {
        this.timeCheckpoint = timeCheckpoint;
    }

    public Date getTimeCheckpoint() 
    {
        return timeCheckpoint;
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
    public void setPlayType(String playType) 
    {
        this.playType = playType;
    }

    public String getPlayType() 
    {
        return playType;
    }
    public void setPlayDetail(String playDetail) 
    {
        this.playDetail = playDetail;
    }

    public String getPlayDetail() 
    {
        return playDetail;
    }
    public void setPlayGroup(Integer playGroup) 
    {
        this.playGroup = playGroup;
    }

    public Integer getPlayGroup() 
    {
        return playGroup;
    }
    public void setOption(Integer option) 
    {
        this.option = option;
    }

    public Integer getOption()
    {
        return option;
    }
    public void setMoney(Float money)
    {
        this.money = money;
    }

    public Float getMoney()
    {
        return money;
    }
    public void setBalance(Float balance)
    {
        this.balance = balance;
    }

    public Float getBalance()
    {
        return balance;
    }
    public void setAccountResult(Float accountResult)
    {
        this.accountResult = accountResult;
    }

    public Float getAccountResult()
    {
        return accountResult;
    }
    public void setSettleFlg(String settleFlg) 
    {
        this.settleFlg = settleFlg;
    }

    public String getSettleFlg() 
    {
        return settleFlg;
    }
    public void setGameResult(String gameResult) 
    {
        this.gameResult = gameResult;
    }

    public String getGameResult() 
    {
        return gameResult;
    }
    public void setIsDelete(String isDelete) 
    {
        this.isDelete = isDelete;
    }

    public String getIsDelete() 
    {
        return isDelete;
    }
    public void setIsRobot(String isRobot) 
    {
        this.isRobot = isRobot;
    }

    public String getIsRobot() 
    {
        return isRobot;
    }
    public void setRobotNickName(String robotNickName) 
    {
        this.robotNickName = robotNickName;
    }

    public String getRobotNickName() 
    {
        return robotNickName;
    }
    public void setRobotPic(String robotPic) 
    {
        this.robotPic = robotPic;
    }

    public String getRobotPic() 
    {
        return robotPic;
    }
    public void setRobotImg(String robotImg) 
    {
        this.robotImg = robotImg;
    }

    public String getRobotImg() 
    {
        return robotImg;
    }
    public void setHouseId(Long houseId) 
    {
        this.houseId = houseId;
    }

    public Long getHouseId() 
    {
        return houseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("betId", getBetId())
            .append("userId", getUserId())
            .append("periods", getPeriods())
            .append("recordTime", getRecordTime())
            .append("timeCheckpoint", getTimeCheckpoint())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("playType", getPlayType())
            .append("playDetail", getPlayDetail())
            .append("playGroup", getPlayGroup())
            .append("option", getOption())
            .append("money", getMoney())
            .append("balance", getBalance())
            .append("accountResult", getAccountResult())
            .append("settleFlg", getSettleFlg())
            .append("gameResult", getGameResult())
            .append("isDelete", getIsDelete())
            .append("isRobot", getIsRobot())
            .append("robotNickName", getRobotNickName())
            .append("robotPic", getRobotPic())
            .append("robotImg", getRobotImg())
            .append("houseId", getHouseId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
