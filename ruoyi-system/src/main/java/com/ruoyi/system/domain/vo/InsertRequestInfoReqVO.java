package com.ruoyi.system.domain.vo;

import com.ruoyi.common.annotation.Excel;

public class InsertRequestInfoReqVO {


    /** 请求IP */
    private String requestInfoIp;

    /** 请求头信息 */
    private String requestInfoHeadValue;

    public String getRequestInfoIp() {
        return requestInfoIp;
    }

    public void setRequestInfoIp(String requestInfoIp) {
        this.requestInfoIp = requestInfoIp;
    }

    public String getRequestInfoHeadValue() {
        return requestInfoHeadValue;
    }

    public void setRequestInfoHeadValue(String requestInfoHeadValue) {
        this.requestInfoHeadValue = requestInfoHeadValue;
    }
}
