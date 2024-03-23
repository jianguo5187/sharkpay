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
import com.ruoyi.system.domain.Jndrecord;
import com.ruoyi.system.service.IJndrecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 加拿大下注Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jndrecord")
public class JndrecordController extends BaseController
{
    @Autowired
    private IJndrecordService jndrecordService;

    /**
     * 查询加拿大下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jndrecord jndrecord)
    {
        startPage();
        List<Jndrecord> list = jndrecordService.selectJndrecordList(jndrecord);
        return getDataTable(list);
    }

    /**
     * 导出加拿大下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:export')")
    @Log(title = "加拿大下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jndrecord jndrecord)
    {
        List<Jndrecord> list = jndrecordService.selectJndrecordList(jndrecord);
        ExcelUtil<Jndrecord> util = new ExcelUtil<Jndrecord>(Jndrecord.class);
        util.exportExcel(response, list, "加拿大下注数据");
    }

    /**
     * 获取加拿大下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jndrecordService.selectJndrecordById(id));
    }

    /**
     * 新增加拿大下注
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:add')")
    @Log(title = "加拿大下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jndrecord jndrecord)
    {
        return toAjax(jndrecordService.insertJndrecord(jndrecord));
    }

    /**
     * 修改加拿大下注
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:edit')")
    @Log(title = "加拿大下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jndrecord jndrecord)
    {
        return toAjax(jndrecordService.updateJndrecord(jndrecord));
    }

    /**
     * 删除加拿大下注
     */
    @PreAuthorize("@ss.hasPermi('system:jndrecord:remove')")
    @Log(title = "加拿大下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jndrecordService.deleteJndrecordByIds(ids));
    }
}
