package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.IGameFiveBallsService;
import com.ruoyi.system.service.IGameTenBallsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * APP使用接口
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/fiveballs")
public class GameFiveBallsController  extends BaseController {


    @Autowired
    private IGameFiveBallsService gameFiveBallsService;

    /**
     * 获取5球赔率表
     */
    @PostMapping("/odds")
    public AjaxResult odds(@RequestBody FiveBallsOddsReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("oddList",gameFiveBallsService.getOddsInfo(vo));
        return ajax;
    }

    /**
     * 获取5球开奖结果和账户余额
     */
    @PostMapping("/kjRecordMoney")
    public AjaxResult kjRecordMoney(@RequestBody FiveBallsOddsReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",gameFiveBallsService.kjRecordMoney(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取5球开奖期数以及开奖/截止时间
     */
    @PostMapping("/timeDate")
    public AjaxResult timeDate(@RequestBody FiveBallsOddsReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",gameFiveBallsService.timeDate(vo));
        return ajax;
    }

    /**
     * 获取5球虚拟用户下注数据
     */
    @PostMapping("/virtuallyGameRecord")
    public AjaxResult virtuallyGameRecord(@RequestBody VirtuallyGameRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("virtuallyRecordList",gameFiveBallsService.virtuallyGameRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取5球投注记录
     */
    @PostMapping("/betRecordList")
    public AjaxResult betRecordList(@RequestBody FiveBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("betRecordList",gameFiveBallsService.betRecordList(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取5球投注记录汇总
     */
    @PostMapping("/periodsAllBetRecordList")
    public AjaxResult periodsAllBetRecordList(@RequestBody FiveBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        if(vo.getPeriods() == null || vo.getPeriods() == 0){
            return error("期数不能为空");
        }
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("betRecordList",gameFiveBallsService.betRecordList(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 5球投注
     */
    @PostMapping("/addFiveBallsBetRecord")
    public AjaxResult addFiveBallsBetRecord(@RequestBody FiveBallsAddBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        gameFiveBallsService.addFiveBallsBetRecord(sessionUser.getUserId(),vo);
        return ajax;
    }

    /**
     * 5球复数投注
     */
    @PostMapping("/addFiveBallsMultiBetRecord")
    public AjaxResult addFiveBallsMultiBetRecord(@RequestBody FiveBallsAddMultiBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        gameFiveBallsService.addFiveBallsMultiBetRecord(sessionUser.getUserId(),vo);
        return ajax;
    }

    /**
     * 5球撤销投注
     */
    @PostMapping("/delFiveBallsBetRecord")
    public AjaxResult delFiveBallsBetRecord(@RequestBody DelBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        gameFiveBallsService.delFiveBallsBetRecord(sessionUser.getUserId(),vo);
        return ajax;
    }
}