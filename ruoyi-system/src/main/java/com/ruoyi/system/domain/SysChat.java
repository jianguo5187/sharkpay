package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 聊天信息对象 sys_chat
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
public class SysChat extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 角色ID */
    private Long chatId;

    /** 信息发送用户ID */
    @Excel(name = "信息发送用户ID")
    private Long fromUserId;

    /** 信息接收用户ID */
    @Excel(name = "信息接收用户ID")
    private Long toUserId;

    /** 信息内容 */
    @Excel(name = "信息内容")
    private String content;

    /** 是否已读(0 已读 1未读) */
    @Excel(name = "是否已读(0 已读 1未读)")
    private String isRead;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setChatId(Long chatId) 
    {
        this.chatId = chatId;
    }

    public Long getChatId() 
    {
        return chatId;
    }
    public void setFromUserId(Long fromUserId) 
    {
        this.fromUserId = fromUserId;
    }

    public Long getFromUserId() 
    {
        return fromUserId;
    }
    public void setToUserId(Long toUserId) 
    {
        this.toUserId = toUserId;
    }

    public Long getToUserId() 
    {
        return toUserId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setIsRead(String isRead) 
    {
        this.isRead = isRead;
    }

    public String getIsRead() 
    {
        return isRead;
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
            .append("chatId", getChatId())
            .append("fromUserId", getFromUserId())
            .append("toUserId", getToUserId())
            .append("content", getContent())
            .append("isRead", getIsRead())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .toString();
    }
}
