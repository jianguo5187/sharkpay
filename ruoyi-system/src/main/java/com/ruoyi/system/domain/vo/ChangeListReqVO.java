package com.ruoyi.system.domain.vo;

public class ChangeListReqVO {

    /** 充值过滤时间From */
    private String filterDateFrom;

    /** 充值过滤时间To */
    private String filterDateTo;

    /** 页数 */
    private Integer pageNumber;

    /** 每页件数 */
    private Integer pageRowCount;

    /** 充值过滤时间 */
    private String filterDate;

    /** 流水类型 */
    private String type;

    public String getFilterDateFrom() {
        return filterDateFrom;
    }

    public void setFilterDateFrom(String filterDateFrom) {
        this.filterDateFrom = filterDateFrom;
    }

    public String getFilterDateTo() {
        return filterDateTo;
    }

    public void setFilterDateTo(String filterDateTo) {
        this.filterDateTo = filterDateTo;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageRowCount() {
        return pageRowCount;
    }

    public void setPageRowCount(Integer pageRowCount) {
        this.pageRowCount = pageRowCount;
    }

    public String getFilterDate() {
        return filterDate;
    }

    public void setFilterDate(String filterDate) {
        this.filterDate = filterDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
