package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 日历对象 sys_calendar
 * 
 * @author ruoyi
 * @date 2024-06-10
 */
public class SysCalendar extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日历表ID */
    private Long calendarId;

    /** 日历时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日历时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date calendarDate;

    public void setCalendarId(Long calendarId) 
    {
        this.calendarId = calendarId;
    }

    public Long getCalendarId() 
    {
        return calendarId;
    }
    public void setCalendarDate(Date calendarDate) 
    {
        this.calendarDate = calendarDate;
    }

    public Date getCalendarDate() 
    {
        return calendarDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("calendarId", getCalendarId())
            .append("calendarDate", getCalendarDate())
            .toString();
    }
}
