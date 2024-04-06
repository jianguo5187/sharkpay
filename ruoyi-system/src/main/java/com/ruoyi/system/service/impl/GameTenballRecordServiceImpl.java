package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameTenballRecordMapper;
import com.ruoyi.system.domain.GameTenballRecord;
import com.ruoyi.system.service.IGameTenballRecordService;

/**
 * 10球下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameTenballRecordServiceImpl implements IGameTenballRecordService 
{
    @Autowired
    private GameTenballRecordMapper gameTenballRecordMapper;

    /**
     * 查询10球下注
     * 
     * @param id 10球下注主键
     * @return 10球下注
     */
    @Override
    public GameTenballRecord selectGameTenballRecordById(Long id)
    {
        return gameTenballRecordMapper.selectGameTenballRecordById(id);
    }

    /**
     * 查询10球下注列表
     * 
     * @param gameTenballRecord 10球下注
     * @return 10球下注
     */
    @Override
    public List<GameTenballRecord> selectGameTenballRecordList(GameTenballRecord gameTenballRecord)
    {
        return gameTenballRecordMapper.selectGameTenballRecordList(gameTenballRecord);
    }

    /**
     * 新增10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    @Override
    public int insertGameTenballRecord(GameTenballRecord gameTenballRecord)
    {
        gameTenballRecord.setCreateTime(DateUtils.getNowDate());
        return gameTenballRecordMapper.insertGameTenballRecord(gameTenballRecord);
    }

    /**
     * 修改10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    @Override
    public int updateGameTenballRecord(GameTenballRecord gameTenballRecord)
    {
        gameTenballRecord.setUpdateTime(DateUtils.getNowDate());
        return gameTenballRecordMapper.updateGameTenballRecord(gameTenballRecord);
    }

    /**
     * 批量删除10球下注
     * 
     * @param ids 需要删除的10球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballRecordByIds(Long[] ids)
    {
        return gameTenballRecordMapper.deleteGameTenballRecordByIds(ids);
    }

    /**
     * 删除10球下注信息
     * 
     * @param id 10球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballRecordById(Long id)
    {
        return gameTenballRecordMapper.deleteGameTenballRecordById(id);
    }

    @Override
    public int updateGameTenballRecordTotalAmountByPeriodId(GameTenballRecord gameTenballRecord) {
        return gameTenballRecordMapper.updateGameTenballRecordTotalAmountByPeriodId(gameTenballRecord);
    }

    @Override
    public RecordSumRespVo selectSumRecordByPeriodId(Long gameId, Long periods) {
        return gameTenballRecordMapper.selectSumRecordByPeriodId(gameId,periods);
    }
}
