package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysCalendarMapper;
import com.ruoyi.system.domain.SysCalendar;
import com.ruoyi.system.service.ISysCalendarService;

/**
 * 日历Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-10
 */
@Service
public class SysCalendarServiceImpl implements ISysCalendarService 
{
    @Autowired
    private SysCalendarMapper sysCalendarMapper;

    /**
     * 查询日历
     * 
     * @param calendarId 日历主键
     * @return 日历
     */
    @Override
    public SysCalendar selectSysCalendarByCalendarId(Long calendarId)
    {
        return sysCalendarMapper.selectSysCalendarByCalendarId(calendarId);
    }

    /**
     * 查询日历列表
     * 
     * @param sysCalendar 日历
     * @return 日历
     */
    @Override
    public List<SysCalendar> selectSysCalendarList(SysCalendar sysCalendar)
    {
        return sysCalendarMapper.selectSysCalendarList(sysCalendar);
    }

    /**
     * 新增日历
     * 
     * @param sysCalendar 日历
     * @return 结果
     */
    @Override
    public int insertSysCalendar(SysCalendar sysCalendar)
    {
        return sysCalendarMapper.insertSysCalendar(sysCalendar);
    }

    /**
     * 修改日历
     * 
     * @param sysCalendar 日历
     * @return 结果
     */
    @Override
    public int updateSysCalendar(SysCalendar sysCalendar)
    {
        return sysCalendarMapper.updateSysCalendar(sysCalendar);
    }

    /**
     * 批量删除日历
     * 
     * @param calendarIds 需要删除的日历主键
     * @return 结果
     */
    @Override
    public int deleteSysCalendarByCalendarIds(Long[] calendarIds)
    {
        return sysCalendarMapper.deleteSysCalendarByCalendarIds(calendarIds);
    }

    /**
     * 删除日历信息
     * 
     * @param calendarId 日历主键
     * @return 结果
     */
    @Override
    public int deleteSysCalendarByCalendarId(Long calendarId)
    {
        return sysCalendarMapper.deleteSysCalendarByCalendarId(calendarId);
    }

    @Override
    public void insertTodayCalendar() {
        String startCalendarDay = sysCalendarMapper.lastCalendarDate();

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,1);
        String tomorrowDay = sd.format(cal.getTime());

        if(StringUtils.isEmpty(startCalendarDay)){
            SimpleDateFormat sdYear = new SimpleDateFormat("yyyy");
            startCalendarDay = sdYear.format(new Date()) + "-01-01" ;
        }

        sysCalendarMapper.CallIntsertRangeDate(startCalendarDay,tomorrowDay);
    }
}
