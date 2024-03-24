package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AdminwinMapper;
import com.ruoyi.system.domain.Adminwin;
import com.ruoyi.system.service.IAdminwinService;

/**
 * 管理员盈亏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@Service
public class AdminwinServiceImpl implements IAdminwinService 
{
    @Autowired
    private AdminwinMapper adminwinMapper;

    /**
     * 查询管理员盈亏
     * 
     * @param id 管理员盈亏主键
     * @return 管理员盈亏
     */
    @Override
    public Adminwin selectAdminwinById(Long id)
    {
        return adminwinMapper.selectAdminwinById(id);
    }

    /**
     * 查询管理员盈亏列表
     * 
     * @param adminwin 管理员盈亏
     * @return 管理员盈亏
     */
    @Override
    public List<Adminwin> selectAdminwinList(Adminwin adminwin)
    {
        return adminwinMapper.selectAdminwinList(adminwin);
    }

    /**
     * 新增管理员盈亏
     * 
     * @param adminwin 管理员盈亏
     * @return 结果
     */
    @Override
    public int insertAdminwin(Adminwin adminwin)
    {
        adminwin.setCreateTime(DateUtils.getNowDate());
        return adminwinMapper.insertAdminwin(adminwin);
    }

    /**
     * 修改管理员盈亏
     * 
     * @param adminwin 管理员盈亏
     * @return 结果
     */
    @Override
    public int updateAdminwin(Adminwin adminwin)
    {
        adminwin.setUpdateTime(DateUtils.getNowDate());
        return adminwinMapper.updateAdminwin(adminwin);
    }

    /**
     * 批量删除管理员盈亏
     * 
     * @param ids 需要删除的管理员盈亏主键
     * @return 结果
     */
    @Override
    public int deleteAdminwinByIds(Long[] ids)
    {
        return adminwinMapper.deleteAdminwinByIds(ids);
    }

    /**
     * 删除管理员盈亏信息
     * 
     * @param id 管理员盈亏主键
     * @return 结果
     */
    @Override
    public int deleteAdminwinById(Long id)
    {
        return adminwinMapper.deleteAdminwinById(id);
    }

    @Override
    public Adminwin selectTodayAdminwin(Long gameId) {
        return adminwinMapper.selectTodayAdminwin(gameId);
    }
}
