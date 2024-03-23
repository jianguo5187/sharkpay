package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysGame;

/**
 * 游戏Service接口
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
public interface ISysGameService 
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
     * 批量删除游戏
     * 
     * @param gameIds 需要删除的游戏主键集合
     * @return 结果
     */
    public int deleteSysGameByGameIds(Long[] gameIds);

    /**
     * 删除游戏信息
     * 
     * @param gameId 游戏主键
     * @return 结果
     */
    public int deleteSysGameByGameId(Long gameId);


    public SysGame selectSysGameByGameMarkId(String gameMarkId);
}
