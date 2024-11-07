package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户对象 im_user
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
public class ImUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickName;

    /** 用户头像 */
    @Excel(name = "用户头像")
    private String headImage;

    /** 用户头像缩略图 */
    @Excel(name = "用户头像缩略图")
    private String headImageThumb;

    /** 密码(明文) */
    @Excel(name = "密码(明文)")
    private String password;

    /** 性别 0:男 1:女 */
    @Excel(name = "性别 0:男 1:女")
    private Integer sex;

    /** 用户类型 1:客服用户 2:普通用户 */
    @Excel(name = "用户类型 1:客服用户 2:普通用户")
    private Integer type;

    /** 个性签名 */
    @Excel(name = "个性签名")
    private String signature;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastLoginTime;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 第三方用户uuid */
    @Excel(name = "第三方用户uuid")
    private String thirdUserId;

    /** 备注 */
    @Excel(name = "备注")
    private String remarkName;

    /** 用户注册IP */
    @Excel(name = "用户注册IP")
    private String userIp;

    /** 用户注册IP归属地 */
    @Excel(name = "用户注册IP归属地")
    private String userIpAddress;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setNickName(String nickName) 
    {
        this.nickName = nickName;
    }

    public String getNickName() 
    {
        return nickName;
    }
    public void setHeadImage(String headImage) 
    {
        this.headImage = headImage;
    }

    public String getHeadImage() 
    {
        return headImage;
    }
    public void setHeadImageThumb(String headImageThumb) 
    {
        this.headImageThumb = headImageThumb;
    }

    public String getHeadImageThumb() 
    {
        return headImageThumb;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setSex(Integer sex) 
    {
        this.sex = sex;
    }

    public Integer getSex() 
    {
        return sex;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }
    public void setSignature(String signature) 
    {
        this.signature = signature;
    }

    public String getSignature() 
    {
        return signature;
    }
    public void setLastLoginTime(Date lastLoginTime) 
    {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getLastLoginTime() 
    {
        return lastLoginTime;
    }
    public void setCreatedTime(Date createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() 
    {
        return createdTime;
    }
    public void setThirdUserId(String thirdUserId) 
    {
        this.thirdUserId = thirdUserId;
    }

    public String getThirdUserId() 
    {
        return thirdUserId;
    }
    public void setRemarkName(String remarkName) 
    {
        this.remarkName = remarkName;
    }

    public String getRemarkName() 
    {
        return remarkName;
    }
    public void setUserIp(String userIp) 
    {
        this.userIp = userIp;
    }

    public String getUserIp() 
    {
        return userIp;
    }
    public void setUserIpAddress(String userIpAddress) 
    {
        this.userIpAddress = userIpAddress;
    }

    public String getUserIpAddress() 
    {
        return userIpAddress;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userName", getUserName())
            .append("nickName", getNickName())
            .append("headImage", getHeadImage())
            .append("headImageThumb", getHeadImageThumb())
            .append("password", getPassword())
            .append("sex", getSex())
            .append("type", getType())
            .append("signature", getSignature())
            .append("lastLoginTime", getLastLoginTime())
            .append("createdTime", getCreatedTime())
            .append("thirdUserId", getThirdUserId())
            .append("remarkName", getRemarkName())
            .append("userIp", getUserIp())
            .append("userIpAddress", getUserIpAddress())
            .toString();
    }
}
