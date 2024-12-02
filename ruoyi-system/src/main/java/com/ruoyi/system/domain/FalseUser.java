package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投注机器人对象 false_user
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class FalseUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 机器人ID */
    private Long id;

    /** 机器人昵称 */
    @Excel(name = "机器人昵称")
    private String userName;

    /** 机器人账号 */
    @Excel(name = "机器人账号")
    private String user;

    /** 机器人头像 */
    @Excel(name = "机器人头像")
    private String robotPic;

    /** 机器人投注金额 */
    @Excel(name = "机器人投注金额")
    private String robotBetMoney;

    /** 机器人投注号码 */
    @Excel(name = "机器人投注号码")
    private String robotBetNum;

    /** 机器人投注时间 */
    @Excel(name = "机器人投注时间")
    private String robotBetTime;

    /** 机器人投注游戏 */
    @Excel(name = "机器人投注游戏")
    private Long gameId;
    private String gameName;

    /** 机器人等级id */
    @Excel(name = "机器人等级id")
    private Integer groupId;

    /** 玩法车道:pk10和飞艇默认0，即为冠亚和值，大于零则随机为1-10车道 */
    @Excel(name = "玩法车道:pk10和飞艇默认0，即为冠亚和值，大于零则随机为1-10车道")
    private Integer playType;

    /** 最小次数 */
    @Excel(name = "最小次数")
    private Integer minBetCount;

    /** 最大次数 */
    @Excel(name = "最大次数")
    private Integer maxBetCount;

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
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setUser(String user) 
    {
        this.user = user;
    }

    public String getUser() 
    {
        return user;
    }
    public void setRobotPic(String robotPic) 
    {
        this.robotPic = robotPic;
    }

    public String getRobotPic() 
    {
        return robotPic;
    }
    public void setRobotBetMoney(String robotBetMoney) 
    {
        this.robotBetMoney = robotBetMoney;
    }

    public String getRobotBetMoney() 
    {
        return robotBetMoney;
    }
    public void setRobotBetNum(String robotBetNum) 
    {
        this.robotBetNum = robotBetNum;
    }

    public String getRobotBetNum() 
    {
        return robotBetNum;
    }
    public void setRobotBetTime(String robotBetTime) 
    {
        this.robotBetTime = robotBetTime;
    }

    public String getRobotBetTime() 
    {
        return robotBetTime;
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
    public void setGroupId(Integer groupId) 
    {
        this.groupId = groupId;
    }

    public Integer getGroupId() 
    {
        return groupId;
    }
    public void setPlayType(Integer playType) 
    {
        this.playType = playType;
    }

    public Integer getPlayType() 
    {
        return playType;
    }
    public void setMinBetCount(Integer minBetCount)
    {
        this.minBetCount = minBetCount;
    }

    public Integer getMinBetCount()
    {
        return minBetCount;
    }
    public void setMaxBetCount(Integer maxBetCount)
    {
        this.maxBetCount = maxBetCount;
    }

    public Integer getMaxBetCount()
    {
        return maxBetCount;
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
            .append("userName", getUserName())
            .append("user", getUser())
            .append("robotPic", getRobotPic())
            .append("robotBetMoney", getRobotBetMoney())
            .append("robotBetNum", getRobotBetNum())
            .append("robotBetTime", getRobotBetTime())
            .append("gameId", getGameId())
            .append("groupId", getGroupId())
            .append("playType", getPlayType())
            .append("minBetCount", getMinBetCount())
            .append("maxBetCount", getMaxBetCount())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
