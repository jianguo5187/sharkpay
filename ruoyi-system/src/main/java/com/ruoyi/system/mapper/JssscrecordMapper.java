package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Jssscrecord;

/**
 * 极速时时彩下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface JssscrecordMapper 
{
    /**
     * 查询极速时时彩下注
     * 
     * @param id 极速时时彩下注主键
     * @return 极速时时彩下注
     */
    public Jssscrecord selectJssscrecordById(Long id);

    /**
     * 查询极速时时彩下注列表
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 极速时时彩下注集合
     */
    public List<Jssscrecord> selectJssscrecordList(Jssscrecord jssscrecord);

    /**
     * 新增极速时时彩下注
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 结果
     */
    public int insertJssscrecord(Jssscrecord jssscrecord);

    /**
     * 修改极速时时彩下注
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 结果
     */
    public int updateJssscrecord(Jssscrecord jssscrecord);

    /**
     * 删除极速时时彩下注
     * 
     * @param id 极速时时彩下注主键
     * @return 结果
     */
    public int deleteJssscrecordById(Long id);

    /**
     * 批量删除极速时时彩下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJssscrecordByIds(Long[] ids);
}
