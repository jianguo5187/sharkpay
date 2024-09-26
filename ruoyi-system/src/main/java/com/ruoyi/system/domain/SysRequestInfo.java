package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 请求信息对象 sys_request_info
 * 
 * @author ruoyi
 * @date 2024-09-13
 */
public class SysRequestInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 请求信息ID */
    private Long requestInfoId;

    /** 请求IP */
    @Excel(name = "请求IP")
    private String requestInfoIp;

    /** 请求头信息 */
    @Excel(name = "请求头信息")
    private String requestInfoHeadValue;

    public void setRequestInfoId(Long requestInfoId) 
    {
        this.requestInfoId = requestInfoId;
    }

    public Long getRequestInfoId() 
    {
        return requestInfoId;
    }
    public void setRequestInfoIp(String requestInfoIp) 
    {
        this.requestInfoIp = requestInfoIp;
    }

    public String getRequestInfoIp() 
    {
        return requestInfoIp;
    }
    public void setRequestInfoHeadValue(String requestInfoHeadValue) 
    {
        this.requestInfoHeadValue = requestInfoHeadValue;
    }

    public String getRequestInfoHeadValue() 
    {
        return requestInfoHeadValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("requestInfoId", getRequestInfoId())
            .append("requestInfoIp", getRequestInfoIp())
            .append("requestInfoHeadValue", getRequestInfoHeadValue())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
