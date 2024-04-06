package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameFiveballRecordMapper;
import com.ruoyi.system.domain.GameFiveballRecord;
import com.ruoyi.system.service.IGameFiveballRecordService;

/**
 * 5球下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameFiveballRecordServiceImpl implements IGameFiveballRecordService 
{
    @Autowired
    private GameFiveballRecordMapper gameFiveballRecordMapper;

    /**
     * 查询5球下注
     * 
     * @param id 5球下注主键
     * @return 5球下注
     */
    @Override
    public GameFiveballRecord selectGameFiveballRecordById(Long id)
    {
        return gameFiveballRecordMapper.selectGameFiveballRecordById(id);
    }

    /**
     * 查询5球下注列表
     * 
     * @param gameFiveballRecord 5球下注
     * @return 5球下注
     */
    @Override
    public List<GameFiveballRecord> selectGameFiveballRecordList(GameFiveballRecord gameFiveballRecord)
    {
        return gameFiveballRecordMapper.selectGameFiveballRecordList(gameFiveballRecord);
    }

    /**
     * 新增5球下注
     * 
     * @param gameFiveballRecord 5球下注
     * @return 结果
     */
    @Override
    public int insertGameFiveballRecord(GameFiveballRecord gameFiveballRecord)
    {
        gameFiveballRecord.setCreateTime(DateUtils.getNowDate());
        return gameFiveballRecordMapper.insertGameFiveballRecord(gameFiveballRecord);
    }

    /**
     * 修改5球下注
     * 
     * @param gameFiveballRecord 5球下注
     * @return 结果
     */
    @Override
    public int updateGameFiveballRecord(GameFiveballRecord gameFiveballRecord)
    {
        gameFiveballRecord.setUpdateTime(DateUtils.getNowDate());
        return gameFiveballRecordMapper.updateGameFiveballRecord(gameFiveballRecord);
    }

    /**
     * 批量删除5球下注
     * 
     * @param ids 需要删除的5球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballRecordByIds(Long[] ids)
    {
        return gameFiveballRecordMapper.deleteGameFiveballRecordByIds(ids);
    }

    /**
     * 删除5球下注信息
     * 
     * @param id 5球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballRecordById(Long id)
    {
        return gameFiveballRecordMapper.deleteGameFiveballRecordById(id);
    }

    @Override
    public int updateGameFiveballRecordTotalAmountByPeriodId(GameFiveballRecord gameFiveballRecord) {
        return gameFiveballRecordMapper.updateGameFiveballRecordTotalAmountByPeriodId(gameFiveballRecord);
    }

    @Override
    public RecordSumRespVo selectSumRecordByPeriodId(Long gameId, Long periods) {
        return gameFiveballRecordMapper.selectSumRecordByPeriodId(gameId,periods);
    }
}
