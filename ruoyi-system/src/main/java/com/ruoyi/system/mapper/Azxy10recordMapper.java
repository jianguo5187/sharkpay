package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Azxy10record;
import com.ruoyi.system.domain.vo.RecordSumRespVo;

/**
 * 澳洲幸运10下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface Azxy10recordMapper 
{
    /**
     * 查询澳洲幸运10下注
     * 
     * @param id 澳洲幸运10下注主键
     * @return 澳洲幸运10下注
     */
    public Azxy10record selectAzxy10recordById(Long id);

    /**
     * 查询澳洲幸运10下注列表
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 澳洲幸运10下注集合
     */
    public List<Azxy10record> selectAzxy10recordList(Azxy10record azxy10record);

    /**
     * 新增澳洲幸运10下注
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 结果
     */
    public int insertAzxy10record(Azxy10record azxy10record);

    /**
     * 修改澳洲幸运10下注
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 结果
     */
    public int updateAzxy10record(Azxy10record azxy10record);

    /**
     * 删除澳洲幸运10下注
     * 
     * @param id 澳洲幸运10下注主键
     * @return 结果
     */
    public int deleteAzxy10recordById(Long id);

    /**
     * 批量删除澳洲幸运10下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAzxy10recordByIds(Long[] ids);

    public int updateAzxy10recordTotalAmountByPeriodId(Azxy10record azxy10record);

    public RecordSumRespVo selectSumRecordByPeriodId(Long periodId);
}
