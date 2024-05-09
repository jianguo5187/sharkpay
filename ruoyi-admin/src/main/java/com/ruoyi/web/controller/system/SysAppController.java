package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.ISysAppService;
import com.ruoyi.system.service.ISysGameService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.stream.Collectors;

/**
 * APP使用接口
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/app")
public class SysAppController extends BaseController {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private ISysAppService sysAppService;

    /**
     * 修改密码接口
     */
    @PostMapping("/changePwd")
    public AjaxResult changePwd(@RequestBody ChangePwdReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        String userName = loginUser.getUsername();
        String password = loginUser.getPassword();
        if (!SecurityUtils.matchesPassword(vo.getOldPassword(), password))
        {
            return error("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(vo.getNewPassword(), password))
        {
            return error("新密码不能与旧密码相同");
        }
        String newPassword = SecurityUtils.encryptPassword(vo.getNewPassword());
        if (userService.resetUserPwd(userName, newPassword) > 0)
        {
            // 更新缓存用户密码
            loginUser.getUser().setPassword(newPassword);
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getUserInfo")
    public AjaxResult getInfo()
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", userService.selectAppLoginUserInfo(sessionUser.getUserId()));
        return ajax;
    }

    /**
     * 获取游戏列表
     *
     * @return 用户信息
     */
    @GetMapping("gameList")
    public AjaxResult gameList()
    {
        AjaxResult ajax = AjaxResult.success();
        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        ajax.put("gameList", sysGameService.selectSysGameList(sysGame));
        return ajax;
    }


    /**
     * 下注记录列表
     */
    @PostMapping("/gameRecordList")
    public AjaxResult gameRecordList(@RequestBody GameListReqVO vo)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("gameRecordList", sysAppService.gameRecordList(sessionUser.getUserId(),vo));
        return ajax;
    }

    @PostMapping("/gameRecordDetail")
    public AjaxResult gameRecordDetail(@RequestBody GameDetailReqVO vo)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data", sysAppService.gameRecordDetail(sessionUser.getUserId(),vo));
        return ajax;
    }

    @PostMapping("/clearGameInfo")
    public AjaxResult clearGameInfo()
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        sysAppService.clearGameRecode(sessionUser.getUserId());
        return ajax;
    }

    @PostMapping("/gameResultList")
    public AjaxResult gameResultList(@RequestBody GameResultListReqVO vo)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("gameResultList", sysAppService.gameResultList(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 首页轮播图
     *
     * @return 用户信息
     */
    @GetMapping("replaceList")
    public AjaxResult replaceList()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("replaceList", sysAppService.replaceList());
        return ajax;
    }

    /**
     * 获取下属全部用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getAllUserList")
    public AjaxResult getAllUserList()
    {

        SysUser user = SecurityUtils.getLoginUser().getUser();
        SysUser searchUser = new SysUser();
        searchUser.setDeptId(user.getDeptId());
        AjaxResult ajax = AjaxResult.success();
        ajax.put("rows", userService.selectUserList(searchUser).stream()
                .sorted(Comparator.comparing(SysUser::getUserId))
                .filter(r -> r.getUserId().compareTo(user.getUserId()) != 0)
                .collect(Collectors.toList()));
        return ajax;
    }
}
