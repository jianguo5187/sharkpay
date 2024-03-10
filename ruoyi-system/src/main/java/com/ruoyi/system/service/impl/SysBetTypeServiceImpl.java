package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysBetTypeMapper;
import com.ruoyi.system.domain.SysBetType;
import com.ruoyi.system.service.ISysBetTypeService;

/**
 * 游戏玩法Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-10
 */
@Service
public class SysBetTypeServiceImpl implements ISysBetTypeService 
{
    @Autowired
    private SysBetTypeMapper sysBetTypeMapper;

    /**
     * 查询游戏玩法
     * 
     * @param betTypeId 游戏玩法主键
     * @return 游戏玩法
     */
    @Override
    public SysBetType selectSysBetTypeByBetTypeId(Long betTypeId)
    {
        return sysBetTypeMapper.selectSysBetTypeByBetTypeId(betTypeId);
    }

    /**
     * 查询游戏玩法列表
     * 
     * @param sysBetType 游戏玩法
     * @return 游戏玩法
     */
    @Override
    public List<SysBetType> selectSysBetTypeList(SysBetType sysBetType)
    {
        return sysBetTypeMapper.selectSysBetTypeList(sysBetType);
    }

    /**
     * 新增游戏玩法
     * 
     * @param sysBetType 游戏玩法
     * @return 结果
     */
    @Override
    public int insertSysBetType(SysBetType sysBetType)
    {
        sysBetType.setCreateTime(DateUtils.getNowDate());
        return sysBetTypeMapper.insertSysBetType(sysBetType);
    }

    /**
     * 修改游戏玩法
     * 
     * @param sysBetType 游戏玩法
     * @return 结果
     */
    @Override
    public int updateSysBetType(SysBetType sysBetType)
    {
        sysBetType.setUpdateTime(DateUtils.getNowDate());
        return sysBetTypeMapper.updateSysBetType(sysBetType);
    }

    /**
     * 批量删除游戏玩法
     * 
     * @param betTypeIds 需要删除的游戏玩法主键
     * @return 结果
     */
    @Override
    public int deleteSysBetTypeByBetTypeIds(Long[] betTypeIds)
    {
        return sysBetTypeMapper.deleteSysBetTypeByBetTypeIds(betTypeIds);
    }

    /**
     * 删除游戏玩法信息
     * 
     * @param betTypeId 游戏玩法主键
     * @return 结果
     */
    @Override
    public int deleteSysBetTypeByBetTypeId(Long betTypeId)
    {
        return sysBetTypeMapper.deleteSysBetTypeByBetTypeId(betTypeId);
    }
}
