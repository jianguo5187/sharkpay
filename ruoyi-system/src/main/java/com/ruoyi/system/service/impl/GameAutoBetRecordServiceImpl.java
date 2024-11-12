package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameAutoBetRecordMapper;
import com.ruoyi.system.domain.GameAutoBetRecord;
import com.ruoyi.system.service.IGameAutoBetRecordService;

/**
 * 追号Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-11
 */
@Service
public class GameAutoBetRecordServiceImpl implements IGameAutoBetRecordService 
{
    @Autowired
    private GameAutoBetRecordMapper gameAutoBetRecordMapper;

    /**
     * 查询追号
     * 
     * @param id 追号主键
     * @return 追号
     */
    @Override
    public GameAutoBetRecord selectGameAutoBetRecordById(Long id)
    {
        return gameAutoBetRecordMapper.selectGameAutoBetRecordById(id);
    }

    /**
     * 查询追号列表
     * 
     * @param gameAutoBetRecord 追号
     * @return 追号
     */
    @Override
    public List<GameAutoBetRecord> selectGameAutoBetRecordList(GameAutoBetRecord gameAutoBetRecord)
    {
        return gameAutoBetRecordMapper.selectGameAutoBetRecordList(gameAutoBetRecord);
    }

    /**
     * 新增追号
     * 
     * @param gameAutoBetRecord 追号
     * @return 结果
     */
    @Override
    public int insertGameAutoBetRecord(GameAutoBetRecord gameAutoBetRecord)
    {
        gameAutoBetRecord.setCreateTime(DateUtils.getNowDate());
        return gameAutoBetRecordMapper.insertGameAutoBetRecord(gameAutoBetRecord);
    }

    /**
     * 修改追号
     * 
     * @param gameAutoBetRecord 追号
     * @return 结果
     */
    @Override
    public int updateGameAutoBetRecord(GameAutoBetRecord gameAutoBetRecord)
    {
        gameAutoBetRecord.setUpdateTime(DateUtils.getNowDate());
        return gameAutoBetRecordMapper.updateGameAutoBetRecord(gameAutoBetRecord);
    }

    /**
     * 批量删除追号
     * 
     * @param ids 需要删除的追号主键
     * @return 结果
     */
    @Override
    public int deleteGameAutoBetRecordByIds(Long[] ids)
    {
        return gameAutoBetRecordMapper.deleteGameAutoBetRecordByIds(ids);
    }

    /**
     * 删除追号信息
     * 
     * @param id 追号主键
     * @return 结果
     */
    @Override
    public int deleteGameAutoBetRecordById(Long id)
    {
        return gameAutoBetRecordMapper.deleteGameAutoBetRecordById(id);
    }

    @Override
    public int cancelAllAutoBetRecord(Long userId, Long gameId) {
        return gameAutoBetRecordMapper.cancelAllAutoBetRecord(userId,gameId);
    }

    @Override
    public List<GameAutoBetRecord> getAutoBetScheduleList(GameAutoBetRecord gameAutoBetRecord) {
        return gameAutoBetRecordMapper.getAutoBetScheduleList(gameAutoBetRecord);
    }
}
