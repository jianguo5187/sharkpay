package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.service.IUsermoneyService;

/**
 * 用户资金流水Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@Service
public class UsermoneyServiceImpl implements IUsermoneyService 
{
    @Autowired
    private UsermoneyMapper usermoneyMapper;

    /**
     * 查询用户资金流水
     * 
     * @param id 用户资金流水主键
     * @return 用户资金流水
     */
    @Override
    public Usermoney selectUsermoneyById(Long id)
    {
        return usermoneyMapper.selectUsermoneyById(id);
    }

    /**
     * 查询用户资金流水列表
     * 
     * @param usermoney 用户资金流水
     * @return 用户资金流水
     */
    @Override
    public List<Usermoney> selectUsermoneyList(Usermoney usermoney)
    {
        return usermoneyMapper.selectUsermoneyList(usermoney);
    }

    /**
     * 新增用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    @Override
    public int insertUsermoney(Usermoney usermoney)
    {
        usermoney.setCreateTime(DateUtils.getNowDate());
        return usermoneyMapper.insertUsermoney(usermoney);
    }

    /**
     * 修改用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    @Override
    public int updateUsermoney(Usermoney usermoney)
    {
        usermoney.setUpdateTime(DateUtils.getNowDate());
        return usermoneyMapper.updateUsermoney(usermoney);
    }

    /**
     * 批量删除用户资金流水
     * 
     * @param ids 需要删除的用户资金流水主键
     * @return 结果
     */
    @Override
    public int deleteUsermoneyByIds(Long[] ids)
    {
        return usermoneyMapper.deleteUsermoneyByIds(ids);
    }

    /**
     * 删除用户资金流水信息
     * 
     * @param id 用户资金流水主键
     * @return 结果
     */
    @Override
    public int deleteUsermoneyById(Long id)
    {
        return usermoneyMapper.deleteUsermoneyById(id);
    }
}
