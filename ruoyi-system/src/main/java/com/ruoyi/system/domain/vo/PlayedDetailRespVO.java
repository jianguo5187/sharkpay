package com.ruoyi.system.domain.vo;

public class PlayedDetailRespVO {

    /** 玩法分类 */
    private String playType;

    /** 投注内容 */
    private String playDetail;

    /** 投注金额 */
    private Float money;

    public String getPlayType() {
        return playType;
    }

    public void setPlayType(String playType) {
        this.playType = playType;
    }

    public String getPlayDetail() {
        return playDetail;
    }

    public void setPlayDetail(String playDetail) {
        this.playDetail = playDetail;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }
}
