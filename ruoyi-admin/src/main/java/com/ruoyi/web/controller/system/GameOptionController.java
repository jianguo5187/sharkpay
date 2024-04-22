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
import com.ruoyi.system.domain.GameOption;
import com.ruoyi.system.service.IGameOptionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 转化Controller
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
@RestController
@RequestMapping("/system/gameOption")
public class GameOptionController extends BaseController
{
    @Autowired
    private IGameOptionService gameOptionService;

    /**
     * 查询转化列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameOption gameOption)
    {
        startPage();
        List<GameOption> list = gameOptionService.selectGameOptionList(gameOption);
        return getDataTable(list);
    }

    /**
     * 导出转化列表
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:export')")
    @Log(title = "转化", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameOption gameOption)
    {
        List<GameOption> list = gameOptionService.selectGameOptionList(gameOption);
        ExcelUtil<GameOption> util = new ExcelUtil<GameOption>(GameOption.class);
        util.exportExcel(response, list, "转化数据");
    }

    /**
     * 获取转化详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameOptionService.selectGameOptionById(id));
    }

    /**
     * 新增转化
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:add')")
    @Log(title = "转化", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameOption gameOption)
    {
        return toAjax(gameOptionService.insertGameOption(gameOption));
    }

    /**
     * 修改转化
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:edit')")
    @Log(title = "转化", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameOption gameOption)
    {
        return toAjax(gameOptionService.updateGameOption(gameOption));
    }

    /**
     * 删除转化
     */
    @PreAuthorize("@ss.hasPermi('system:gameOption:remove')")
    @Log(title = "转化", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameOptionService.deleteGameOptionByIds(ids));
    }
}
