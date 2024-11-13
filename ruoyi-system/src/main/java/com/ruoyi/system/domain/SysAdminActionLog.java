package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 管理员操作记录对象 sys_admin_action_log
 * 
 * @author ruoyi
 * @date 2024-11-13
 */
public class SysAdminActionLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 管理员操作记录ID */
    private Long id;

    /** 操作类型 1-登录 2-改变用户上级 3-修改赔率 */
    @Excel(name = "操作类型 1-登录 2-改变用户上级 3-修改赔率")
    private String type;

    /** 操作的管理员id */
    @Excel(name = "操作的管理员id")
    private Long adminUserId;

    /** 操作的管理员名 */
    @Excel(name = "操作的管理员名")
    private String adminUserName;

    /** 执行IP */
    @Excel(name = "执行IP")
    private String actionLoginIp;

    /** 目标ID */
    @Excel(name = "目标ID")
    private String actionTargetIp;

    /** 修改前的值 */
    @Excel(name = "修改前的值")
    private String actionOldValue;

    /** 修改后的值 */
    @Excel(name = "修改后的值")
    private String actionNewValue;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setAdminUserId(Long adminUserId) 
    {
        this.adminUserId = adminUserId;
    }

    public Long getAdminUserId() 
    {
        return adminUserId;
    }
    public void setAdminUserName(String adminUserName) 
    {
        this.adminUserName = adminUserName;
    }

    public String getAdminUserName() 
    {
        return adminUserName;
    }
    public void setActionLoginIp(String actionLoginIp) 
    {
        this.actionLoginIp = actionLoginIp;
    }

    public String getActionLoginIp() 
    {
        return actionLoginIp;
    }
    public void setActionTargetIp(String actionTargetIp) 
    {
        this.actionTargetIp = actionTargetIp;
    }

    public String getActionTargetIp() 
    {
        return actionTargetIp;
    }
    public void setActionOldValue(String actionOldValue) 
    {
        this.actionOldValue = actionOldValue;
    }

    public String getActionOldValue() 
    {
        return actionOldValue;
    }
    public void setActionNewValue(String actionNewValue) 
    {
        this.actionNewValue = actionNewValue;
    }

    public String getActionNewValue() 
    {
        return actionNewValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("adminUserId", getAdminUserId())
            .append("adminUserName", getAdminUserName())
            .append("actionLoginIp", getActionLoginIp())
            .append("actionTargetIp", getActionTargetIp())
            .append("actionOldValue", getActionOldValue())
            .append("actionNewValue", getActionNewValue())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
