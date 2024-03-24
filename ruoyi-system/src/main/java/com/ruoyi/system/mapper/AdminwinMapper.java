package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Adminwin;

/**
 * 管理员盈亏Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface AdminwinMapper 
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
     * 删除管理员盈亏
     * 
     * @param id 管理员盈亏主键
     * @return 结果
     */
    public int deleteAdminwinById(Long id);

    /**
     * 批量删除管理员盈亏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdminwinByIds(Long[] ids);

    public Adminwin selectTodayAdminwin(Long gameId);
}
