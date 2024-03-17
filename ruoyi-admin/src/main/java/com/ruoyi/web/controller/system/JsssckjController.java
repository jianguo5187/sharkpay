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
import com.ruoyi.system.domain.Jsssckj;
import com.ruoyi.system.service.IJsssckjService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 极速时时彩开奖Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jsssckj")
public class JsssckjController extends BaseController
{
    @Autowired
    private IJsssckjService jsssckjService;

    /**
     * 查询极速时时彩开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jsssckj jsssckj)
    {
        startPage();
        List<Jsssckj> list = jsssckjService.selectJsssckjList(jsssckj);
        return getDataTable(list);
    }

    /**
     * 导出极速时时彩开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:export')")
    @Log(title = "极速时时彩开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jsssckj jsssckj)
    {
        List<Jsssckj> list = jsssckjService.selectJsssckjList(jsssckj);
        ExcelUtil<Jsssckj> util = new ExcelUtil<Jsssckj>(Jsssckj.class);
        util.exportExcel(response, list, "极速时时彩开奖数据");
    }

    /**
     * 获取极速时时彩开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jsssckjService.selectJsssckjById(id));
    }

    /**
     * 新增极速时时彩开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:add')")
    @Log(title = "极速时时彩开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jsssckj jsssckj)
    {
        return toAjax(jsssckjService.insertJsssckj(jsssckj));
    }

    /**
     * 修改极速时时彩开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:edit')")
    @Log(title = "极速时时彩开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jsssckj jsssckj)
    {
        return toAjax(jsssckjService.updateJsssckj(jsssckj));
    }

    /**
     * 删除极速时时彩开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jsssckj:remove')")
    @Log(title = "极速时时彩开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jsssckjService.deleteJsssckjByIds(ids));
    }
}
