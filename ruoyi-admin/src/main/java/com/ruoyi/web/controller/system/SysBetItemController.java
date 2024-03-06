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
import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.service.ISysBetItemService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏投注项Controller
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@RestController
@RequestMapping("/system/betItem")
public class SysBetItemController extends BaseController
{
    @Autowired
    private ISysBetItemService sysBetItemService;

    /**
     * 查询游戏投注项列表
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysBetItem sysBetItem)
    {
        startPage();
        List<SysBetItem> list = sysBetItemService.selectSysBetItemList(sysBetItem);
        return getDataTable(list);
    }

    /**
     * 导出游戏投注项列表
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:export')")
    @Log(title = "游戏投注项", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysBetItem sysBetItem)
    {
        List<SysBetItem> list = sysBetItemService.selectSysBetItemList(sysBetItem);
        ExcelUtil<SysBetItem> util = new ExcelUtil<SysBetItem>(SysBetItem.class);
        util.exportExcel(response, list, "游戏投注项数据");
    }

    /**
     * 获取游戏投注项详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:query')")
    @GetMapping(value = "/{betItemId}")
    public AjaxResult getInfo(@PathVariable("betItemId") Long betItemId)
    {
        return success(sysBetItemService.selectSysBetItemByBetItemId(betItemId));
    }

    /**
     * 新增游戏投注项
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:add')")
    @Log(title = "游戏投注项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysBetItem sysBetItem)
    {
        return toAjax(sysBetItemService.insertSysBetItem(sysBetItem));
    }

    /**
     * 修改游戏投注项
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:edit')")
    @Log(title = "游戏投注项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysBetItem sysBetItem)
    {
        return toAjax(sysBetItemService.updateSysBetItem(sysBetItem));
    }

    /**
     * 删除游戏投注项
     */
    @PreAuthorize("@ss.hasPermi('system:betItem:remove')")
    @Log(title = "游戏投注项", businessType = BusinessType.DELETE)
	@DeleteMapping("/{betItemIds}")
    public AjaxResult remove(@PathVariable Long[] betItemIds)
    {
        return toAjax(sysBetItemService.deleteSysBetItemByBetItemIds(betItemIds));
    }
}
