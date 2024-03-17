package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Azxy10;

/**
 * 澳洲幸运10开奖历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface Azxy10Mapper 
{
    /**
     * 查询澳洲幸运10开奖历史
     * 
     * @param id 澳洲幸运10开奖历史主键
     * @return 澳洲幸运10开奖历史
     */
    public Azxy10 selectAzxy10ById(Long id);

    /**
     * 查询澳洲幸运10开奖历史列表
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 澳洲幸运10开奖历史集合
     */
    public List<Azxy10> selectAzxy10List(Azxy10 azxy10);

    /**
     * 新增澳洲幸运10开奖历史
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 结果
     */
    public int insertAzxy10(Azxy10 azxy10);

    /**
     * 修改澳洲幸运10开奖历史
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 结果
     */
    public int updateAzxy10(Azxy10 azxy10);

    /**
     * 删除澳洲幸运10开奖历史
     * 
     * @param id 澳洲幸运10开奖历史主键
     * @return 结果
     */
    public int deleteAzxy10ById(Long id);

    /**
     * 批量删除澳洲幸运10开奖历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAzxy10ByIds(Long[] ids);
}
