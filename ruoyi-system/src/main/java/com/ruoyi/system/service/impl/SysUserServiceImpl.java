package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.Validator;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.AgentUserListRespVo;
import com.ruoyi.system.domain.vo.LoginUserInfoRespVO;
import com.ruoyi.system.domain.vo.ParentUserListRespVO;
import com.ruoyi.system.domain.vo.UserTotalRankListRespVO;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.ISysAdminActionLogService;
import com.ruoyi.system.service.IUserwinService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 用户 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SysUserServiceImpl implements ISysUserService
{
    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    protected Validator validator;

    @Autowired
    private UserwinMapper userwinMapper;

    @Autowired
    private ImUserMapper imUserMapper;

    @Autowired
    private ImFriendMapper imFriendMapper;

    @Autowired
    private ISysAdminActionLogService sysAdminActionLogService;

    /**
     * 根据条件分页查询用户列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUser> selectUserList(SysUser user)
    {
        return userMapper.selectUserList(user);
    }

    /**
     * 根据条件分页查询已分配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUser> selectAllocatedList(SysUser user)
    {
        return userMapper.selectAllocatedList(user);
    }

    /**
     * 根据条件分页查询未分配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUser> selectUnallocatedList(SysUser user)
    {
        return userMapper.selectUnallocatedList(user);
    }

    /**
     * 通过用户名查询用户
     * 
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public SysUser selectUserByUserName(String userName)
    {
        return userMapper.selectUserByUserName(userName);
    }

    /**
     * 通过用户ID查询用户
     * 
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public SysUser selectUserById(Long userId)
    {
        return userMapper.selectUserById(userId);
    }

    /**
     * 查询用户所属角色组
     * 
     * @param userName 用户名
     * @return 结果
     */
    @Override
    public String selectUserRoleGroup(String userName)
    {
        List<SysRole> list = roleMapper.selectRolesByUserName(userName);
        if (CollectionUtils.isEmpty(list))
        {
            return StringUtils.EMPTY;
        }
        return list.stream().map(SysRole::getRoleName).collect(Collectors.joining(","));
    }

    /**
     * 查询用户所属岗位组
     * 
     * @param userName 用户名
     * @return 结果
     */
    @Override
    public String selectUserPostGroup(String userName)
    {
        List<SysPost> list = postMapper.selectPostsByUserName(userName);
        if (CollectionUtils.isEmpty(list))
        {
            return StringUtils.EMPTY;
        }
        return list.stream().map(SysPost::getPostName).collect(Collectors.joining(","));
    }

    /**
     * 校验用户名称是否唯一
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean checkUserNameUnique(SysUser user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkUserNameUnique(user.getUserName());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验手机号码是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public boolean checkPhoneUnique(SysUser user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkPhoneUnique(user.getPhonenumber());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验email是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public boolean checkEmailUnique(SysUser user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkEmailUnique(user.getEmail());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验身份证号码是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public boolean checkIdcardUnique(SysUser user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkIdcardUnique(user.getIdcardNo());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


    /**
     * 根据邀请码查询用户
     *
     * @param user 用户信息
     * @return 结果
     */
    public SysUser selectUserByInviteCode(SysUser user)
    {
        SysUser info = userMapper.selectUserByInviteCode(user.getInviteCode());
        return info;
    }

    /**
     * 校验用户是否允许操作
     * 
     * @param user 用户信息
     */
    @Override
    public void checkUserAllowed(SysUser user)
    {
        if (StringUtils.isNotNull(user.getUserId()) && user.isAdmin())
        {
            throw new ServiceException("不允许操作超级管理员用户");
        }
    }

    /**
     * 校验用户是否有数据权限
     * 
     * @param userId 用户id
     */
    @Override
    public void checkUserDataScope(Long userId)
    {
        if (!SysUser.isAdmin(SecurityUtils.getUserId()))
        {
            SysUser user = new SysUser();
            user.setUserId(userId);
            List<SysUser> users = SpringUtils.getAopProxy(this).selectUserList(user);
            if (StringUtils.isEmpty(users))
            {
                throw new ServiceException("没有权限访问用户数据！");
            }
        }
    }

    /**
     * 新增保存用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertUser(SysUser user)
    {
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户岗位关联
        insertUserPost(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows;
    }

    /**
     * 注册用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean registerUser(SysUser user)
    {
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户岗位关联
        insertUserPost(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows > 0;
    }

    /**
     * 修改保存用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateUser(SysUser user)
    {
        Long userId = user.getUserId();
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 新增用户与角色管理
        insertUserRole(user);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPostByUserId(userId);
        // 新增用户与岗位管理
        insertUserPost(user);
        return userMapper.updateUser(user);
    }

    /**
     * 用户授权角色
     * 
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    @Override
    @Transactional
    public void insertUserAuth(Long userId, Long[] roleIds)
    {
        userRoleMapper.deleteUserRoleByUserId(userId);
        insertUserRole(userId, roleIds);
    }

    /**
     * 修改用户状态
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUserStatus(SysUser user)
    {
        return userMapper.updateUserStatus(user);
    }

    /**
     * 修改用户基本信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUserProfile(SysUser user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 修改用户头像
     * 
     * @param userName 用户名
     * @param avatar 头像地址
     * @return 结果
     */
    @Override
    public boolean updateUserAvatar(String userName, String avatar)
    {
        return userMapper.updateUserAvatar(userName, avatar) > 0;
    }

    /**
     * 重置用户密码
     * 
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int resetPwd(SysUser user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 重置用户密码
     * 
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    @Override
    public int resetUserPwd(String userName, String password)
    {
        return userMapper.resetUserPwd(userName, password);
    }

    /**
     * 重置用户支付密码
     *
     * @param userId 用户ID
     * @param payPassword 支付密码
     * @return 结果
     */
    public int resetUserPayPwd(Long userId, String payPassword)
    {
        return userMapper.resetUserPayPwd(userId, payPassword);
    }

    /**
     * 新增用户角色信息
     * 
     * @param user 用户对象
     */
    public void insertUserRole(SysUser user)
    {
        this.insertUserRole(user.getUserId(), user.getRoleIds());
    }

    /**
     * 新增用户岗位信息
     * 
     * @param user 用户对象
     */
    public void insertUserPost(SysUser user)
    {
        Long[] posts = user.getPostIds();
        if (StringUtils.isNotEmpty(posts))
        {
            // 新增用户与岗位管理
            List<SysUserPost> list = new ArrayList<SysUserPost>(posts.length);
            for (Long postId : posts)
            {
                SysUserPost up = new SysUserPost();
                up.setUserId(user.getUserId());
                up.setPostId(postId);
                list.add(up);
            }
            userPostMapper.batchUserPost(list);
        }
    }

    /**
     * 新增用户角色信息
     * 
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    public void insertUserRole(Long userId, Long[] roleIds)
    {
        if (StringUtils.isNotEmpty(roleIds))
        {
            // 新增用户与角色管理
            List<SysUserRole> list = new ArrayList<SysUserRole>(roleIds.length);
            for (Long roleId : roleIds)
            {
                SysUserRole ur = new SysUserRole();
                ur.setUserId(userId);
                ur.setRoleId(roleId);
                list.add(ur);
            }
            userRoleMapper.batchUserRole(list);
        }
    }

    /**
     * 通过用户ID删除用户
     * 
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteUserById(Long userId)
    {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 删除用户与岗位表
        userPostMapper.deleteUserPostByUserId(userId);
        return userMapper.deleteUserById(userId);
    }

    @Override
    @Transactional
    public void enableUserByIds(Long[] userIds)
    {
        for (Long userId : userIds)
        {
            updateUserStatus(new SysUser(userId,"0"));
        }
    }

    @Override
    @Transactional
    public void disableUserByIds(Long[] userIds)
    {
        for (Long userId : userIds)
        {
            updateUserStatus(new SysUser(userId,"1"));
        }
    }

    /**
     * 批量删除用户信息
     * 
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteUserByIds(Long[] userIds)
    {
        for (Long userId : userIds)
        {
            checkUserAllowed(new SysUser(userId));
            checkUserDataScope(userId);
        }
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPost(userIds);
        return userMapper.deleteUserByIds(userIds);
    }

    /**
     * 导入用户数据
     * 
     * @param userList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName)
    {
        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        String password = configService.selectConfigByKey("sys.user.initPassword");
        for (SysUser user : userList)
        {
            try
            {
                // 验证是否存在这个用户
                SysUser u = userMapper.selectUserByUserName(user.getUserName());
                if (StringUtils.isNull(u))
                {
                    BeanValidators.validateWithException(validator, user);
                    user.setPassword(SecurityUtils.encryptPassword(password));
                    user.setCreateBy(operName);
                    userMapper.insertUser(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    BeanValidators.validateWithException(validator, user);
                    checkUserAllowed(u);
                    checkUserDataScope(u.getUserId());
                    user.setUserId(u.getUserId());
                    user.setUpdateBy(operName);
                    userMapper.updateUser(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    @Override
    public int updateUserAmount(SysUser user) {
        return userMapper.updateUserAmount(user);
    }

    @Override
    public List<SysUser> selectChildUserList(Long parentUserId) {
        return userMapper.selectChildUserList(parentUserId);
    }

    @Override
    public LoginUserInfoRespVO selectAppLoginUserInfo(Long userId) {
        SysUser user = selectUserById(userId);
        LoginUserInfoRespVO userInfo = new LoginUserInfoRespVO();
        BeanUtils.copyProperties(user,userInfo);

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(new Date());
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        String yesday = sd.format(cal.getTime());

        Float todayWinMoney = userwinMapper.userRankEveryday(userId,today);
        Float yesdayWinMoney = userwinMapper.userRankEveryday(userId,yesday);

        userInfo.setTodayWinMoney(todayWinMoney==null?0f:todayWinMoney);
        userInfo.setYesdayWinMoney(yesdayWinMoney==null?0f:yesdayWinMoney);

        return userInfo;
    }

    @Override
    public SysUser setUserGameWin(SysUser user) {


        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(new Date());
        Userwin searchUserwin = new Userwin();
        searchUserwin.setFilterDay(today);
        searchUserwin.setUserId(user.getUserId());

        Float todayWinMoney = 0f;
        List<UserTotalRankListRespVO> totalUserWinList = userwinService.selectUserTotalRankList(searchUserwin);
        for(UserTotalRankListRespVO userTotalRankListRespVO : totalUserWinList){
            todayWinMoney = todayWinMoney + userTotalRankListRespVO.getTotalWinMoney();
        }
        user.setTodayWinMoney(todayWinMoney);

//        user.setTotalWinMoney(0f);
//        user.setTotalBetMoney(0f);
//        user.setJnd20(0f);
//        user.setJnd28(0f);
//        user.setJnd32(0f);
//        user.setJspc28(0f);
//        user.setBt28(0f);
//        user.setMssc(0f);
//        user.setAzxy52(0f);
//        user.setAzxy5(0f);
//        user.setAzxy10(0f);
//        user.setAzxy102(0f);
//        user.setXyft(0f);
//        user.setJssc(0f);
//        user.setJsft(0f);
//        user.setJssc(0f);
//        user.setJssc2(0f);
//        user.setXyft2(0f);
//
//        Userwin searchUserWin = new Userwin();
//        searchUserWin.setUserId(user.getUserId());
//        List<UserTotalRankListRespVO> userTotalRankList = userwinService.selectUserTotalRankList(searchUserWin);
//        for(UserTotalRankListRespVO userGameWinRankListRespVO: userTotalRankList){
//
//            user.setTotalWinMoney(user.getTotalWinMoney() +  userGameWinRankListRespVO.getTotalWinMoney());
//            user.setTotalBetMoney(user.getTotalBetMoney() +  userGameWinRankListRespVO.getTotalBetMoney());
//            user.setJnd20(user.getJnd20() +  userGameWinRankListRespVO.getJnd20());
//            user.setJnd28(user.getJnd28() +  userGameWinRankListRespVO.getJnd28());
//            user.setJnd32(user.getJnd32() +  userGameWinRankListRespVO.getJnd32());
//            user.setJspc28(user.getJspc28() +  userGameWinRankListRespVO.getJspc28());
//            user.setBt28(user.getBt28() +  userGameWinRankListRespVO.getBt28());
//            user.setMssc(user.getMssc() +  userGameWinRankListRespVO.getMssc());
//            user.setAzxy52(user.getAzxy52() +  userGameWinRankListRespVO.getAzxy52());
//            user.setAzxy5(user.getAzxy5() +  userGameWinRankListRespVO.getAzxy5());
//            user.setAzxy10(user.getAzxy10() +  userGameWinRankListRespVO.getAzxy10());
//            user.setAzxy102(user.getAzxy102() +  userGameWinRankListRespVO.getAzxy102());
//            user.setXyft(user.getXyft() +  userGameWinRankListRespVO.getXyft());
//            user.setJssc(user.getJssc() +  userGameWinRankListRespVO.getJssc());
//            user.setJsft(user.getJsft() +  userGameWinRankListRespVO.getJsft());
//            user.setJssc(user.getJssc() +  userGameWinRankListRespVO.getJssc());
//            user.setJssc2(user.getJssc2() +  userGameWinRankListRespVO.getJssc2());
//            user.setXyft2(user.getXyft2() +  userGameWinRankListRespVO.getXyft2());
//        }
        return user;
    }

    @Override
    public List<ParentUserListRespVO> selectParentUserList(SysUser user) {
        return userMapper.selectParentUserList(user);
    }

    @Override
    public List<AgentUserListRespVo> selectAgentUserList(SysUser user) {
        return userMapper.selectAgentUserList(user);
    }

    @Override
    public SysUser getUserByOpenId(String openId) {
        return userMapper.selectUserByOpenId(openId);
    }

    @Override
    public int updateUserRemarkName(Long userId, String remarkName) {
        int row = userMapper.updateUserRemarkName(userId,remarkName);
        ImUser imUser = imUserMapper.selectImUserByThirdUserId("sharkUser" + userId);
        if(imUser != null){
            imUser.setRemarkName(remarkName);
            imUserMapper.updateImUser(imUser);

            ImFriend imFriend = new ImFriend();
            imFriend.setUserId(1l);
            imFriend.setFriendId(imUser.getId());
            imFriend.setRemarkName(remarkName);
            imFriendMapper.updateImFriendRemark(imFriend);
        }
        return row;
    }

    @Override
    public int mergeUser(SysUser user) {
        SysUser mainUser = selectUserById(user.getUserId());
        SysUser mergeUser = selectUserById(user.getMergeUserId());

        // 余额合并
        mainUser.setAmount(mainUser.getAmount() + mergeUser.getAmount());
        // 积分合并
        mainUser.setScore(mainUser.getScore() + mergeUser.getScore());
        // 主账号OpenId为空且合并账号OpenId不为空时，把合并账号的OpenId合并过来
        if(StringUtils.isEmpty(mainUser.getOpenId()) && StringUtils.isNotEmpty(mergeUser.getOpenId())){
            mainUser.setOpenId(mergeUser.getOpenId());
        }

        // 合并下级
        userMapper.mergeChildUser(user.getUserId(), user.getMergeUserId());

        //删除被合并账号
        userMapper.deleteUserById(user.getMergeUserId());

        // 更新主账号
        return userMapper.updateUser(mainUser);
    }

    @Override
    public Float getUserTotalAmount() {
        return userMapper.getUserTotalAmount();
    }

    @Override
    public int addChildAdminUser(SysUser user) {
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户岗位关联
        insertUserPost(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows;
    }

    @Override
    public int updateUserParent(SysUser actionUser,Long userId, Long parentUserId) {
        if(parentUserId == null || parentUserId == 1 || StringUtils.isNull(selectUserById(parentUserId))){
            throw new ServiceException("输入的上级不存在！");
        }
        SysUser user = selectUserById(userId);

        // 判断是否是管理员登录，如果是记录登录信息
        boolean isAdminFlag = false;
        List<SysRole> roles = actionUser.getRoles();
        for(SysRole role : roles){
            if(role.getRoleId() == 2 || role.getRoleId() == 4){
                isAdminFlag = true;
                break;
            }
        }
        if(isAdminFlag){
            SysAdminActionLog sysAdminActionLog = new SysAdminActionLog();
            sysAdminActionLog.setType("3");//修改上级
            sysAdminActionLog.setAdminUserId(actionUser.getUserId());
            sysAdminActionLog.setAdminUserName(actionUser.getNickName());
            sysAdminActionLog.setActionLoginIp(IpUtils.getIpAddr());
            sysAdminActionLog.setActionTargetIp(userId.toString());
            sysAdminActionLog.setCreateBy(actionUser.getNickName());
            sysAdminActionLog.setRemark("[" + actionUser.getNickName() + "],修改用户id[" + userId + "],上级id["+ user.getParentUserId() + "] ->[" + parentUserId + "],时间：" + DateUtils.getTime());
            sysAdminActionLogService.insertSysAdminActionLog(sysAdminActionLog);
        }

        return userMapper.updateUserParent(userId,parentUserId);
    }
}
