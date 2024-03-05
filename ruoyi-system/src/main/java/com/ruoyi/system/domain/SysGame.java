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
 * @date 2024-03-05
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
    private Long gameType;

    /** 压缩名 */
    @Excel(name = "压缩名")
    private String gameName;

    /** 描述 */
    @Excel(name = "描述")
    private String gameDescribe;

    /** 中文名 */
    @Excel(name = "中文名")
    private String gameChineseName;

    /** 盈亏名 */
    @Excel(name = "盈亏名")
    private String profitLossName;

    /** 0开启1为关闭 */
    @Excel(name = "0开启1为关闭")
    private Integer openoff;

    /** 记录表 */
    @Excel(name = "记录表")
    private String gameRecord;

    /** 开奖表 */
    @Excel(name = "开奖表")
    private String gameKj;

    /** 佣金 */
    @Excel(name = "佣金")
    private BigDecimal gameCommission;

    /** 2级佣金 */
    @Excel(name = "2级佣金")
    private BigDecimal gameCommissionTwo;

    /** 回水彩种 */
    @Excel(name = "回水彩种")
    private String gameCate;

    /** 回水 */
    @Excel(name = "回水")
    private BigDecimal gameCashback;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String roomRule;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 是否隐藏 */
    @Excel(name = "是否隐藏")
    private Integer isHidden;

    /** 房间模式 */
    @Excel(name = "房间模式")
    private Long houseOpen;

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
    public void setGameType(Long gameType) 
    {
        this.gameType = gameType;
    }

    public Long getGameType() 
    {
        return gameType;
    }
    public void setGameName(String gameName) 
    {
        this.gameName = gameName;
    }

    public String getGameName() 
    {
        return gameName;
    }
    public void setGameDescribe(String gameDescribe) 
    {
        this.gameDescribe = gameDescribe;
    }

    public String getGameDescribe() 
    {
        return gameDescribe;
    }
    public void setGameChineseName(String gameChineseName) 
    {
        this.gameChineseName = gameChineseName;
    }

    public String getGameChineseName() 
    {
        return gameChineseName;
    }
    public void setProfitLossName(String profitLossName) 
    {
        this.profitLossName = profitLossName;
    }

    public String getProfitLossName() 
    {
        return profitLossName;
    }
    public void setOpenoff(Integer openoff) 
    {
        this.openoff = openoff;
    }

    public Integer getOpenoff() 
    {
        return openoff;
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
    public void setGameCommission(BigDecimal gameCommission) 
    {
        this.gameCommission = gameCommission;
    }

    public BigDecimal getGameCommission() 
    {
        return gameCommission;
    }
    public void setGameCommissionTwo(BigDecimal gameCommissionTwo) 
    {
        this.gameCommissionTwo = gameCommissionTwo;
    }

    public BigDecimal getGameCommissionTwo() 
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
    public void setGameCashback(BigDecimal gameCashback) 
    {
        this.gameCashback = gameCashback;
    }

    public BigDecimal getGameCashback() 
    {
        return gameCashback;
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
    public void setIsHidden(Integer isHidden) 
    {
        this.isHidden = isHidden;
    }

    public Integer getIsHidden() 
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("gameId", getGameId())
            .append("gameImg", getGameImg())
            .append("gameType", getGameType())
            .append("gameName", getGameName())
            .append("gameDescribe", getGameDescribe())
            .append("gameChineseName", getGameChineseName())
            .append("profitLossName", getProfitLossName())
            .append("openoff", getOpenoff())
            .append("gameRecord", getGameRecord())
            .append("gameKj", getGameKj())
            .append("gameCommission", getGameCommission())
            .append("gameCommissionTwo", getGameCommissionTwo())
            .append("gameCate", getGameCate())
            .append("gameCashback", getGameCashback())
            .append("roomRule", getRoomRule())
            .append("sort", getSort())
            .append("isHidden", getIsHidden())
            .append("houseOpen", getHouseOpen())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
