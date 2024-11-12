package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameAutoBetRecord;

/**
 * 追号Service接口
 * 
 * @author ruoyi
 * @date 2024-11-11
 */
public interface IGameAutoBetRecordService 
{
    /**
     * 查询追号
     * 
     * @param id 追号主键
     * @return 追号
     */
    public GameAutoBetRecord selectGameAutoBetRecordById(Long id);

    /**
     * 查询追号列表
     * 
     * @param gameAutoBetRecord 追号
     * @return 追号集合
     */
    public List<GameAutoBetRecord> selectGameAutoBetRecordList(GameAutoBetRecord gameAutoBetRecord);

    /**
     * 新增追号
     * 
     * @param gameAutoBetRecord 追号
     * @return 结果
     */
    public int insertGameAutoBetRecord(GameAutoBetRecord gameAutoBetRecord);

    /**
     * 修改追号
     * 
     * @param gameAutoBetRecord 追号
     * @return 结果
     */
    public int updateGameAutoBetRecord(GameAutoBetRecord gameAutoBetRecord);

    /**
     * 批量删除追号
     * 
     * @param ids 需要删除的追号主键集合
     * @return 结果
     */
    public int deleteGameAutoBetRecordByIds(Long[] ids);

    /**
     * 删除追号信息
     * 
     * @param id 追号主键
     * @return 结果
     */
    public int deleteGameAutoBetRecordById(Long id);

    public int cancelAllAutoBetRecord(Long userId,Long gameId);

    public List<GameAutoBetRecord> getAutoBetScheduleList(GameAutoBetRecord gameAutoBetRecord);
}
