package com.ruoyi.common.core.vo.resp;

public class ChatUserListRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 用户头像 */
    private String avatar;

    /** 信息内容 */
    private String content;

    /** 未读消息件数 */
    private Integer noReadMsgCount;

    /** 最后聊天时间 */
    private String lastChatTime;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLastChatTime() {
        return lastChatTime;
    }

    public void setLastChatTime(String lastChatTime) {
        this.lastChatTime = lastChatTime;
    }

    public Integer getNoReadMsgCount() {
        return noReadMsgCount;
    }

    public void setNoReadMsgCount(Integer noReadMsgCount) {
        this.noReadMsgCount = noReadMsgCount;
    }
}
