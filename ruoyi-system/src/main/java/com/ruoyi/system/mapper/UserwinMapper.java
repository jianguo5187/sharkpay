package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Userwin;
import org.apache.ibatis.annotations.Param;

/**
 * 用户盈亏Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface UserwinMapper 
{
    /**
     * 查询用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 用户盈亏
     */
    public Userwin selectUserwinById(Long id);

    /**
     * 查询用户盈亏列表
     * 
     * @param userwin 用户盈亏
     * @return 用户盈亏集合
     */
    public List<Userwin> selectUserwinList(Userwin userwin);

    /**
     * 新增用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    public int insertUserwin(Userwin userwin);

    /**
     * 修改用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    public int updateUserwin(Userwin userwin);

    /**
     * 删除用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 结果
     */
    public int deleteUserwinById(Long id);

    /**
     * 批量删除用户盈亏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserwinByIds(Long[] ids);

    public Userwin selectTodayUserwin(@Param("gameId")Long gameId, @Param("userId")Long userId);
}