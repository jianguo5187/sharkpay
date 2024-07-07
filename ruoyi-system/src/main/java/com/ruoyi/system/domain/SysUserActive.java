package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户存活状况对象 sys_user_active
 * 
 * @author ruoyi
 * @date 2024-07-05
 */
public class SysUserActive extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 存活ID */
    private Long activeId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Excel.Type.EXPORT)
    private Date loginDate;

    /** 最后活动时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Excel.Type.EXPORT)
    private Date activeDate;

    public void setActiveId(Long activeId) 
    {
        this.activeId = activeId;
    }

    public Long getActiveId() 
    {
        return activeId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setLoginDate(Date loginDate) 
    {
        this.loginDate = loginDate;
    }

    public Date getLoginDate() 
    {
        return loginDate;
    }
    public void setActiveDate(Date activeDate) 
    {
        this.activeDate = activeDate;
    }

    public Date getActiveDate() 
    {
        return activeDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("activeId", getActiveId())
            .append("userId", getUserId())
            .append("loginDate", getLoginDate())
            .append("activeDate", getActiveDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
