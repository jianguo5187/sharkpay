package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.IGameTenBallsService;
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
@RequestMapping("/tenballs")
public class GameTenBallsController  extends BaseController {

    @Autowired
    private IGameTenBallsService gameTenBallsService;

    @Autowired
    private ISysGameService sysGameService;

    /**
     * 获取10球赔率表
     */
    @PostMapping("/odds")
    public AjaxResult odds(@RequestBody TenBallsOddsReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("oddList",gameTenBallsService.getOddsInfo(vo));
        return ajax;
    }

    /**
     * 获取10球开奖结果和账户余额
     */
    @PostMapping("/kjRecordMoney")
    public AjaxResult kjRecordMoney(@RequestBody TenBallsOddsReqVO vo){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",gameTenBallsService.kjRecordMoney(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取10球开奖期数以及开奖/截止时间
     */
    @PostMapping("/timeDate")
    public AjaxResult timeDate(@RequestBody TenBallsOddsReqVO vo){
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
            ajax.put("data", gameTenBallsService.timeDate(vo));
        }
        return ajax;
    }

    /**
     * 获取10球虚拟用户下注数据
     */
    @PostMapping("/virtuallyGameRecord")
    public AjaxResult virtuallyGameRecord(@RequestBody VirtuallyGameRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<VirtuallyGameRecordRespVO> virtuallyRecordList = gameTenBallsService.virtuallyGameRecord(sessionUser.getUserId(),vo,false);
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
     * 获取10球投注记录
     */
    @PostMapping("/betRecordList")
    public AjaxResult betRecordList(@RequestBody TenBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<BetRecordListRespVO> betRecordLis = gameTenBallsService.betRecordList(sessionUser.getUserId(),vo);
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
     * 获取10球投注记录汇总
     */
    @PostMapping("/periodsAllBetRecordList")
    public AjaxResult periodsAllBetRecordList(@RequestBody TenBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        if(vo.getPeriods() == null || vo.getPeriods() == 0){
            return error("期数不能为空");
        }
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<BetRecordListRespVO> betRecordLis = gameTenBallsService.betRecordList(sessionUser.getUserId(),vo);
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
     * 10球投注
     */
    @PostMapping("/addTenBallsBetRecord")
    public AjaxResult addTenBallsBetRecord(@RequestBody TenBallsAddBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("lastBetRecordId",gameTenBallsService.addTenBallsBetRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 10球复数投注
     */
    @PostMapping("/addTenBallsMultiBetRecord")
    public AjaxResult addTenBallsMultiBetRecord(@RequestBody TenBallsAddMultiBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("lastBetRecordId",gameTenBallsService.addTenBallsMultiBetRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 10球撤销投注
     */
    @PostMapping("/delTenBallsBetRecord")
    public AjaxResult delTenBallsBetRecord(@RequestBody DelBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        gameTenBallsService.delTenBallsBetRecord(sessionUser.getUserId(),vo);
        return ajax;
    }

    /**
     * 10球追号
     */
    @PostMapping("/addTenBallsAutoBetRecord")
    public AjaxResult addTenBallsAutoBetRecord(@RequestBody AddAutoBetRecordReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        ajax.put("lastBetRecordId",gameTenBallsService.addTenBallsAutoBetRecord(sessionUser.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取10球投注记录
     */
    @PostMapping("/userBetRecord")
    public AjaxResult userBetRecord(@RequestBody TenBallsBetRecordListReqVO vo){
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        List<BetRecordListRespVO> betRecordLis = gameTenBallsService.userBetRecord(sessionUser.getUserId(),vo);
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
}
