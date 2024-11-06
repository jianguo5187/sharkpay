package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GameSystemOpenData;
import org.apache.ibatis.annotations.Param;

/**
 * 系统开奖开奖历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-06
 */
public interface GameSystemOpenDataMapper 
{
    /**
     * 查询系统开奖开奖历史
     * 
     * @param id 系统开奖开奖历史主键
     * @return 系统开奖开奖历史
     */
    public GameSystemOpenData selectGameSystemOpenDataById(Long id);

    /**
     * 查询系统开奖开奖历史列表
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 系统开奖开奖历史集合
     */
    public List<GameSystemOpenData> selectGameSystemOpenDataList(GameSystemOpenData gameSystemOpenData);

    /**
     * 新增系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    public int insertGameSystemOpenData(GameSystemOpenData gameSystemOpenData);

    /**
     * 修改系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    public int updateGameSystemOpenData(GameSystemOpenData gameSystemOpenData);

    /**
     * 删除系统开奖开奖历史
     * 
     * @param id 系统开奖开奖历史主键
     * @return 结果
     */
    public int deleteGameSystemOpenDataById(Long id);

    /**
     * 批量删除系统开奖开奖历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameSystemOpenDataByIds(Long[] ids);

    public Long selectMaxPeriodsByGameSystemMark(@Param("gameSystemMark") String gameSystemMark);

    public GameSystemOpenData selectLastRecordByGameSystemMark(@Param("gameSystemMark") String gameSystemMark);

    public GameSystemOpenData selectGamelOpenDataByGameSystemMarkAndPeriods(@Param("gameSystemMark") String gameSystemMark, @Param("periods")Long periods, @Param("status") String status);


    public List<GameSystemOpenData> selectNotOpenSystemOpenDataByGameSystemMark(@Param("gameSystemMark") String gameSystemMark);
}
