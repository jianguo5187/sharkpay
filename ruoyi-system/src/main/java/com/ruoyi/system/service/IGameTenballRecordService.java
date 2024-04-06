package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameTenballRecord;
import com.ruoyi.system.domain.vo.RecordSumRespVo;

/**
 * 10球下注Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameTenballRecordService 
{
    /**
     * 查询10球下注
     * 
     * @param id 10球下注主键
     * @return 10球下注
     */
    public GameTenballRecord selectGameTenballRecordById(Long id);

    /**
     * 查询10球下注列表
     * 
     * @param gameTenballRecord 10球下注
     * @return 10球下注集合
     */
    public List<GameTenballRecord> selectGameTenballRecordList(GameTenballRecord gameTenballRecord);

    /**
     * 新增10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    public int insertGameTenballRecord(GameTenballRecord gameTenballRecord);

    /**
     * 修改10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    public int updateGameTenballRecord(GameTenballRecord gameTenballRecord);

    /**
     * 批量删除10球下注
     * 
     * @param ids 需要删除的10球下注主键集合
     * @return 结果
     */
    public int deleteGameTenballRecordByIds(Long[] ids);

    /**
     * 删除10球下注信息
     * 
     * @param id 10球下注主键
     * @return 结果
     */
    public int deleteGameTenballRecordById(Long id);

    public int updateGameTenballRecordTotalAmountByPeriodId(GameTenballRecord gameTenballRecord);

    public RecordSumRespVo selectSumRecordByPeriodId(Long gameId, Long periods);
}
