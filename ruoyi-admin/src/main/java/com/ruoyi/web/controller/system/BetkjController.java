package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.IBetkjService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 开奖Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/betkj")
public class BetkjController extends BaseController
{
    @Autowired
    private IBetkjService betkjService;

    @Autowired
    private ISysGameService gameService;

    /**
     * 查询开奖列表
     *
     * @param vo 开奖
     * @return 开奖集合
     */
    @GetMapping("/list")
    public TableDataInfo list(BetkjReqVO vo)
    {
        SysGame gameInfo = gameService.selectSysGameByGameId(vo.getGameId());
        startPage();
        List<BetkjRespVo> list = betkjService.selectBetkjList(gameInfo,vo);
        return getDataTable(list);
    }

    /**
     * 修复开奖数据接口
     */
    @PostMapping("/betRepair")
    public AjaxResult betRepair(@RequestBody BetRepairReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        betkjService.BetRepair(vo);
        AjaxResult ajax = AjaxResult.success("修复开奖成功");
        return ajax;
    }

    /**
     * 手动开奖数据接口
     */
    @PostMapping("/handleLottery")
    public AjaxResult handleLottery(@RequestBody HandleLotteryReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        betkjService.handleLottery(vo);
        AjaxResult ajax = AjaxResult.success("手动开奖成功");
        return ajax;
    }

    @GetMapping("/listUserWinGameBet")
    public TableDataInfo listUserWinGameBet(BetUserWinReqVO vo)
    {
        SysGame gameInfo = gameService.selectSysGameByGameId(vo.getGameId());
        startPage();
        List<BetUserWinRespVo> list = betkjService.selectUserGameWinBetList(gameInfo,vo);
        return getDataTable(list);
    }

    /**
     * 手动开奖数据接口
     */
    @PostMapping("/betUserDeduct")
    public AjaxResult betUserDeduct(@RequestBody BetUserDeductReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        betkjService.betUserDeduct(vo);
        AjaxResult ajax = AjaxResult.success("处理成功");
        return ajax;
    }
}
