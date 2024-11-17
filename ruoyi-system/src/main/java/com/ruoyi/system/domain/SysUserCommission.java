package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户佣金对象 sys_user_commission
 *
 * @author ruoyi
 * @date 2024-11-15
 */
public class SysUserCommission extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户佣金ID */
    private Long id;

    /** 上级用户ID */
    @Excel(name = "上级用户ID")
    private Long parentUserId;

    /** 下级用户ID */
    @Excel(name = "下级用户ID")
    private Long commissionUserId;

    /** 下级流水金额 */
    @Excel(name = "下级流水金额")
    private Float userBetAmount;

    /** 产生佣金 */
    @Excel(name = "产生佣金")
    private Float generateAmount;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 用户盈亏ID */
    @Excel(name = "用户盈亏ID")
    private Long userWinId;

    /** 用户佣金状态（0未转出 1转出中 2已转出） */
    @Excel(name = "用户佣金状态", readConverterExp = "0=未转出,1=转出中,2=已转出")
    private String status;

    /** 佣金转出审核ID */
    @Excel(name = "佣金转出审核ID")
    private Long transferApproveId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setParentUserId(Long parentUserId)
    {
        this.parentUserId = parentUserId;
    }

    public Long getParentUserId()
    {
        return parentUserId;
    }
    public void setCommissionUserId(Long commissionUserId)
    {
        this.commissionUserId = commissionUserId;
    }

    public Long getCommissionUserId()
    {
        return commissionUserId;
    }
    public void setUserBetAmount(Float userBetAmount)
    {
        this.userBetAmount = userBetAmount;
    }

    public Float getUserBetAmount()
    {
        return userBetAmount;
    }
    public void setGenerateAmount(Float generateAmount)
    {
        this.generateAmount = generateAmount;
    }

    public Float getGenerateAmount()
    {
        return generateAmount;
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
    public void setUserWinId(Long userWinId)
    {
        this.userWinId = userWinId;
    }

    public Long getUserWinId()
    {
        return userWinId;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setTransferApproveId(Long transferApproveId)
    {
        this.transferApproveId = transferApproveId;
    }

    public Long getTransferApproveId()
    {
        return transferApproveId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("parentUserId", getParentUserId())
                .append("commissionUserId", getCommissionUserId())
                .append("userBetAmount", getUserBetAmount())
                .append("generateAmount", getGenerateAmount())
                .append("gameId", getGameId())
                .append("gameName", getGameName())
                .append("userWinId", getUserWinId())
                .append("status", getStatus())
                .append("transferApproveId", getTransferApproveId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
