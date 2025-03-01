package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ImUser;
import org.apache.ibatis.annotations.Param;

/**
 * 用户Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
public interface ImUserMapper 
{
    /**
     * 查询用户
     * 
     * @param id 用户主键
     * @return 用户
     */
    public ImUser selectImUserById(Long id);

    /**
     * 查询用户列表
     * 
     * @param imUser 用户
     * @return 用户集合
     */
    public List<ImUser> selectImUserList(ImUser imUser);

    /**
     * 新增用户
     * 
     * @param imUser 用户
     * @return 结果
     */
    public int insertImUser(ImUser imUser);

    /**
     * 修改用户
     * 
     * @param imUser 用户
     * @return 结果
     */
    public int updateImUser(ImUser imUser);

    /**
     * 删除用户
     * 
     * @param id 用户主键
     * @return 结果
     */
    public int deleteImUserById(Long id);

    /**
     * 批量删除用户
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImUserByIds(Long[] ids);

    public ImUser selectImUserByThirdUserId(@Param("thirdUserId")String thirdUserId);
}
