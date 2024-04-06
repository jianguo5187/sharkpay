package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameThreeballRecordMapper;
import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.service.IGameThreeballRecordService;

/**
 * 3球下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameThreeballRecordServiceImpl implements IGameThreeballRecordService 
{
    @Autowired
    private GameThreeballRecordMapper gameThreeballRecordMapper;

    /**
     * 查询3球下注
     * 
     * @param id 3球下注主键
     * @return 3球下注
     */
    @Override
    public GameThreeballRecord selectGameThreeballRecordById(Long id)
    {
        return gameThreeballRecordMapper.selectGameThreeballRecordById(id);
    }

    /**
     * 查询3球下注列表
     * 
     * @param gameThreeballRecord 3球下注
     * @return 3球下注
     */
    @Override
    public List<GameThreeballRecord> selectGameThreeballRecordList(GameThreeballRecord gameThreeballRecord)
    {
        return gameThreeballRecordMapper.selectGameThreeballRecordList(gameThreeballRecord);
    }

    /**
     * 新增3球下注
     * 
     * @param gameThreeballRecord 3球下注
     * @return 结果
     */
    @Override
    public int insertGameThreeballRecord(GameThreeballRecord gameThreeballRecord)
    {
        gameThreeballRecord.setCreateTime(DateUtils.getNowDate());
        return gameThreeballRecordMapper.insertGameThreeballRecord(gameThreeballRecord);
    }

    /**
     * 修改3球下注
     * 
     * @param gameThreeballRecord 3球下注
     * @return 结果
     */
    @Override
    public int updateGameThreeballRecord(GameThreeballRecord gameThreeballRecord)
    {
        gameThreeballRecord.setUpdateTime(DateUtils.getNowDate());
        return gameThreeballRecordMapper.updateGameThreeballRecord(gameThreeballRecord);
    }

    /**
     * 批量删除3球下注
     * 
     * @param ids 需要删除的3球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballRecordByIds(Long[] ids)
    {
        return gameThreeballRecordMapper.deleteGameThreeballRecordByIds(ids);
    }

    /**
     * 删除3球下注信息
     * 
     * @param id 3球下注主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballRecordById(Long id)
    {
        return gameThreeballRecordMapper.deleteGameThreeballRecordById(id);
    }

    @Override
    public int updateGameThreeballRecordTotalAmountByPeriodId(GameThreeballRecord gameThreeballRecord) {
        return gameThreeballRecordMapper.updateGameThreeballRecordTotalAmountByPeriodId(gameThreeballRecord);
    }

    @Override
    public RecordSumRespVo selectSumRecordByPeriodId(Long gameId, Long periods) {
        return gameThreeballRecordMapper.selectSumRecordByPeriodId(gameId,periods);
    }
}
