package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 落地域名对象 sys_landing_domain
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
public class SysLandingDomain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 落地域名ID */
    private Long landingDomainId;

    /** 落地域名 */
    @Excel(name = "落地域名")
    private String landingDomainUrl;

    /** 落地域名状态（0正常 1未激活） */
    @Excel(name = "落地域名状态", readConverterExp = "0=正常,1=未激活")
    private String status;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    public void setLandingDomainId(Long landingDomainId) 
    {
        this.landingDomainId = landingDomainId;
    }

    public Long getLandingDomainId() 
    {
        return landingDomainId;
    }
    public void setLandingDomainUrl(String landingDomainUrl) 
    {
        this.landingDomainUrl = landingDomainUrl;
    }

    public String getLandingDomainUrl() 
    {
        return landingDomainUrl;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("landingDomainId", getLandingDomainId())
            .append("landingDomainUrl", getLandingDomainUrl())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
