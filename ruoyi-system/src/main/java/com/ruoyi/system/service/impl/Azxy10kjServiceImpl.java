package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.Azxy10kjMapper;
import com.ruoyi.system.domain.Azxy10kj;
import com.ruoyi.system.service.IAzxy10kjService;

/**
 * 澳洲幸运10开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class Azxy10kjServiceImpl implements IAzxy10kjService 
{
    @Autowired
    private Azxy10kjMapper azxy10kjMapper;

    /**
     * 查询澳洲幸运10开奖
     * 
     * @param id 澳洲幸运10开奖主键
     * @return 澳洲幸运10开奖
     */
    @Override
    public Azxy10kj selectAzxy10kjById(Long id)
    {
        return azxy10kjMapper.selectAzxy10kjById(id);
    }

    /**
     * 查询澳洲幸运10开奖列表
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 澳洲幸运10开奖
     */
    @Override
    public List<Azxy10kj> selectAzxy10kjList(Azxy10kj azxy10kj)
    {
        return azxy10kjMapper.selectAzxy10kjList(azxy10kj);
    }

    /**
     * 新增澳洲幸运10开奖
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 结果
     */
    @Override
    public int insertAzxy10kj(Azxy10kj azxy10kj)
    {
        azxy10kj.setCreateTime(DateUtils.getNowDate());
        return azxy10kjMapper.insertAzxy10kj(azxy10kj);
    }

    /**
     * 修改澳洲幸运10开奖
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 结果
     */
    @Override
    public int updateAzxy10kj(Azxy10kj azxy10kj)
    {
        azxy10kj.setUpdateTime(DateUtils.getNowDate());
        return azxy10kjMapper.updateAzxy10kj(azxy10kj);
    }

    /**
     * 批量删除澳洲幸运10开奖
     * 
     * @param ids 需要删除的澳洲幸运10开奖主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10kjByIds(Long[] ids)
    {
        return azxy10kjMapper.deleteAzxy10kjByIds(ids);
    }

    /**
     * 删除澳洲幸运10开奖信息
     * 
     * @param id 澳洲幸运10开奖主键
     * @return 结果
     */
    @Override
    public int deleteAzxy10kjById(Long id)
    {
        return azxy10kjMapper.deleteAzxy10kjById(id);
    }

    @Override
    public Azxy10kj selectLastRecord(String status) {
        return azxy10kjMapper.selectLastRecord(status);
    }

    @Override
    public List<Azxy10kj> selectAzxy10kjListWithStatusZeroAndLimit(Long id, String status,String idAscFlg,String idDescFlg, Integer limitNumber) {
        return azxy10kjMapper.selectAzxy10kjListWithStatusZeroAndLimit(id,status,idAscFlg,idDescFlg,limitNumber);
    }
}
