package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Usermoney;

/**
 * 用户资金流水Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface UsermoneyMapper 
{
    /**
     * 查询用户资金流水
     * 
     * @param id 用户资金流水主键
     * @return 用户资金流水
     */
    public Usermoney selectUsermoneyById(Long id);

    /**
     * 查询用户资金流水列表
     * 
     * @param usermoney 用户资金流水
     * @return 用户资金流水集合
     */
    public List<Usermoney> selectUsermoneyList(Usermoney usermoney);

    /**
     * 新增用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    public int insertUsermoney(Usermoney usermoney);

    /**
     * 修改用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    public int updateUsermoney(Usermoney usermoney);

    /**
     * 删除用户资金流水
     * 
     * @param id 用户资金流水主键
     * @return 结果
     */
    public int deleteUsermoneyById(Long id);

    /**
     * 批量删除用户资金流水
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUsermoneyByIds(Long[] ids);
}