package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Jndrecord;

/**
 * 加拿大下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface JndrecordMapper 
{
    /**
     * 查询加拿大下注
     * 
     * @param id 加拿大下注主键
     * @return 加拿大下注
     */
    public Jndrecord selectJndrecordById(Long id);

    /**
     * 查询加拿大下注列表
     * 
     * @param jndrecord 加拿大下注
     * @return 加拿大下注集合
     */
    public List<Jndrecord> selectJndrecordList(Jndrecord jndrecord);

    /**
     * 新增加拿大下注
     * 
     * @param jndrecord 加拿大下注
     * @return 结果
     */
    public int insertJndrecord(Jndrecord jndrecord);

    /**
     * 修改加拿大下注
     * 
     * @param jndrecord 加拿大下注
     * @return 结果
     */
    public int updateJndrecord(Jndrecord jndrecord);

    /**
     * 删除加拿大下注
     * 
     * @param id 加拿大下注主键
     * @return 结果
     */
    public int deleteJndrecordById(Long id);

    /**
     * 批量删除加拿大下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJndrecordByIds(Long[] ids);
}