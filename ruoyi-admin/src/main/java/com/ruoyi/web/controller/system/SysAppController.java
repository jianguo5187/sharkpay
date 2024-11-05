package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.SysLandingDomain;
import com.ruoyi.system.domain.SysRequestInfo;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Collections;
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

    @Autowired
    private ISysLandingDomainService sysLandingDomainService;

    @Autowired
    private ISysRequestInfoService sysRequestInfoService;

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

//        SysLandingDomain landingDomainSearch = new SysLandingDomain();
//        landingDomainSearch.setStatus("0");
//        landingDomainSearch.setDelFlag("0");
//        List<SysLandingDomain> landingDomainList = sysLandingDomainService.selectSysLandingDomainList(landingDomainSearch);
        String landingDomainUrl = configService.selectConfigByKey("sys.im.appUrl");
//        if(landingDomainList.size() > 0) {
//            landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl()+":82";
//        }
        ajax.put("imUrl",landingDomainUrl );
        ajax.put("appHomeAnnouncement",configService.selectConfigByKey("sys.app.home.appHomeAnnouncement") );
        ajax.put("homeNotice",configService.selectConfigByKey("sys.app.home.notice") );
        ajax.put("webName",configService.selectConfigByKey("sys.web.name") );
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
     * 获取用户余额
     *
     * @return 用户信息
     */
    @GetMapping("getUserTotalAmount")
    public AjaxResult getUserTotalAmount()
    {
        AjaxResult ajax = AjaxResult.success();
        Float userAmount = userService.getUserTotalAmount();
        ajax.put("userTotalAmount",userAmount==null?0f:userAmount);
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

//        SysLandingDomain landingDomainSearch = new SysLandingDomain();
//        landingDomainSearch.setStatus("0");
//        landingDomainSearch.setDelFlag("0");
//        List<SysLandingDomain> landingDomainList = sysLandingDomainService.selectSysLandingDomainList(landingDomainSearch);
        String landingDomainUrl = configService.selectConfigByKey("sys.im.kefuUrl");
//        if(landingDomainList.size() > 0) {
//            landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl()+":81";
//        }

        ajax.put("imUrl",landingDomainUrl );
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
        Float totalNoCommission = 0f;
        for(CommissionReportRespVO commissionReportRespVO :commissionReportList){
            totalCommission += commissionReportRespVO.getCommissionMoneyTotal();
            totalNoCommission += commissionReportRespVO.getNoCommissionMoneyTotal();
        }

        ajax.put("cashbackReportList",cashbackReportList);
        ajax.put("commissionReportList",commissionReportList);
        ajax.put("totalCashBack",totalCashBack);
        ajax.put("totalNoCashBack",totalNoCashBack);
        ajax.put("totalCommission",totalCommission);
        ajax.put("totalNoCommission",totalNoCommission);

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



    /**
     * 获取站点设置
     *
     * @return 用户信息
     */
    @GetMapping("getSiteSetting")
    public AjaxResult getSiteSetting()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("siteOpenFlg",configService.selectConfigByKey("sys.site.openFlg") );
        ajax.put("minChargeMoney",configService.selectConfigByKey("sys.change.min") );
        ajax.put("minPostalMoney",configService.selectConfigByKey("sys.postal.min") );
        ajax.put("postalMaxCnt",configService.selectConfigByKey("sys.postal.maxCnt") );
        ajax.put("appHomeAnnouncement",configService.selectConfigByKey("sys.app.home.appHomeAnnouncement") );
        ajax.put("appHomeNotice",configService.selectConfigByKey("sys.app.home.notice") );
        ajax.put("openRecordUrl",configService.selectConfigByKey("sys.opengame.url") );
        ajax.put("webType",configService.selectConfigByKey("sys.web.type") );
        ajax.put("webName",configService.selectConfigByKey("sys.web.name") );
        ajax.put("wechatAppId",configService.selectConfigByKey("sys.wechat.appId") );
        ajax.put("wechatAppSecret",configService.selectConfigByKey("sys.wechat.appSecret") );
        ajax.put("wechatAuthUrl",configService.selectConfigByKey("sys.wechat.authUrl") );
        ajax.put("kefuImUrl",configService.selectConfigByKey("sys.im.kefuUrl") );
        ajax.put("appImUrl",configService.selectConfigByKey("sys.im.appUrl") );
        ajax.put("qrServerUrl",configService.selectConfigByKey("sys.web.qrServer") );
        ajax.put("systemGameWinRate",configService.selectConfigByKey("sys.game.winRate") );

        ajax.put("aliCloudApiCode",configService.selectConfigByKey("sys.ali.cloudApiCode") );
        ajax.put("refuseProvince",configService.selectConfigByKey("sys.refuse.province") );
        ajax.put("refuseCity",configService.selectConfigByKey("sys.refuse.city") );
        ajax.put("refuseIsp",configService.selectConfigByKey("sys.refuse.isp") );


        ajax.put("wxAutoCheckApiCode",configService.selectConfigByKey("sys.wxAutoCheck.apiCode") );
        return ajax;
    }

    @PostMapping("/updateSiteSetting")
    public AjaxResult updateSiteSetting(@RequestBody UpdateSiteSettingReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        sysAppService.updateSiteSetting(vo);
        return ajax;
    }

    /**
     * 获取有效的落地域名站点设置
     *
     * @return 用户信息
     */
    @GetMapping("getEffectivedDomainUrl")
    public AjaxResult getEffectivedDomainUrl()
    {
        AjaxResult ajax = AjaxResult.success();

//        SysLandingDomain landingDomainSearch = new SysLandingDomain();
//        landingDomainSearch.setStatus("0");
//        landingDomainSearch.setDelFlag("0");
//        List<SysLandingDomain> landingDomainList = sysLandingDomainService.selectSysLandingDomainList(landingDomainSearch);
//        String landingDomainUrl = "";
//        if(landingDomainList.size() > 0) {
//            landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl();
//        }
        ajax.put("domainUrl",sysLandingDomainService.getValidLandingDomainUrl() );

        return ajax;
    }

    @PostMapping("/insertRequestInfo")
    public AjaxResult insertRequestInfo(@RequestBody InsertRequestInfoReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        SysRequestInfo sysRequestInfo = new SysRequestInfo();
        sysRequestInfo.setRequestInfoIp(vo.getRequestInfoIp());
        sysRequestInfo.setRequestInfoHeadValue(vo.getRequestInfoHeadValue());
        sysRequestInfoService.insertSysRequestInfo(sysRequestInfo);
        ajax.put("insertData",sysRequestInfo);
        return ajax;
    }

    @GetMapping("getAllRequestInfoList")
    public AjaxResult getAllRequestInfoList()
    {
        AjaxResult ajax = AjaxResult.success();
        SysRequestInfo sysRequestInfo = new SysRequestInfo();
        ajax.put("data",sysRequestInfoService.selectSysRequestInfoList(sysRequestInfo));
        return ajax;
    }


    @GetMapping("checkIpAddressValid")
    public AjaxResult checkIpAddressValid(HttpServletRequest request, HttpServletResponse response)
    {
        StringBuffer sb = new StringBuffer();
        for (String headerName : Collections.list(request.getHeaderNames())) {
            sb.append(headerName + ": " + request.getHeader(headerName) + ";");
//            System.out.println(headerName + ": " + request.getHeader(headerName));
        }
        System.out.println(new Date() + " 请求头信息: 【" + sb.toString() + "】");

        CheckIpAddressValidReqVO vo = new CheckIpAddressValidReqVO();
        String ip = IpUtils.getIpAddr(request);
//        String ip = getIpAddr(request);
        System.out.println(new Date() + " IpAddress : " + ip);

        if(StringUtils.isEmpty(ip) || StringUtils.equals(ip,"127.0.0.1")){
            AjaxResult ajax = AjaxResult.badMethod();
            ajax.put("data","0");
            response.setStatus(401);
            System.out.println("checkResult : 0");
            return ajax;
        }

        vo.setIpAddress(ip);
        String result = sysAppService.checkIpAddressValid(vo);
        System.out.println(new Date() + " checkResult : " + result);
        if(StringUtils.equals("0",result)){

            AjaxResult ajax = AjaxResult.badMethod();
            ajax.put("data",result);
            response.setStatus(401);
            return ajax;
        }else{
            AjaxResult ajax = AjaxResult.success();
            ajax.put("data",result);
            return ajax;
        }
    }

    @GetMapping("checkIpAddressApi")
    public AjaxResult checkIpAddressApi(@RequestParam("ipAddress")  String ipAddress)
    {
        if(StringUtils.isEmpty(ipAddress)){
            AjaxResult ajax = AjaxResult.badMethod();
            ajax.put("data","0");
            return ajax;
        }

        CheckIpAddressValidReqVO vo = new CheckIpAddressValidReqVO();
        vo.setIpAddress(ipAddress);
        String result = sysAppService.checkIpAddressValid(vo);
        System.out.println(new Date() + " checkResult : " + result);
        if(StringUtils.equals("0",result)){

            AjaxResult ajax = AjaxResult.badMethod();
            ajax.put("data",result);
            return ajax;
        }else{
            AjaxResult ajax = AjaxResult.success();
            ajax.put("data",result);
            return ajax;
        }
    }

    /**
     * 获取游戏投注设置
     *
     * @return 用户信息
     */
    @GetMapping("getGameLimitSetting")
    public AjaxResult getGameLimitSetting()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("gameLimitSetting",sysAppService.getGameLimitSetting());
        return ajax;
    }

    @PostMapping("/updatGameLimitSetting")
    public AjaxResult updatGameLimitSetting(@RequestBody GameLimitSettingUpdateReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        sysAppService.updatGameLimitSetting(vo);
        return ajax;
    }
}
