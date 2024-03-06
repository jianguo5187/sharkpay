package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.service.ISysGameService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏Controller
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@RestController
@RequestMapping("/system/game")
public class SysGameController extends BaseController
{
    @Autowired
    private ISysGameService sysGameService;

    /**
     * 查询游戏列表
     */
    @PreAuthorize("@ss.hasPermi('system:game:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysGame sysGame)
    {
        startPage();
        List<SysGame> list = sysGameService.selectSysGameList(sysGame);
        return getDataTable(list);
    }

    /**
     * 导出游戏列表
     */
    @PreAuthorize("@ss.hasPermi('system:game:export')")
    @Log(title = "游戏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysGame sysGame)
    {
        List<SysGame> list = sysGameService.selectSysGameList(sysGame);
        ExcelUtil<SysGame> util = new ExcelUtil<SysGame>(SysGame.class);
        util.exportExcel(response, list, "游戏数据");
    }

    /**
     * 获取游戏详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:game:query')")
    @GetMapping(value = "/{gameId}")
    public AjaxResult getInfo(@PathVariable("gameId") Long gameId)
    {
        return success(sysGameService.selectSysGameByGameId(gameId));
    }

    /**
     * 新增游戏
     */
    @PreAuthorize("@ss.hasPermi('system:game:add')")
    @Log(title = "游戏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysGame sysGame)
    {
        return toAjax(sysGameService.insertSysGame(sysGame));
    }

    /**
     * 修改游戏
     */
    @PreAuthorize("@ss.hasPermi('system:game:edit')")
    @Log(title = "游戏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysGame sysGame)
    {
        return toAjax(sysGameService.updateSysGame(sysGame));
    }

    /**
     * 删除游戏
     */
    @PreAuthorize("@ss.hasPermi('system:game:remove')")
    @Log(title = "游戏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{gameIds}")
    public AjaxResult remove(@PathVariable Long[] gameIds)
    {
        return toAjax(sysGameService.deleteSysGameByGameIds(gameIds));
    }
}
