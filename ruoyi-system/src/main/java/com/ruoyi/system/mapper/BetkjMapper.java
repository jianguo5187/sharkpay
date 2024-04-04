package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.vo.BetkjRespVo;
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
    public List<BetkjRespVo> selectBetkjList(@Param("betkjTableName") String betkjTableName, @Param("gameType") String gameType, @Param("periods") Long periods, @Param("status") String status);
}
