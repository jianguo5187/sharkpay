package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameTenballRecord;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 10球下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameTenballRecordMapper 
{
    /**
     * 查询10球下注
     * 
     * @param id 10球下注主键
     * @return 10球下注
     */
    public GameTenballRecord selectGameTenballRecordById(Long id);

    /**
     * 查询10球下注列表
     * 
     * @param gameTenballRecord 10球下注
     * @return 10球下注集合
     */
    public List<GameTenballRecord> selectGameTenballRecordList(GameTenballRecord gameTenballRecord);

    /**
     * 新增10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    public int insertGameTenballRecord(GameTenballRecord gameTenballRecord);

    /**
     * 修改10球下注
     * 
     * @param gameTenballRecord 10球下注
     * @return 结果
     */
    public int updateGameTenballRecord(GameTenballRecord gameTenballRecord);

    /**
     * 删除10球下注
     * 
     * @param id 10球下注主键
     * @return 结果
     */
    public int deleteGameTenballRecordById(Long id);

    /**
     * 批量删除10球下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameTenballRecordByIds(Long[] ids);

    public int updateGameTenballRecordTotalAmountByPeriodId(GameTenballRecord gameTenballRecord);

    public RecordSumRespVo selectSumRecordByPeriodId(@Param("gameId") Long gameId, @Param("periods") Long periods);

    public List<GameTenballRecord> selectUserDateList(@Param("gameId") Long gameId, @Param("userId") Long userId, @Param("filterDay") String filterDay);
}
