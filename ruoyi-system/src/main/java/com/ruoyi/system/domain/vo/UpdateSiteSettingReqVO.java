package com.ruoyi.system.domain.vo;

public class UpdateSiteSettingReqVO {

    //站点开关
    private Boolean siteOpenFlg;

    //最小充值金额
    private Integer minChargeMoney;

    //最小提现金额
    private Integer minPostalMoney;

    //每日提现次数
    private Integer postalMaxCnt;

    //app首页公告内容
    private String appHomeNotice;

    //官方开奖URL
    private String openRecordUrl;

    //网站唯一标识ID
    private String webType;

    //网站名称
    private String webName;

    //微信appId
    private String wechatAppId;

    //微信appSecret
    private String wechatAppSecret;

    //授权域名
    private String wechatAuthUrl;

    //客服端聊天地址
    private String kefuImUrl;

    //玩家端聊天地址
    private String appImUrl;

    private String qrServerUrl;

    //自开彩种赢亏比率
    private Float systemGameWinRate;

    private String aliCloudApiCode;

    private String refuseProvince;

    private String refuseCity;

    private String refuseIsp;

    public Boolean isSiteOpenFlg() {
        return siteOpenFlg;
    }

    public void setSiteOpenFlg(Boolean siteOpenFlg) {
        this.siteOpenFlg = siteOpenFlg;
    }

    public Boolean getSiteOpenFlg() {
        return siteOpenFlg;
    }

    public Integer getMinChargeMoney() {
        return minChargeMoney;
    }

    public void setMinChargeMoney(Integer minChargeMoney) {
        this.minChargeMoney = minChargeMoney;
    }

    public Integer getMinPostalMoney() {
        return minPostalMoney;
    }

    public void setMinPostalMoney(Integer minPostalMoney) {
        this.minPostalMoney = minPostalMoney;
    }

    public Integer getPostalMaxCnt() {
        return postalMaxCnt;
    }

    public void setPostalMaxCnt(Integer postalMaxCnt) {
        this.postalMaxCnt = postalMaxCnt;
    }

    public String getAppHomeNotice() {
        return appHomeNotice;
    }

    public void setAppHomeNotice(String appHomeNotice) {
        this.appHomeNotice = appHomeNotice;
    }

    public String getOpenRecordUrl() {
        return openRecordUrl;
    }

    public void setOpenRecordUrl(String openRecordUrl) {
        this.openRecordUrl = openRecordUrl;
    }

    public String getWebType() {
        return webType;
    }

    public void setWebType(String webType) {
        this.webType = webType;
    }

    public String getWebName() {
        return webName;
    }

    public void setWebName(String webName) {
        this.webName = webName;
    }

    public String getWechatAppId() {
        return wechatAppId;
    }

    public void setWechatAppId(String wechatAppId) {
        this.wechatAppId = wechatAppId;
    }

    public String getWechatAppSecret() {
        return wechatAppSecret;
    }

    public void setWechatAppSecret(String wechatAppSecret) {
        this.wechatAppSecret = wechatAppSecret;
    }

    public String getWechatAuthUrl() {
        return wechatAuthUrl;
    }

    public void setWechatAuthUrl(String wechatAuthUrl) {
        this.wechatAuthUrl = wechatAuthUrl;
    }

    public String getKefuImUrl() {
        return kefuImUrl;
    }

    public void setKefuImUrl(String kefuImUrl) {
        this.kefuImUrl = kefuImUrl;
    }

    public String getAppImUrl() {
        return appImUrl;
    }

    public void setAppImUrl(String appImUrl) {
        this.appImUrl = appImUrl;
    }

    public String getQrServerUrl() {
        return qrServerUrl;
    }

    public void setQrServerUrl(String qrServerUrl) {
        this.qrServerUrl = qrServerUrl;
    }

    public Float getSystemGameWinRate() {
        return systemGameWinRate;
    }

    public void setSystemGameWinRate(Float systemGameWinRate) {
        this.systemGameWinRate = systemGameWinRate;
    }

    public String getAliCloudApiCode() {
        return aliCloudApiCode;
    }

    public void setAliCloudApiCode(String aliCloudApiCode) {
        this.aliCloudApiCode = aliCloudApiCode;
    }

    public String getRefuseProvince() {
        return refuseProvince;
    }

    public void setRefuseProvince(String refuseProvince) {
        this.refuseProvince = refuseProvince;
    }

    public String getRefuseCity() {
        return refuseCity;
    }

    public void setRefuseCity(String refuseCity) {
        this.refuseCity = refuseCity;
    }

    public String getRefuseIsp() {
        return refuseIsp;
    }

    public void setRefuseIsp(String refuseIsp) {
        this.refuseIsp = refuseIsp;
    }
}
