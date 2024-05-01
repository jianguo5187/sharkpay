package com.ruoyi.system.domain.vo;

import java.util.List;

public class FxRespVO {

    /** 返水明细 */
    private List<FxListRespVO> fxList;

    /** 总返水金额 */
    private Float totalFxNum;

    /** 总流水金额 */
    private Float totalLsNum;

    public Float getTotalFxNum() {
        return totalFxNum;
    }

    public void setTotalFxNum(Float totalFxNum) {
        this.totalFxNum = totalFxNum;
    }

    public Float getTotalLsNum() {
        return totalLsNum;
    }

    public void setTotalLsNum(Float totalLsNum) {
        this.totalLsNum = totalLsNum;
    }

    public List<FxListRespVO> getFxList() {
        return fxList;
    }

    public void setFxList(List<FxListRespVO> fxList) {
        this.fxList = fxList;
    }
}
