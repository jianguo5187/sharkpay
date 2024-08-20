package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.vo.BetkjRespVo;
import com.ruoyi.system.domain.vo.GameDetailRespVO;
import com.ruoyi.system.domain.vo.GameListRespVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 开奖Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface BetkjMapper
{

    /**
     * 查询开奖列表
     * 
     * @return 开奖集合
     */
    public List<BetkjRespVo> selectBetkjList(@Param("gameId") Long gameId, @Param("betkjTableName") String betkjTableName, @Param("openCodeTableName") String openCodeTableName, @Param("gameType") String gameType, @Param("periods") Long periods, @Param("status") String status);

    public List<GameListRespVO> gameRecordList(@Param("gameId") Long gameId, @Param("betRecordTableName") String betRecordTableName,@Param("userId") Long userId, @Param("filterDay") String filterDay);

    public List<GameDetailRespVO> gameRecordDetail(@Param("gameId") Long gameId, @Param("betRecordTableName") String betRecordTableName, @Param("gameType") String gameType, @Param("userId") Long userId, @Param("periods") Long periods);

    public int clearGameRecode(@Param("gameId") Long gameId, @Param("betRecordTableName") String betRecordTableName, @Param("userId") Long userId);

    public Float selectGameRecordCountMoneyById(@Param("betRecordTableName") String betRecordTableName, @Param("id") Long id);

    public int updateGameRecordDeductType(@Param("betRecordTableName") String betRecordTableName, @Param("id") Long id,@Param("isDeduct") String isDeduct);

    public int deleteAllOldRobotBet();
}
