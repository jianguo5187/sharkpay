package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.apache.ibatis.annotations.Param;

/**
 * 3球下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameThreeballRecordMapper 
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
     * 删除3球下注
     * 
     * @param id 3球下注主键
     * @return 结果
     */
    public int deleteGameThreeballRecordById(Long id);

    /**
     * 批量删除3球下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameThreeballRecordByIds(Long[] ids);

    public int updateGameThreeballRecordTotalAmountByPeriodId(GameThreeballRecord gameThreeballRecord);

    public RecordSumRespVo selectSumRecordByPeriodId(@Param("gameId") Long gameId, @Param("periods") Long periods);

    public List<GameThreeballRecord> selectUserDateList(@Param("gameId") Long gameId, @Param("userId") Long userId, @Param("filterDay") String filterDay);
}
