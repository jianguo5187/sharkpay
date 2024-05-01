package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.FiveBallsOddsReqVO;
import com.ruoyi.system.domain.vo.FyListReqVO;
import com.ruoyi.system.service.IMyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 我的Controller
 *
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/my")
public class MyController extends BaseController {

    @Autowired
    private IMyService myService;

    /**
     * 获取今日盈亏数据接口
     */
    @GetMapping("/todayYk")
    public AjaxResult todayYk(){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",myService.getTodayYkInfo(sessionUser.getUserId()));
        return ajax;
    }

    /**
     * 获取昨天盈亏数据接口
     */
    @GetMapping("/yesdayYk")
    public AjaxResult yesdayYk(){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",myService.getYesdayYkInfo(sessionUser.getUserId()));
        return ajax;
    }

    /**
     * 获取佣金列表数据接口
     */
    @PostMapping("/fyList")
    public AjaxResult fyList(@RequestBody FyListReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("fyList",myService.getFyList(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取返水列表数据接口
     */
    @PostMapping("/fxList")
    public AjaxResult fxList(@RequestBody FyListReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("fxList",myService.getFxList(sessionUser.getUserId(),vo));
        return ajax;
    }

    @PostMapping("/usermoneyList")
    public AjaxResult usermoneyList(@RequestBody ChangeListReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("usermoneyList",myService.getUserMoneylList(sessionUser.getUserId(),vo));
        return ajax;
    }

    @PostMapping("/clearUsermoneyInfo")
    public AjaxResult clearUsermoneyInfo(){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        myService.clearUsermoneyInfo(sessionUser.getUserId());
        return ajax;
    }
}
