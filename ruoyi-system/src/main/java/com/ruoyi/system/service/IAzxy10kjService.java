package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Azxy10kj;

/**
 * 澳洲幸运10开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IAzxy10kjService 
{
    /**
     * 查询澳洲幸运10开奖
     * 
     * @param id 澳洲幸运10开奖主键
     * @return 澳洲幸运10开奖
     */
    public Azxy10kj selectAzxy10kjById(Long id);

    /**
     * 查询澳洲幸运10开奖列表
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 澳洲幸运10开奖集合
     */
    public List<Azxy10kj> selectAzxy10kjList(Azxy10kj azxy10kj);

    /**
     * 新增澳洲幸运10开奖
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 结果
     */
    public int insertAzxy10kj(Azxy10kj azxy10kj);

    /**
     * 修改澳洲幸运10开奖
     * 
     * @param azxy10kj 澳洲幸运10开奖
     * @return 结果
     */
    public int updateAzxy10kj(Azxy10kj azxy10kj);

    /**
     * 批量删除澳洲幸运10开奖
     * 
     * @param ids 需要删除的澳洲幸运10开奖主键集合
     * @return 结果
     */
    public int deleteAzxy10kjByIds(Long[] ids);

    /**
     * 删除澳洲幸运10开奖信息
     * 
     * @param id 澳洲幸运10开奖主键
     * @return 结果
     */
    public int deleteAzxy10kjById(Long id);

    public Azxy10kj selectLastRecord(String status);

    public List<Azxy10kj> selectAzxy10kjListWithStatusZeroAndLimit(Long id,String status,String idAscFlg,String idDescFlg,Integer limitNumber);
}