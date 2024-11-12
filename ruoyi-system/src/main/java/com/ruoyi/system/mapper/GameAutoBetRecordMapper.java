package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GameAutoBetRecord;
import org.apache.ibatis.annotations.Param;

/**
 * 追号Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-11
 */
public interface GameAutoBetRecordMapper 
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
     * 删除追号
     * 
     * @param id 追号主键
     * @return 结果
     */
    public int deleteGameAutoBetRecordById(Long id);

    /**
     * 批量删除追号
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameAutoBetRecordByIds(Long[] ids);


    public int cancelAllAutoBetRecord(@Param("userId") Long userId,@Param("gameId") Long gameId);

    public List<GameAutoBetRecord> getAutoBetScheduleList(GameAutoBetRecord gameAutoBetRecord);
}
