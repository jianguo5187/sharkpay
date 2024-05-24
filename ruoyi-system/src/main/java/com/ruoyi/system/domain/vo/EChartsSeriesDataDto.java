package com.ruoyi.system.domain.vo;

import java.util.List;

public class EChartsSeriesDataDto {

    /** 数据 */
    private List<Float> data;

    /** 名称 */
    private String name;

    /** 图表类型 */
    private String type;

    public List<Float> getData() {
        return data;
    }

    public void setData(List<Float> data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
