package com.ruoyi.quartz.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class GameOpenDataDto {

    /** 期数 */
    private Long expect;

    /** 开奖时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date opentime;

    /** 开奖号码 */
    private String opencode;

    public Long getExpect() {
        return expect;
    }

    public void setExpect(Long expect) {
        this.expect = expect;
    }

    public Date getOpentime() {
        return opentime;
    }

    public void setOpentime(Date opentime) {
        this.opentime = opentime;
    }

    public String getOpencode() {
        return opencode;
    }

    public void setOpencode(String opencode) {
        this.opencode = opencode;
    }
}
