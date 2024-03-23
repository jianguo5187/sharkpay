package com.ruoyi.web.controller.system;

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
import com.ruoyi.system.domain.Jnd28;
import com.ruoyi.system.service.IJnd28Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 加拿大开奖Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jnd28")
public class Jnd28Controller extends BaseController
{
    @Autowired
    private IJnd28Service jnd28Service;

    /**
     * 查询加拿大开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jnd28 jnd28)
    {
        startPage();
        List<Jnd28> list = jnd28Service.selectJnd28List(jnd28);
        return getDataTable(list);
    }

    /**
     * 导出加拿大开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:export')")
    @Log(title = "加拿大开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jnd28 jnd28)
    {
        List<Jnd28> list = jnd28Service.selectJnd28List(jnd28);
        ExcelUtil<Jnd28> util = new ExcelUtil<Jnd28>(Jnd28.class);
        util.exportExcel(response, list, "加拿大开奖数据");
    }

    /**
     * 获取加拿大开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jnd28Service.selectJnd28ById(id));
    }

    /**
     * 新增加拿大开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:add')")
    @Log(title = "加拿大开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jnd28 jnd28)
    {
        return toAjax(jnd28Service.insertJnd28(jnd28));
    }

    /**
     * 修改加拿大开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:edit')")
    @Log(title = "加拿大开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jnd28 jnd28)
    {
        return toAjax(jnd28Service.updateJnd28(jnd28));
    }

    /**
     * 删除加拿大开奖
     */
    @PreAuthorize("@ss.hasPermi('system:jnd28:remove')")
    @Log(title = "加拿大开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jnd28Service.deleteJnd28ByIds(ids));
    }
}
