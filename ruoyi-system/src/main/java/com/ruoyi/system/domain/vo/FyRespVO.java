package com.ruoyi.system.domain.vo;

import java.util.List;

public class FyRespVO {


    /** 返佣明细 */
    private List<FyListRespVO> fyList;

    /** 总返佣金额 */
    private Float totalFyNum;

    public List<FyListRespVO> getFyList() {
        return fyList;
    }

    public void setFyList(List<FyListRespVO> fyList) {
        this.fyList = fyList;
    }

    public Float getTotalFyNum() {
        return totalFyNum;
    }

    public void setTotalFyNum(Float totalFyNum) {
        this.totalFyNum = totalFyNum;
    }
}
