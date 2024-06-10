package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysCalendar;

/**
 * 日历Service接口
 * 
 * @author ruoyi
 * @date 2024-06-10
 */
public interface ISysCalendarService 
{
    /**
     * 查询日历
     * 
     * @param calendarId 日历主键
     * @return 日历
     */
    public SysCalendar selectSysCalendarByCalendarId(Long calendarId);

    /**
     * 查询日历列表
     * 
     * @param sysCalendar 日历
     * @return 日历集合
     */
    public List<SysCalendar> selectSysCalendarList(SysCalendar sysCalendar);

    /**
     * 新增日历
     * 
     * @param sysCalendar 日历
     * @return 结果
     */
    public int insertSysCalendar(SysCalendar sysCalendar);

    /**
     * 修改日历
     * 
     * @param sysCalendar 日历
     * @return 结果
     */
    public int updateSysCalendar(SysCalendar sysCalendar);

    /**
     * 批量删除日历
     * 
     * @param calendarIds 需要删除的日历主键集合
     * @return 结果
     */
    public int deleteSysCalendarByCalendarIds(Long[] calendarIds);

    /**
     * 删除日历信息
     * 
     * @param calendarId 日历主键
     * @return 结果
     */
    public int deleteSysCalendarByCalendarId(Long calendarId);

    public void insertTodayCalendar();
}
