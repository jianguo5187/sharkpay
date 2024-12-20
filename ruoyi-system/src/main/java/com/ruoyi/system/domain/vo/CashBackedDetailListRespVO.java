package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CashBackedDetailListRespVO {

    /** 编号 */
    private Integer rowId;

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 真实姓名 */
    private String realName;

    /** 用户备注名 */
    private String remarkName;

    /** 用户头像 */
    private String avatar;

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date winTime;

    /** 用户头像 */
    private String remark;

    /** 反水金额 */
    private Float cashBackMoney;

    public Integer getRowId() {
        return rowId;
    }

    public void setRowId(Integer rowId) {
        this.rowId = rowId;
    }

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

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getWinTime() {
        return winTime;
    }

    public void setWinTime(Date winTime) {
        this.winTime = winTime;
    }

    public Float getCashBackMoney() {
        return cashBackMoney;
    }

    public void setCashBackMoney(Float cashBackMoney) {
        this.cashBackMoney = cashBackMoney;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
