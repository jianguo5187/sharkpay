package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 好友对象 im_friend
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
public class ImFriend
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 好友id */
    @Excel(name = "好友id")
    private Long friendId;

    /** 好友昵称 */
    @Excel(name = "好友昵称")
    private String friendNickName;

    /** 好友头像 */
    @Excel(name = "好友头像")
    private String friendHeadImage;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 备注 */
    @Excel(name = "备注")
    private String remarkName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setFriendId(Long friendId) 
    {
        this.friendId = friendId;
    }

    public Long getFriendId() 
    {
        return friendId;
    }
    public void setFriendNickName(String friendNickName) 
    {
        this.friendNickName = friendNickName;
    }

    public String getFriendNickName() 
    {
        return friendNickName;
    }
    public void setFriendHeadImage(String friendHeadImage) 
    {
        this.friendHeadImage = friendHeadImage;
    }

    public String getFriendHeadImage() 
    {
        return friendHeadImage;
    }
    public void setCreatedTime(Date createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() 
    {
        return createdTime;
    }
    public void setRemarkName(String remarkName) 
    {
        this.remarkName = remarkName;
    }

    public String getRemarkName() 
    {
        return remarkName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("friendId", getFriendId())
            .append("friendNickName", getFriendNickName())
            .append("friendHeadImage", getFriendHeadImage())
            .append("createdTime", getCreatedTime())
            .append("remarkName", getRemarkName())
            .toString();
    }
}
