package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Set;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.system.service.ISysMenuService;
import org.springframework.web.servlet.ModelAndView;

/**
 * 微信登录验证
 * 
 * @author ruoyi
 */
@RestController
public class SysWxLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysConfigService configService;

    @GetMapping("/getWxLoginCode")
    public ModelAndView getWxLoginCode(@RequestParam(name = "parentUserId", required = false) Long parentUserId) {
        String siteDisabledFlag = configService.selectConfigByKey("sys.site.openFlg");
        if(!StringUtils.equals(siteDisabledFlag,"true")){
            // 如果没有提供rewrite参数，或者参数为空，可以重定向到默认页面
            return new ModelAndView("redirect:/defaultPage");
//            return ajax.error("网站关闭中，无法访问");
        }
        // 跳转授权页
        String urlRedir = loginService.getUrlRedir(parentUserId);
        return new ModelAndView("redirect:" + urlRedir);
    }

    @GetMapping("/wxRedirect")
    public ModelAndView wxRedirect(@RequestParam("code") String code,@RequestParam(name = "parentUserId", required = false) Long parentUserId) {
        String siteDisabledFlag = configService.selectConfigByKey("sys.site.openFlg");
        if(!StringUtils.equals(siteDisabledFlag,"true")){
            System.out.println("siteDisabledFlag : " + siteDisabledFlag);
            // 如果没有提供rewrite参数，或者参数为空，可以重定向到默认页面
            return new ModelAndView("redirect:/defaultPage");
        }
        // 生成令牌
        String token = loginService.miniProgramLogin(code,parentUserId);
        // 跳转授权页
        String appUrlRedir = loginService.getAppUrlRedir(token,parentUserId);
        return new ModelAndView("redirect:" + appUrlRedir);
    }
}
