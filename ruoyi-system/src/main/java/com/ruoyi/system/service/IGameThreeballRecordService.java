package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.domain.vo.RecordSumRespVo;

/**
 * 3球下注Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameThreeballRecordService 
{
    /**
     * 查询3球下注
     * 
     * @param id 3球下注主键
     * @return 3球下注
     */
    public GameThreeballRecord selectGameThreeballRecordById(Long id);

    /**
     * 查询3球下注列表
     * 
     * @param gameThreeballRecord 3球下注
     * @return 3球下注集合
     */
    public List<GameThreeballRecord> selectGameThreeballRecordList(GameThreeballRecord gameThreeballRecord);

    /**
     * 新增3球下注
     * 
     * @param gameThreeballRecord 3球下注
     * @return 结果
     */
    public int insertGameThreeballRecord(GameThreeballRecord gameThreeballRecord);

    /**
     * 修改3球下注
     * 
     * @param gameThreeballRecord 3球下注
     * @return 结果
     */
    public int updateGameThreeballRecord(GameThreeballRecord gameThreeballRecord);

    /**
     * 批量删除3球下注
     * 
     * @param ids 需要删除的3球下注主键集合
     * @return 结果
     */
    public int deleteGameThreeballRecordByIds(Long[] ids);

    /**
     * 删除3球下注信息
     * 
     * @param id 3球下注主键
     * @return 结果
     */
    public int deleteGameThreeballRecordById(Long id);

    public int updateGameThreeballRecordTotalAmountByPeriodId(GameThreeballRecord gameThreeballRecord);

    public RecordSumRespVo selectSumRecordByPeriodId(Long gameId, Long periods);
}
