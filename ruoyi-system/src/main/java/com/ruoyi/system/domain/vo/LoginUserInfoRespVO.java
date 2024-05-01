package com.ruoyi.system.domain.vo;

public class LoginUserInfoRespVO {

    /** 用户ID */
    private Long userId;

    /** 用户账号 */
    private String userName;

    /** 用户昵称 */
    private String nickName;

    /** 用户类型（00系统用户,01平台管理员,02APP用户） */
    private String userType;

    /** 用户头像 */
    private String avatar;

    /** 余额 */
    private Float amount;

    /** 积分 */
    private Float score;

    /** 真实姓名 */
    private String realName;

    /** 身份证号码 */
    private String idcardNo;

    /** 身份证正面图片路径 */
    private String idcardFrontImg;

    /** 身份证反面图片路径 */
    private String idcardBackImg;

    /** 钱包地址 */
    private String walletAddress;

    /** 邀请码 */
    private String inviteCode;

    /** 上级用户ID */
    private Long parentUserId;

    /** 今天盈亏 */
    private Float todayWinMoney;

    /** 昨日盈亏 */
    private Float yesdayWinMoney;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
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

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcardNo() {
        return idcardNo;
    }

    public void setIdcardNo(String idcardNo) {
        this.idcardNo = idcardNo;
    }

    public String getIdcardFrontImg() {
        return idcardFrontImg;
    }

    public void setIdcardFrontImg(String idcardFrontImg) {
        this.idcardFrontImg = idcardFrontImg;
    }

    public String getIdcardBackImg() {
        return idcardBackImg;
    }

    public void setIdcardBackImg(String idcardBackImg) {
        this.idcardBackImg = idcardBackImg;
    }

    public String getWalletAddress() {
        return walletAddress;
    }

    public void setWalletAddress(String walletAddress) {
        this.walletAddress = walletAddress;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Float getTodayWinMoney() {
        return todayWinMoney;
    }

    public void setTodayWinMoney(Float todayWinMoney) {
        this.todayWinMoney = todayWinMoney;
    }

    public Float getYesdayWinMoney() {
        return yesdayWinMoney;
    }

    public void setYesdayWinMoney(Float yesdayWinMoney) {
        this.yesdayWinMoney = yesdayWinMoney;
    }
}
