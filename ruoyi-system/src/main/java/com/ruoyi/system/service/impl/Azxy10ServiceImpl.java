package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.Azxy10Mapper;
import com.ruoyi.system.domain.Azxy10;
import com.ruoyi.system.service.IAzxy10Service;

/**
 * 澳洲幸运10开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class Azxy10ServiceImpl implements IAzxy10Service 
{
    @Autowired
    private Azxy10Mapper azxy10Mapper;

    /**
     * 查询澳洲幸运10开奖历史
     * 
     * @param id 澳洲幸运10开奖历史主键
     * @return 澳洲幸运10开奖历史
     */
    @Override
    public Azxy10 selectAzxy10ById(Long id)
    {
        return azxy10Mapper.selectAzxy10ById(id);
    }

    /**
     * 查询澳洲幸运10开奖历史列表
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 澳洲幸运10开奖历史
     */
    @Override
    public List<Azxy10> selectAzxy10List(Azxy10 azxy10)
    {
        return azxy10Mapper.selectAzxy10List(azxy10);
    }

    /**
     * 新增澳洲幸运10开奖历史
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 结果
     */
    @Override
    public int insertAzxy10(Azxy10 azxy10)
    {
        azxy10.setCreateTime(DateUtils.getNowDate());
        return azxy10Mapper.insertAzxy10(azxy10);
    }

    /**
     * 修改澳洲幸运10开奖历史
     * 
     * @param azxy10 澳洲幸运10开奖历史
     * @return 结果
     */
    @Override
    public int updateAzxy10(Azxy10 azxy10)
    {
        azxy10.setUpdateTime(DateUtils.getNowDate());
        return azxy10Mapper.updateAzxy10(azxy10);
    }

    /**
     * 批量删除澳洲幸运10开奖历史
     * 
     * @param ids 需要删除的澳洲幸运10开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10ByIds(Long[] ids)
    {
        return azxy10Mapper.deleteAzxy10ByIds(ids);
    }

    /**
     * 删除澳洲幸运10开奖历史信息
     * 
     * @param id 澳洲幸运10开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10ById(Long id)
    {
        return azxy10Mapper.deleteAzxy10ById(id);
    }

    @Override
    public Azxy10 selectLastRecord() {
        return azxy10Mapper.selectLastRecord();
    }

    @Override
    public List<Azxy10> selectAzxy10ListByParam(String idDescFlg, Integer limitNumber) {
        return azxy10Mapper.selectAzxy10ListByParam(idDescFlg,limitNumber);
    }
}
