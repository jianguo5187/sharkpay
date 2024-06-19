package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
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

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private IQRCodeService qrCodeService;

    @Autowired
    private ISysEntryDomainService sysEntryDomainService;

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
        ajax.put("imUrl",configService.selectConfigByKey("sys.im.h5.Site") );
        ajax.put("homeNotice",configService.selectConfigByKey("sys.app.home.notice") );
        ajax.put("minChangeMoney",configService.selectConfigByKey("sys.change.min") );
        ajax.put("minPostalMoney",configService.selectConfigByKey("sys.postal.min") );
        ajax.put("maxPostalCnt",configService.selectConfigByKey("sys.postal.maxCnt") );
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

    /**
     * 获取首页数据
     *
     * @return 用户信息
     */
    @GetMapping("getHomePageData")
    public AjaxResult getHomePageData()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("homePageData",sysAppService.getHomePageDate());
        return ajax;
    }

    /**
     * 获取IM聊天网站URL
     *
     * @return 用户信息
     */
    @GetMapping("getImChatUrl")
    public AjaxResult getImChatUrl()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("imUrl",configService.selectConfigByKey("sys.im.site") );
        return ajax;
    }

    /**
     * 获取LOGO图片地址
     *
     * @return 用户信息
     */
    @GetMapping("getLogoImg")
    public AjaxResult getLogoImg()
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("logoImg",configService.selectConfigByKey("sys.logo.img") );
        ajax.put("urlData",qrCodeService.getShareQRCodeValue(sessionUser.getUserId()));
        ajax.put("shareUrlList",qrCodeService.getEnalbeSysEntryDomainList(sessionUser.getUserId()));

        return ajax;
    }

    @PostMapping("/updateLogoImg")
    public AjaxResult updateLogoImg(@RequestBody UpdateLogoImgReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        sysAppService.updateLogoImg(vo);
        return ajax;
    }

    @PostMapping("/virtuallyRecordList")
    public AjaxResult virtuallyRecordList(@RequestBody VirtuallyRecordListReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        List<VirtuallyGameRecordRespVO> virtuallyRecordList = sysAppService.getVirtuallyRecordList(vo);
        Long lastBetRecordId = 0l;
        for(VirtuallyGameRecordRespVO respVO :virtuallyRecordList){
            if(respVO.getBetId().compareTo(lastBetRecordId) > 0){
                lastBetRecordId = respVO.getBetId();
            }
        }
        ajax.put("virtuallyRecordList",virtuallyRecordList);
        ajax.put("lastBetRecordId",lastBetRecordId);
        return ajax;
    }

    @PostMapping("/cashbackComissionRecord")
    public AjaxResult cashbackComissionRecord(@RequestBody CashbackComissionReportReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        if(StringUtils.isEmpty(vo.getFilterDay())){
            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
            vo.setFilterDay(sd.format(new Date()));
        }

        List<CashbackReportRespVO> cashbackReportList = sysAppService.getCashbackReportList(sessionUser.getUserId(),vo);
        Float totalCashBack = 0f;
        Float totalNoCashBack = 0f;
        for(CashbackReportRespVO cashbackReportRespVO :cashbackReportList){
            totalCashBack += cashbackReportRespVO.getCashBackMoneyTotal();
            totalNoCashBack += cashbackReportRespVO.getNoCashBackMoneyTotal();
        }
        List<CommissionReportRespVO> commissionReportList = sysAppService.getCommissionReportList(sessionUser.getUserId(),vo);
        Float totalCommission = 0f;
        for(CommissionReportRespVO commissionReportRespVO :commissionReportList){
            totalCommission += commissionReportRespVO.getCommissionMoneyTotal();
        }

        ajax.put("cashbackReportList",cashbackReportList);
        ajax.put("commissionReportList",commissionReportList);
        ajax.put("totalCashBack",totalCashBack);
        ajax.put("totalNoCashBack",totalNoCashBack);
        ajax.put("totalCommission",totalCommission);

        return ajax;
    }

    /**
     * 获取客服聊天图片地址
     *
     * @return 用户信息
     */
    @GetMapping("getChatImg")
    public AjaxResult getChatImg()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("wechatImg",configService.selectConfigByKey("sys.wechat.img") );
        ajax.put("qqChatImg",configService.selectConfigByKey("sys.qqchat.img") );

        return ajax;
    }

    @PostMapping("/updateChatImg")
    public AjaxResult updateChatImg(@RequestBody UpdateLogoImgReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        sysAppService.updateChatImg(vo);
        return ajax;
    }
}
