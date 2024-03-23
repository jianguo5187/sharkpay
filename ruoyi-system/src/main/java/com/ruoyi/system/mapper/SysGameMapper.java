package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysGame;

/**
 * 游戏Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
public interface SysGameMapper 
{
    /**
     * 查询游戏
     * 
     * @param gameId 游戏主键
     * @return 游戏
     */
    public SysGame selectSysGameByGameId(Long gameId);

    /**
     * 查询游戏列表
     * 
     * @param sysGame 游戏
     * @return 游戏集合
     */
    public List<SysGame> selectSysGameList(SysGame sysGame);

    /**
     * 新增游戏
     * 
     * @param sysGame 游戏
     * @return 结果
     */
    public int insertSysGame(SysGame sysGame);

    /**
     * 修改游戏
     * 
     * @param sysGame 游戏
     * @return 结果
     */
    public int updateSysGame(SysGame sysGame);

    /**
     * 删除游戏
     * 
     * @param gameId 游戏主键
     * @return 结果
     */
    public int deleteSysGameByGameId(Long gameId);

    /**
     * 批量删除游戏
     * 
     * @param gameIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysGameByGameIds(Long[] gameIds);

    public SysGame selectSysGameByGameMarkId(String gameMarkId);
}
