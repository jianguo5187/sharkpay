package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysGameMapper;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.service.ISysGameService;

/**
 * 游戏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@Service
public class SysGameServiceImpl implements ISysGameService 
{
    @Autowired
    private SysGameMapper sysGameMapper;

    /**
     * 查询游戏
     * 
     * @param gameId 游戏主键
     * @return 游戏
     */
    @Override
    public SysGame selectSysGameByGameId(Long gameId)
    {
        return sysGameMapper.selectSysGameByGameId(gameId);
    }

    /**
     * 查询游戏列表
     * 
     * @param sysGame 游戏
     * @return 游戏
     */
    @Override
    public List<SysGame> selectSysGameList(SysGame sysGame)
    {
        return sysGameMapper.selectSysGameList(sysGame);
    }

    /**
     * 新增游戏
     * 
     * @param sysGame 游戏
     * @return 结果
     */
    @Override
    public int insertSysGame(SysGame sysGame)
    {
        sysGame.setCreateTime(DateUtils.getNowDate());
        return sysGameMapper.insertSysGame(sysGame);
    }

    /**
     * 修改游戏
     * 
     * @param sysGame 游戏
     * @return 结果
     */
    @Override
    public int updateSysGame(SysGame sysGame)
    {
        sysGame.setUpdateTime(DateUtils.getNowDate());
        return sysGameMapper.updateSysGame(sysGame);
    }

    /**
     * 批量删除游戏
     * 
     * @param gameIds 需要删除的游戏主键
     * @return 结果
     */
    @Override
    public int deleteSysGameByGameIds(Long[] gameIds)
    {
        return sysGameMapper.deleteSysGameByGameIds(gameIds);
    }

    /**
     * 删除游戏信息
     * 
     * @param gameId 游戏主键
     * @return 结果
     */
    @Override
    public int deleteSysGameByGameId(Long gameId)
    {
        return sysGameMapper.deleteSysGameByGameId(gameId);
    }
}
