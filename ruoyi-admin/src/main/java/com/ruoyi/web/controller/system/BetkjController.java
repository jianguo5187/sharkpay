package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.Azxy10kj;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.BetkjReqVO;
import com.ruoyi.system.domain.vo.BetkjRespVo;
import com.ruoyi.system.service.IBetkjService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 极速时时彩开奖Controller
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
     * 查询极速时时彩开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:list')")
    @GetMapping("/list")
    public TableDataInfo list(BetkjReqVO vo)
    {
        SysGame gameInfo = gameService.selectSysGameByGameId(vo.getGameId());
        startPage();
        List<BetkjRespVo> list = betkjService.selectBetkjList(gameInfo,vo);
        return getDataTable(list);
    }
}
