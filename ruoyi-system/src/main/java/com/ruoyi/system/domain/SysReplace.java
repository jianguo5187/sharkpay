package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 广告轮播图对象 sys_replace
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public class SysReplace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 广告轮播图ID */
    private Long replaceId;

    /** 广告轮播图图片 */
    @Excel(name = "广告轮播图图片")
    private String replacePic;

    /** 广告轮播图状态（0正常 1停用） */
    @Excel(name = "广告轮播图状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setReplaceId(Long replaceId) 
    {
        this.replaceId = replaceId;
    }

    public Long getReplaceId() 
    {
        return replaceId;
    }
    public void setReplacePic(String replacePic) 
    {
        this.replacePic = replacePic;
    }

    public String getReplacePic() 
    {
        return replacePic;
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
            .append("replaceId", getReplaceId())
            .append("replacePic", getReplacePic())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
