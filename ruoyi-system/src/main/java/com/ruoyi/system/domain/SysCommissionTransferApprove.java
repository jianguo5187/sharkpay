package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 佣金转出审核对象 sys_commission_transfer_approve
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
public class SysCommissionTransferApprove extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 佣金转出审核ID */
    private Long id;

    /** 转出用户ID */
    @Excel(name = "转出用户ID")
    private Long transferUserId;

    /** 用户昵称 */
    private String nickName;

    /** 用户备注名 */
    private String remarkName;

    /** 转出佣金 */
    @Excel(name = "转出佣金")
    private Float transferAmount;

    /** 审核状态（0申请中 1转出通过 2转出失败） */
    @Excel(name = "审核状态", readConverterExp = "0=申请中,1=转出通过,2=转出失败")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTransferUserId(Long transferUserId) 
    {
        this.transferUserId = transferUserId;
    }

    public Long getTransferUserId() 
    {
        return transferUserId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public void setTransferAmount(Float transferAmount)
    {
        this.transferAmount = transferAmount;
    }

    public Float getTransferAmount() 
    {
        return transferAmount;
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
            .append("transferUserId", getTransferUserId())
            .append("transferAmount", getTransferAmount())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
