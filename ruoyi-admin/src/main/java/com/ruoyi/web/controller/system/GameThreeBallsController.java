package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.IGameTenBallsService;
import com.ruoyi.system.service.IGameThreeBallsService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * APP使用接口
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/threeballs")
public class GameThreeBallsController  extends BaseController {

    @Autowired
    private IGameThreeBallsService gameThreeBallsService;

    @Autowired
    private ISysGameService sysGameService;

    /**
     * 获取3球赔率表
     */
    @PostMapping("/odds")
    public AjaxResult odds(@RequestBody ThreeBallsOddsReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("oddList",gameThreeBallsService.getOddsInfo(vo));
        return ajax;
    }

    /**
     * 获取3球开奖结果和账户余额
     */
    @PostMapping("/kjRecordMoney")
    public AjaxResult kjRecordMoney(@RequestBody ThreeBallsOddsReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",gameThreeBallsService.kjRecordMoney(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取3球开奖期数以及开奖/截止时间
     */
    @PostMapping("/timeDate")
    public AjaxResult timeDate(@RequestBody ThreeBallsOddsReqVO vo){
        AjaxResult ajax = AjaxResult.success();

        SimpleDateFormat sd = new SimpleDateFormat("MMdd");
        String nowTime = sd.format(new Date());
        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());

        //游戏停盘维护判断
        if(Integer.valueOf(gameInfo.getValidOpenStartTime()).compareTo(Integer.valueOf(nowTime)) > 0
                || Integer.valueOf(gameInfo.getValidOpenEndTime()).compareTo(Integer.valueOf(nowTime)) < 0){
            ajax.put("gameShutdownFlg","1");
        }else {
            ajax.put("gameShutdownFlg", "0");
            ajax.put("data", gameThreeBallsService.timeDate(vo));
        }
        return ajax;
    }

    /**
     * 获取3球虚拟用户下注数据
     */
    @PostMapping("/virtuallyGameRecord")
    public AjaxResult virtuallyGameRecord(@RequestBody VirtuallyGameRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<VirtuallyGameRecordRespVO> virtuallyRecordList = gameThreeBallsService.virtuallyGameRecord(sessionUser.getUserId(),vo,false);
        Long lastBetRecordId = 0l;
        for(VirtuallyGameRecordRespVO virtuallyGameRecordRespVO : virtuallyRecordList){
            if(virtuallyGameRecordRespVO.getBetId().compareTo(lastBetRecordId) > 0){
                lastBetRecordId = virtuallyGameRecordRespVO.getBetId();
            }
        }
        ajax.put("virtuallyRecordList",virtuallyRecordList);
        ajax.put("lastBetRecordId",lastBetRecordId);

        return ajax;
    }

    /**
     * 获取3球投注记录
     */
    @PostMapping("/betRecordList")
    public AjaxResult betRecordList(@RequestBody ThreeBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<BetRecordListRespVO> betRecordLis = gameThreeBallsService.betRecordList(sessionUser.getUserId(),vo);
        Long lastBetRecordId = 0l;
        for(BetRecordListRespVO respVO : betRecordLis){
            if(respVO.getBetId().compareTo(lastBetRecordId) > 0){
                lastBetRecordId = respVO.getBetId();
            }
        }
        ajax.put("betRecordList",betRecordLis);
        ajax.put("lastBetRecordId",lastBetRecordId);
        return ajax;
    }

    /**
     * 获取3球投注记录汇总
     */
    @PostMapping("/periodsAllBetRecordList")
    public AjaxResult periodsAllBetRecordList(@RequestBody ThreeBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        if(vo.getPeriods() == null || vo.getPeriods() == 0){
            return error("期数不能为空");
        }
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<BetRecordListRespVO> betRecordLis = gameThreeBallsService.betRecordList(sessionUser.getUserId(),vo);
        Long lastBetRecordId = 0l;
        for(BetRecordListRespVO respVO : betRecordLis){
            if(respVO.getBetId().compareTo(lastBetRecordId) > 0){
                lastBetRecordId = respVO.getBetId();
            }
        }
        ajax.put("betRecordList",betRecordLis);
        ajax.put("lastBetRecordId",lastBetRecordId);
        return ajax;
    }

    /**
     * 3球投注
     */
    @PostMapping("/addThreeBallsBetRecord")
    public AjaxResult addThreeBallsBetRecord(@RequestBody ThreeBallsAddBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("lastBetRecordId",gameThreeBallsService.addThreeBallsBetRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 3球复数投注
     */
    @PostMapping("/addThreeBallsMultiBetRecord")
    public AjaxResult addThreeBallsMultiBetRecord(@RequestBody ThreeBallsAddMultiBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("lastBetRecordId",gameThreeBallsService.addThreeBallsMultiBetRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 3球撤销投注
     */
    @PostMapping("/delThreeBallsBetRecord")
    public AjaxResult delThreeBallsBetRecord(@RequestBody DelBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        gameThreeBallsService.delThreeBallsBetRecord(sessionUser.getUserId(),vo);
        return ajax;
    }
}
