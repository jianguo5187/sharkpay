package com.ruoyi.system.domain.vo;

import java.util.List;

public class YkInfoRespVO {

    /** 盈亏列表 */
    private List<YkDetailRespVO> ykDetail;

    public List<YkDetailRespVO> getYkDetail() {
        return ykDetail;
    }

    public void setYkDetail(List<YkDetailRespVO> ykDetail) {
        this.ykDetail = ykDetail;
    }
}
