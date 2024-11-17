package com.ruoyi.system.domain.vo;

public class ChildUserCommissionRespVO {

    /** 下级用户ID */
    private Long userId;

    /** 下级用户昵称 */
    private String nickName;

    /** 下级用户备注名 */
    private String remarkName;

    /** 下级用户头像 */
    private String avatar;

    /** 下级余额 */
    private Float amount;

    /** 产生佣金 */
    private Float generateAmount;

    /** 未转出佣金 */
    private Float withoutTransferAmount;

    /** 转出中佣金 */
    private Float approveTransferAmount;

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

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Float getGenerateAmount() {
        return generateAmount;
    }

    public void setGenerateAmount(Float generateAmount) {
        this.generateAmount = generateAmount;
    }

    public Float getWithoutTransferAmount() {
        return withoutTransferAmount;
    }

    public void setWithoutTransferAmount(Float withoutTransferAmount) {
        this.withoutTransferAmount = withoutTransferAmount;
    }

    public Float getApproveTransferAmount() {
        return approveTransferAmount;
    }

    public void setApproveTransferAmount(Float approveTransferAmount) {
        this.approveTransferAmount = approveTransferAmount;
    }
}
