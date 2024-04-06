package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GameFiveballRecord;
import com.ruoyi.system.domain.GameFiveballRecord;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.apache.ibatis.annotations.Param;

/**
 * 5球下注Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameFiveballRecordMapper 
{
    /**
     * 查询5球下注
     * 
     * @param id 5球下注主键
     * @return 5球下注
     */
    public GameFiveballRecord selectGameFiveballRecordById(Long id);

    /**
     * 查询5球下注列表
     * 
     * @param gameFiveballRecord 5球下注
     * @return 5球下注集合
     */
    public List<GameFiveballRecord> selectGameFiveballRecordList(GameFiveballRecord gameFiveballRecord);

    /**
     * 新增5球下注
     * 
     * @param gameFiveballRecord 5球下注
     * @return 结果
     */
    public int insertGameFiveballRecord(GameFiveballRecord gameFiveballRecord);

    /**
     * 修改5球下注
     * 
     * @param gameFiveballRecord 5球下注
     * @return 结果
     */
    public int updateGameFiveballRecord(GameFiveballRecord gameFiveballRecord);

    /**
     * 删除5球下注
     * 
     * @param id 5球下注主键
     * @return 结果
     */
    public int deleteGameFiveballRecordById(Long id);

    /**
     * 批量删除5球下注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameFiveballRecordByIds(Long[] ids);

    public int updateGameFiveballRecordTotalAmountByPeriodId(GameFiveballRecord GameFiveballRecord);

    public RecordSumRespVo selectSumRecordByPeriodId(@Param("gameId") Long gameId, @Param("periods") Long periods);
}
