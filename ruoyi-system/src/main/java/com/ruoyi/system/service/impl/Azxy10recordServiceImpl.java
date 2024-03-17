package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.Azxy10recordMapper;
import com.ruoyi.system.domain.Azxy10record;
import com.ruoyi.system.service.IAzxy10recordService;

/**
 * 澳洲幸运10下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class Azxy10recordServiceImpl implements IAzxy10recordService 
{
    @Autowired
    private Azxy10recordMapper azxy10recordMapper;

    /**
     * 查询澳洲幸运10下注
     * 
     * @param id 澳洲幸运10下注主键
     * @return 澳洲幸运10下注
     */
    @Override
    public Azxy10record selectAzxy10recordById(Long id)
    {
        return azxy10recordMapper.selectAzxy10recordById(id);
    }

    /**
     * 查询澳洲幸运10下注列表
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 澳洲幸运10下注
     */
    @Override
    public List<Azxy10record> selectAzxy10recordList(Azxy10record azxy10record)
    {
        return azxy10recordMapper.selectAzxy10recordList(azxy10record);
    }

    /**
     * 新增澳洲幸运10下注
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 结果
     */
    @Override
    public int insertAzxy10record(Azxy10record azxy10record)
    {
        azxy10record.setCreateTime(DateUtils.getNowDate());
        return azxy10recordMapper.insertAzxy10record(azxy10record);
    }

    /**
     * 修改澳洲幸运10下注
     * 
     * @param azxy10record 澳洲幸运10下注
     * @return 结果
     */
    @Override
    public int updateAzxy10record(Azxy10record azxy10record)
    {
        azxy10record.setUpdateTime(DateUtils.getNowDate());
        return azxy10recordMapper.updateAzxy10record(azxy10record);
    }

    /**
     * 批量删除澳洲幸运10下注
     * 
     * @param ids 需要删除的澳洲幸运10下注主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10recordByIds(Long[] ids)
    {
        return azxy10recordMapper.deleteAzxy10recordByIds(ids);
    }

    /**
     * 删除澳洲幸运10下注信息
     * 
     * @param id 澳洲幸运10下注主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10recordById(Long id)
    {
        return azxy10recordMapper.deleteAzxy10recordById(id);
    }
}
