package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 授权域名对象 sys_wechat_auth
 * 
 * @author ruoyi
 * @date 2024-12-31
 */
public class SysWechatAuth extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 授权域名ID */
    private Long wechatAuthId;

    /** 授权域名 */
    @Excel(name = "授权域名")
    private String wechatAuthUrl;

    /** 授权域名状态（0正常 1未激活） */
    @Excel(name = "授权域名状态", readConverterExp = "0=正常,1=未激活")
    private String status;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    public void setWechatAuthId(Long wechatAuthId) 
    {
        this.wechatAuthId = wechatAuthId;
    }

    public Long getWechatAuthId() 
    {
        return wechatAuthId;
    }
    public void setWechatAuthUrl(String wechatAuthUrl) 
    {
        this.wechatAuthUrl = wechatAuthUrl;
    }

    public String getWechatAuthUrl() 
    {
        return wechatAuthUrl;
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
            .append("wechatAuthId", getWechatAuthId())
            .append("wechatAuthUrl", getWechatAuthUrl())
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
