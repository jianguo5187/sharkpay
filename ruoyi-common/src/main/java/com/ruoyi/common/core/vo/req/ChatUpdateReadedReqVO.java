package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class ChatUpdateReadedReqVO {

    @NotNull(message = "信息发送用户ID不能为空")
    private Long chatFromUser;

    @NotNull(message = "信息接收用户ID不能为空")
    private Long chatToUser;

    public Long getChatFromUser() {
        return chatFromUser;
    }

    public void setChatFromUser(Long chatFromUser) {
        this.chatFromUser = chatFromUser;
    }

    public Long getChatToUser() {
        return chatToUser;
    }

    public void setChatToUser(Long chatToUser) {
        this.chatToUser = chatToUser;
    }
}
