package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.PostalListReqVO;
import com.ruoyi.system.domain.vo.PostalListRespVO;
import com.ruoyi.system.domain.vo.RechargeListReqVO;
import com.ruoyi.system.domain.vo.RechargeListRespVO;

/**
 * 用户资金流水Service接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface IUsermoneyService 
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
     * 批量删除用户资金流水
     * 
     * @param ids 需要删除的用户资金流水主键集合
     * @return 结果
     */
    public int deleteUsermoneyByIds(Long[] ids);

    /**
     * 删除用户资金流水信息
     * 
     * @param id 用户资金流水主键
     * @return 结果
     */
    public int deleteUsermoneyById(Long id);

    public List<PostalListRespVO> selectPostalList(PostalListReqVO vo);

    public int agreePostalApply(Usermoney usermoney, Long userId);

    public int refusePostalApply(Usermoney usermoney, Long userId);

    public List<RechargeListRespVO> selectRechargeList(RechargeListReqVO vo);

    public int agreeRechargeApply(Usermoney usermoney, Long userId);

    public int refuseRechargeApply(Usermoney usermoney, Long userId);
}
