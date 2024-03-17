package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BetRecordMapper;
import com.ruoyi.system.domain.BetRecord;
import com.ruoyi.system.service.IBetRecordService;

/**
 * 投注单Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class BetRecordServiceImpl implements IBetRecordService 
{
    @Autowired
    private BetRecordMapper betRecordMapper;

    /**
     * 查询投注单
     * 
     * @param betId 投注单主键
     * @return 投注单
     */
    @Override
    public BetRecord selectBetRecordByBetId(Long betId)
    {
        return betRecordMapper.selectBetRecordByBetId(betId);
    }

    /**
     * 查询投注单列表
     * 
     * @param betRecord 投注单
     * @return 投注单
     */
    @Override
    public List<BetRecord> selectBetRecordList(BetRecord betRecord)
    {
        return betRecordMapper.selectBetRecordList(betRecord);
    }

    /**
     * 新增投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    @Override
    public int insertBetRecord(BetRecord betRecord)
    {
        betRecord.setCreateTime(DateUtils.getNowDate());
        return betRecordMapper.insertBetRecord(betRecord);
    }

    /**
     * 修改投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    @Override
    public int updateBetRecord(BetRecord betRecord)
    {
        betRecord.setUpdateTime(DateUtils.getNowDate());
        return betRecordMapper.updateBetRecord(betRecord);
    }

    /**
     * 批量删除投注单
     * 
     * @param betIds 需要删除的投注单主键
     * @return 结果
     */
    @Override
    public int deleteBetRecordByBetIds(Long[] betIds)
    {
        return betRecordMapper.deleteBetRecordByBetIds(betIds);
    }

    /**
     * 删除投注单信息
     * 
     * @param betId 投注单主键
     * @return 结果
     */
    @Override
    public int deleteBetRecordByBetId(Long betId)
    {
        return betRecordMapper.deleteBetRecordByBetId(betId);
    }
}
