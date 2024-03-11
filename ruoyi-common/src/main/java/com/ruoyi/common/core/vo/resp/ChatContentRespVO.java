package com.ruoyi.common.core.vo.resp;

public class ChatContentRespVO {

    /** 信息发送者ID */
    private Long chatFromUserId;

    /** 用户昵称 */
    private String nickName;

    /** 用户头像 */
    private String avatar;

    /** 信息内容 */
    private String content;

    /** 聊天时间 */
    private String chatTime;

    public Long getChatFromUserId() {
        return chatFromUserId;
    }

    public void setChatFromUserId(Long chatFromUserId) {
        this.chatFromUserId = chatFromUserId;
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

    public String getChatTime() {
        return chatTime;
    }

    public void setChatTime(String chatTime) {
        this.chatTime = chatTime;
    }
}
