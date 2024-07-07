package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysUserActiveMapper;
import com.ruoyi.system.domain.SysUserActive;
import com.ruoyi.system.service.ISysUserActiveService;

/**
 * 用户存活状况Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-05
 */
@Service
public class SysUserActiveServiceImpl implements ISysUserActiveService 
{
    @Autowired
    private SysUserActiveMapper sysUserActiveMapper;

    /**
     * 查询用户存活状况
     * 
     * @param activeId 用户存活状况主键
     * @return 用户存活状况
     */
    @Override
    public SysUserActive selectSysUserActiveByActiveId(Long activeId)
    {
        return sysUserActiveMapper.selectSysUserActiveByActiveId(activeId);
    }

    /**
     * 查询用户存活状况列表
     * 
     * @param sysUserActive 用户存活状况
     * @return 用户存活状况
     */
    @Override
    public List<SysUserActive> selectSysUserActiveList(SysUserActive sysUserActive)
    {
        return sysUserActiveMapper.selectSysUserActiveList(sysUserActive);
    }

    /**
     * 新增用户存活状况
     * 
     * @param sysUserActive 用户存活状况
     * @return 结果
     */
    @Override
    public int insertSysUserActive(SysUserActive sysUserActive)
    {
        sysUserActive.setCreateTime(DateUtils.getNowDate());
        return sysUserActiveMapper.insertSysUserActive(sysUserActive);
    }

    /**
     * 修改用户存活状况
     * 
     * @param sysUserActive 用户存活状况
     * @return 结果
     */
    @Override
    public int updateSysUserActive(SysUserActive sysUserActive)
    {
        sysUserActive.setUpdateTime(DateUtils.getNowDate());
        return sysUserActiveMapper.updateSysUserActive(sysUserActive);
    }

    /**
     * 批量删除用户存活状况
     * 
     * @param activeIds 需要删除的用户存活状况主键
     * @return 结果
     */
    @Override
    public int deleteSysUserActiveByActiveIds(Long[] activeIds)
    {
        return sysUserActiveMapper.deleteSysUserActiveByActiveIds(activeIds);
    }

    /**
     * 删除用户存活状况信息
     * 
     * @param activeId 用户存活状况主键
     * @return 结果
     */
    @Override
    public int deleteSysUserActiveByActiveId(Long activeId)
    {
        return sysUserActiveMapper.deleteSysUserActiveByActiveId(activeId);
    }

    @Override
    public SysUserActive selectUserActiveByUserId(Long userId) {
        return sysUserActiveMapper.selectUserActiveByUserId(userId);
    }

    @Override
    public SysUserActive checkUserActive(Long userId) {
        return sysUserActiveMapper.checkUserActive(userId);
    }

    @Override
    public void updateActiveUser(LoginUser loginUser) {
        SysUserActive userActive = sysUserActiveMapper.selectUserActiveByUserId(loginUser.getUserId());
        if(userActive == null){
            userActive = new SysUserActive();

            userActive.setUserId(loginUser.getUserId());
            userActive.setLoginDate(loginUser.getUser().getLoginDate());
            userActive.setActiveDate(new Date());

            sysUserActiveMapper.insertSysUserActive(userActive);
        }else{
            userActive.setActiveDate(new Date());
            sysUserActiveMapper.updateSysUserActive(userActive);
        }
    }
}
