package com.ruoyi.system.domain.vo;

public class PostalListReqVO {

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 充值时间 */
    private String filterDate;

    /** 充值方式 */
    private String postalStatus;

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

    public String getFilterDate() {
        return filterDate;
    }

    public void setFilterDate(String filterDate) {
        this.filterDate = filterDate;
    }

    public String getPostalStatus() {
        return postalStatus;
    }

    public void setPostalStatus(String postalStatus) {
        this.postalStatus = postalStatus;
    }
}
