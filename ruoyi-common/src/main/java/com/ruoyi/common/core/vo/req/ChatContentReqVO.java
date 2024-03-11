package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class ChatContentReqVO {

    @NotNull(message = "页数不能为空")
    private Integer pageNumber;

    @NotNull(message = "信息发送用户ID不能为空")
    private Long chatFromUser;

    @NotNull(message = "信息接收用户ID不能为空")
    private Long chatToUser;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

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
