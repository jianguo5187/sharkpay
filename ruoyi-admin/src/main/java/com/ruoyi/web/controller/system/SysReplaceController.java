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
import com.ruoyi.system.domain.SysReplace;
import com.ruoyi.system.service.ISysReplaceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 广告轮播图Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/replace")
public class SysReplaceController extends BaseController
{
    @Autowired
    private ISysReplaceService sysReplaceService;

    /**
     * 查询广告轮播图列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysReplace sysReplace)
    {
        startPage();
        List<SysReplace> list = sysReplaceService.selectSysReplaceList(sysReplace);
        return getDataTable(list);
    }

    /**
     * 导出广告轮播图列表
     */
    @Log(title = "广告轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysReplace sysReplace)
    {
        List<SysReplace> list = sysReplaceService.selectSysReplaceList(sysReplace);
        ExcelUtil<SysReplace> util = new ExcelUtil<SysReplace>(SysReplace.class);
        util.exportExcel(response, list, "广告轮播图数据");
    }

    /**
     * 获取广告轮播图详细信息
     */
    @GetMapping(value = "/{replaceId}")
    public AjaxResult getInfo(@PathVariable("replaceId") Long replaceId)
    {
        return success(sysReplaceService.selectSysReplaceByReplaceId(replaceId));
    }

    /**
     * 新增广告轮播图
     */
    @Log(title = "广告轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysReplace sysReplace)
    {
        return toAjax(sysReplaceService.insertSysReplace(sysReplace));
    }

    /**
     * 修改广告轮播图
     */
    @Log(title = "广告轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysReplace sysReplace)
    {
        return toAjax(sysReplaceService.updateSysReplace(sysReplace));
    }

    /**
     * 删除广告轮播图
     */
    @Log(title = "广告轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{replaceIds}")
    public AjaxResult remove(@PathVariable Long[] replaceIds)
    {
        return toAjax(sysReplaceService.deleteSysReplaceByReplaceIds(replaceIds));
    }
}
