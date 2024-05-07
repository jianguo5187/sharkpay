package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 管理员记录对象 sys_admin_record
 * 
 * @author ruoyi
 * @date 2024-05-07
 */
public class SysAdminRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 管理员记录表ID */
    private Long id;

    /** 记录类型 1-上分 2-下分 3-手动上分 4-手动下分 5-返水处理 6-VIP佣金发放 7-冻结 */
    @Excel(name = "记录类型 1-上分 2-下分 3-手动上分 4-手动下分 5-返水处理 6-VIP佣金发放 7-冻结")
    private Integer type;

    /** 是否是同意操作 0-同意 1-拒绝 */
    @Excel(name = "是否是同意操作 0-同意 1-拒绝")
    private String isAgree;

    /** 对应的原始记录表的id type123456对应usermoney表 7对应被冻结的UserId */
    @Excel(name = "对应的原始记录表的id type123456对应usermoney表 7对应被冻结的UserId")
    private Long originId;

    /** 操作的管理员id */
    @Excel(name = "操作的管理员id")
    private Long adminUserId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }
    public void setIsAgree(String isAgree) 
    {
        this.isAgree = isAgree;
    }

    public String getIsAgree() 
    {
        return isAgree;
    }
    public void setOriginId(Long originId) 
    {
        this.originId = originId;
    }

    public Long getOriginId() 
    {
        return originId;
    }
    public void setAdminUserId(Long adminUserId) 
    {
        this.adminUserId = adminUserId;
    }

    public Long getAdminUserId() 
    {
        return adminUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("isAgree", getIsAgree())
            .append("originId", getOriginId())
            .append("adminUserId", getAdminUserId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
