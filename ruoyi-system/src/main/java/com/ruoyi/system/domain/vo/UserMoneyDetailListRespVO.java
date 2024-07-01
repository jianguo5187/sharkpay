package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class UserMoneyDetailListRespVO {

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

    /** 用户资金流水ID */
    private Long id;

    /** 流水金额 */
    private Float beforeUserMoney;

    /** 流水金额 */
    private Float cashMoney;

    /** 流水金额 */
    private Float userBalance;

    /** 备注 */
    private String remark;

    /** 类型 */
    private String type;

    /** 流水时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date cashTime;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Float getBeforeUserMoney() {
        return beforeUserMoney;
    }

    public void setBeforeUserMoney(Float beforeUserMoney) {
        this.beforeUserMoney = beforeUserMoney;
    }

    public Float getCashMoney() {
        return cashMoney;
    }

    public void setCashMoney(Float cashMoney) {
        this.cashMoney = cashMoney;
    }

    public Float getUserBalance() {
        return userBalance;
    }

    public void setUserBalance(Float userBalance) {
        this.userBalance = userBalance;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCashTime() {
        return cashTime;
    }

    public void setCashTime(Date cashTime) {
        this.cashTime = cashTime;
    }
}
