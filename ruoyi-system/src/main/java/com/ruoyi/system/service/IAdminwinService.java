package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Adminwin;

/**
 * 管理员盈亏Service接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface IAdminwinService 
{
    /**
     * 查询管理员盈亏
     * 
     * @param id 管理员盈亏主键
     * @return 管理员盈亏
     */
    public Adminwin selectAdminwinById(Long id);

    /**
     * 查询管理员盈亏列表
     * 
     * @param adminwin 管理员盈亏
     * @return 管理员盈亏集合
     */
    public List<Adminwin> selectAdminwinList(Adminwin adminwin);

    /**
     * 新增管理员盈亏
     * 
     * @param adminwin 管理员盈亏
     * @return 结果
     */
    public int insertAdminwin(Adminwin adminwin);

    /**
     * 修改管理员盈亏
     * 
     * @param adminwin 管理员盈亏
     * @return 结果
     */
    public int updateAdminwin(Adminwin adminwin);

    /**
     * 批量删除管理员盈亏
     * 
     * @param ids 需要删除的管理员盈亏主键集合
     * @return 结果
     */
    public int deleteAdminwinByIds(Long[] ids);

    /**
     * 删除管理员盈亏信息
     * 
     * @param id 管理员盈亏主键
     * @return 结果
     */
    public int deleteAdminwinById(Long id);


    public Adminwin selectTodayAdminwin(Long gameId);
}
