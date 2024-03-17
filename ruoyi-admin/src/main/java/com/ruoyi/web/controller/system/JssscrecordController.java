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
import com.ruoyi.system.domain.Jssscrecord;
import com.ruoyi.system.service.IJssscrecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 极速时时彩下注Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jssscrecord")
public class JssscrecordController extends BaseController
{
    @Autowired
    private IJssscrecordService jssscrecordService;

    /**
     * 查询极速时时彩下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jssscrecord jssscrecord)
    {
        startPage();
        List<Jssscrecord> list = jssscrecordService.selectJssscrecordList(jssscrecord);
        return getDataTable(list);
    }

    /**
     * 导出极速时时彩下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:export')")
    @Log(title = "极速时时彩下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jssscrecord jssscrecord)
    {
        List<Jssscrecord> list = jssscrecordService.selectJssscrecordList(jssscrecord);
        ExcelUtil<Jssscrecord> util = new ExcelUtil<Jssscrecord>(Jssscrecord.class);
        util.exportExcel(response, list, "极速时时彩下注数据");
    }

    /**
     * 获取极速时时彩下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jssscrecordService.selectJssscrecordById(id));
    }

    /**
     * 新增极速时时彩下注
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:add')")
    @Log(title = "极速时时彩下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jssscrecord jssscrecord)
    {
        return toAjax(jssscrecordService.insertJssscrecord(jssscrecord));
    }

    /**
     * 修改极速时时彩下注
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:edit')")
    @Log(title = "极速时时彩下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jssscrecord jssscrecord)
    {
        return toAjax(jssscrecordService.updateJssscrecord(jssscrecord));
    }

    /**
     * 删除极速时时彩下注
     */
    @PreAuthorize("@ss.hasPermi('system:jssscrecord:remove')")
    @Log(title = "极速时时彩下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jssscrecordService.deleteJssscrecordByIds(ids));
    }
}
