package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.GameThreeballMixedOdds;
import com.ruoyi.system.service.IGameThreeballMixedOddsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 3球特殊赔率Controller
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/system/odds")
public class GameThreeballMixedOddsController extends BaseController
{
    @Autowired
    private IGameThreeballMixedOddsService gameThreeballMixedOddsService;

    /**
     * 查询3球特殊赔率列表
     */
    @GetMapping("/list")
    public TableDataInfo list(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        startPage();
        List<GameThreeballMixedOdds> list = gameThreeballMixedOddsService.selectGameThreeballMixedOddsList(gameThreeballMixedOdds);
        return getDataTable(list);
    }

    /**
     * 导出3球特殊赔率列表
     */
    @Log(title = "3球特殊赔率", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        List<GameThreeballMixedOdds> list = gameThreeballMixedOddsService.selectGameThreeballMixedOddsList(gameThreeballMixedOdds);
        ExcelUtil<GameThreeballMixedOdds> util = new ExcelUtil<GameThreeballMixedOdds>(GameThreeballMixedOdds.class);
        util.exportExcel(response, list, "3球特殊赔率数据");
    }

    /**
     * 获取3球特殊赔率详细信息
     */
    @GetMapping(value = "/{mixedOddsId}")
    public AjaxResult getInfo(@PathVariable("mixedOddsId") Long mixedOddsId)
    {
        return success(gameThreeballMixedOddsService.selectGameThreeballMixedOddsByMixedOddsId(mixedOddsId));
    }

    /**
     * 新增3球特殊赔率
     */
    @Log(title = "3球特殊赔率", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        return toAjax(gameThreeballMixedOddsService.insertGameThreeballMixedOdds(gameThreeballMixedOdds));
    }

    /**
     * 修改3球特殊赔率
     */
    @Log(title = "3球特殊赔率", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        SysUser actionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(gameThreeballMixedOddsService.updateGameThreeballMixedOdds(gameThreeballMixedOdds,actionUser));
    }

    /**
     * 删除3球特殊赔率
     */
    @Log(title = "3球特殊赔率", businessType = BusinessType.DELETE)
	@DeleteMapping("/{mixedOddsIds}")
    public AjaxResult remove(@PathVariable Long[] mixedOddsIds)
    {
        return toAjax(gameThreeballMixedOddsService.deleteGameThreeballMixedOddsByMixedOddsIds(mixedOddsIds));
    }

    @GetMapping("getGameOddsInfo")
    public AjaxResult getGameOddsInfo(GameThreeballMixedOdds gameThreeballMixedOdds){
        return success(gameThreeballMixedOddsService.selectGameThreeballMixedOddsByGameId(gameThreeballMixedOdds));
    }
}
