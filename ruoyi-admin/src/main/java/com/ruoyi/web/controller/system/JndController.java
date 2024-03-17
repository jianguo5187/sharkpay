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
import com.ruoyi.system.domain.Jnd;
import com.ruoyi.system.service.IJndService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 加拿大开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jnd")
public class JndController extends BaseController
{
    @Autowired
    private IJndService jndService;

    /**
     * 查询加拿大开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jnd jnd)
    {
        startPage();
        List<Jnd> list = jndService.selectJndList(jnd);
        return getDataTable(list);
    }

    /**
     * 导出加拿大开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:export')")
    @Log(title = "加拿大开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jnd jnd)
    {
        List<Jnd> list = jndService.selectJndList(jnd);
        ExcelUtil<Jnd> util = new ExcelUtil<Jnd>(Jnd.class);
        util.exportExcel(response, list, "加拿大开奖历史数据");
    }

    /**
     * 获取加拿大开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jndService.selectJndById(id));
    }

    /**
     * 新增加拿大开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:add')")
    @Log(title = "加拿大开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jnd jnd)
    {
        return toAjax(jndService.insertJnd(jnd));
    }

    /**
     * 修改加拿大开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:edit')")
    @Log(title = "加拿大开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jnd jnd)
    {
        return toAjax(jndService.updateJnd(jnd));
    }

    /**
     * 删除加拿大开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jnd:remove')")
    @Log(title = "加拿大开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jndService.deleteJndByIds(ids));
    }
}
