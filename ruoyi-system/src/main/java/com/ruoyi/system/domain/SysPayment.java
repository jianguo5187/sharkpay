package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 支付方式对象 sys_payment
 * 
 * @author ruoyi
 * @date 2024-04-07
 */
public class SysPayment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 支付方式id */
    private Long id;

    /** 收款账号 */
    @Excel(name = "收款账号")
    private String paymentAccount;

    /** 收款姓名 */
    @Excel(name = "收款姓名")
    private String paymentName;

    /** 收款类型（0：微信、1：支付宝、2：银联） */
    @Excel(name = "收款类型", readConverterExp = "0=：微信、1：支付宝、2：银联")
    private String paymentType;

    /** 收款码图片地址 */
    @Excel(name = "收款码图片地址")
    private String paymentPic;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPaymentAccount(String paymentAccount) 
    {
        this.paymentAccount = paymentAccount;
    }

    public String getPaymentAccount() 
    {
        return paymentAccount;
    }
    public void setPaymentName(String paymentName) 
    {
        this.paymentName = paymentName;
    }

    public String getPaymentName() 
    {
        return paymentName;
    }
    public void setPaymentType(String paymentType) 
    {
        this.paymentType = paymentType;
    }

    public String getPaymentType() 
    {
        return paymentType;
    }
    public void setPaymentPic(String paymentPic) 
    {
        this.paymentPic = paymentPic;
    }

    public String getPaymentPic() 
    {
        return paymentPic;
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
            .append("paymentAccount", getPaymentAccount())
            .append("paymentName", getPaymentName())
            .append("paymentType", getPaymentType())
            .append("paymentPic", getPaymentPic())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
