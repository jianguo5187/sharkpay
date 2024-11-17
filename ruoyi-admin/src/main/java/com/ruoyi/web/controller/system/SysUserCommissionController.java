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
import com.ruoyi.system.domain.SysUserCommission;
import com.ruoyi.system.service.ISysUserCommissionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户佣金Controller
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
@RestController
@RequestMapping("/system/userCommission")
public class SysUserCommissionController extends BaseController
{
    @Autowired
    private ISysUserCommissionService sysUserCommissionService;

    /**
     * 查询用户佣金列表
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUserCommission sysUserCommission)
    {
        startPage();
        List<SysUserCommission> list = sysUserCommissionService.selectSysUserCommissionList(sysUserCommission);
        return getDataTable(list);
    }

    /**
     * 导出用户佣金列表
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:export')")
    @Log(title = "用户佣金", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserCommission sysUserCommission)
    {
        List<SysUserCommission> list = sysUserCommissionService.selectSysUserCommissionList(sysUserCommission);
        ExcelUtil<SysUserCommission> util = new ExcelUtil<SysUserCommission>(SysUserCommission.class);
        util.exportExcel(response, list, "用户佣金数据");
    }

    /**
     * 获取用户佣金详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserCommissionService.selectSysUserCommissionById(id));
    }

    /**
     * 新增用户佣金
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:add')")
    @Log(title = "用户佣金", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserCommission sysUserCommission)
    {
        return toAjax(sysUserCommissionService.insertSysUserCommission(sysUserCommission));
    }

    /**
     * 修改用户佣金
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:edit')")
    @Log(title = "用户佣金", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserCommission sysUserCommission)
    {
        return toAjax(sysUserCommissionService.updateSysUserCommission(sysUserCommission));
    }

    /**
     * 删除用户佣金
     */
    @PreAuthorize("@ss.hasPermi('system:userCommission:remove')")
    @Log(title = "用户佣金", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserCommissionService.deleteSysUserCommissionByIds(ids));
    }
}
