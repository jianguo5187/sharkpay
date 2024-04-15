package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.vo.BetkjRespVo;
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
    public List<BetkjRespVo> selectBetkjList(@Param("gameId") Long gameId, @Param("betkjTableName") String betkjTableName, @Param("gameType") String gameType, @Param("periods") Long periods, @Param("status") String status);

    public List<GameListRespVO> gameRecordList(@Param("gameId") Long gameId, @Param("betRecordTableName") String betRecordTableName,@Param("userId") Long userId, @Param("filterDay") String filterDay);
}
