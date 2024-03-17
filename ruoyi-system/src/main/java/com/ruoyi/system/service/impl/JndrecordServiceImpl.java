package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JndrecordMapper;
import com.ruoyi.system.domain.Jndrecord;
import com.ruoyi.system.service.IJndrecordService;

/**
 * 加拿大下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class JndrecordServiceImpl implements IJndrecordService 
{
    @Autowired
    private JndrecordMapper jndrecordMapper;

    /**
     * 查询加拿大下注
     * 
     * @param id 加拿大下注主键
     * @return 加拿大下注
     */
    @Override
    public Jndrecord selectJndrecordById(Long id)
    {
        return jndrecordMapper.selectJndrecordById(id);
    }

    /**
     * 查询加拿大下注列表
     * 
     * @param jndrecord 加拿大下注
     * @return 加拿大下注
     */
    @Override
    public List<Jndrecord> selectJndrecordList(Jndrecord jndrecord)
    {
        return jndrecordMapper.selectJndrecordList(jndrecord);
    }

    /**
     * 新增加拿大下注
     * 
     * @param jndrecord 加拿大下注
     * @return 结果
     */
    @Override
    public int insertJndrecord(Jndrecord jndrecord)
    {
        jndrecord.setCreateTime(DateUtils.getNowDate());
        return jndrecordMapper.insertJndrecord(jndrecord);
    }

    /**
     * 修改加拿大下注
     * 
     * @param jndrecord 加拿大下注
     * @return 结果
     */
    @Override
    public int updateJndrecord(Jndrecord jndrecord)
    {
        jndrecord.setUpdateTime(DateUtils.getNowDate());
        return jndrecordMapper.updateJndrecord(jndrecord);
    }

    /**
     * 批量删除加拿大下注
     * 
     * @param ids 需要删除的加拿大下注主键
     * @return 结果
     */
    @Override
    public int deleteJndrecordByIds(Long[] ids)
    {
        return jndrecordMapper.deleteJndrecordByIds(ids);
    }

    /**
     * 删除加拿大下注信息
     * 
     * @param id 加拿大下注主键
     * @return 结果
     */
    @Override
    public int deleteJndrecordById(Long id)
    {
        return jndrecordMapper.deleteJndrecordById(id);
    }
}
