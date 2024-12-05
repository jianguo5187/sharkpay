package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BetRecord;
import com.ruoyi.system.domain.vo.*;
import org.apache.ibatis.annotations.Param;

/**
 * 投注单Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface BetRecordMapper 
{
    /**
     * 查询投注单
     * 
     * @param betId 投注单主键
     * @return 投注单
     */
    public BetRecord selectBetRecordByBetId(Long betId);

    /**
     * 查询投注单列表
     * 
     * @param betRecord 投注单
     * @return 投注单集合
     */
    public List<BetRecord> selectBetRecordList(BetRecord betRecord);

    /**
     * 新增投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    public int insertBetRecord(BetRecord betRecord);

    /**
     * 修改投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    public int updateBetRecord(BetRecord betRecord);

    /**
     * 删除投注单
     * 
     * @param betId 投注单主键
     * @return 结果
     */
    public int deleteBetRecordByBetId(Long betId);

    /**
     * 批量删除投注单
     * 
     * @param betIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBetRecordByBetIds(Long[] betIds);


    public int updateLotteryResult(BetRecord betRecord);

    public List<BetRecordListRespVO> selectBetRecordListByPeriods(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("lastBetRecordId") Long lastBetRecordId, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);

    public int cancelBetRecordByPeriods(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("userId") Long userId, @Param("isDelete") String isDelete);

    public List<BetRealTimeRespVO> selectBetRealTimeList(BetRealTimeReqVO betRealTimeReqVO);

    public Float selectBetToalAmount(@Param("userId") Long userId,@Param("filterDate") String filterDate);

    public List<WeeKGameBetRespVO> selectWeekGameBetList();

    public List<VirtuallyGameRecordRespVO> getVirtuallyRecordList(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("lastBetRecordId") Long lastBetRecordId);
}
