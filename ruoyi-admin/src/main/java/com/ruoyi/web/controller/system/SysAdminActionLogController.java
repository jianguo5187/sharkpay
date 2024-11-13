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
import com.ruoyi.system.domain.SysAdminActionLog;
import com.ruoyi.system.service.ISysAdminActionLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 管理员操作记录Controller
 * 
 * @author ruoyi
 * @date 2024-11-13
 */
@RestController
@RequestMapping("/system/adminLog")
public class SysAdminActionLogController extends BaseController
{
    @Autowired
    private ISysAdminActionLogService sysAdminActionLogService;

    /**
     * 查询管理员操作记录列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysAdminActionLog sysAdminActionLog)
    {
        startPage();
        List<SysAdminActionLog> list = sysAdminActionLogService.selectSysAdminActionLogList(sysAdminActionLog);
        return getDataTable(list);
    }

    /**
     * 导出管理员操作记录列表
     */
    @Log(title = "管理员操作记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysAdminActionLog sysAdminActionLog)
    {
        List<SysAdminActionLog> list = sysAdminActionLogService.selectSysAdminActionLogList(sysAdminActionLog);
        ExcelUtil<SysAdminActionLog> util = new ExcelUtil<SysAdminActionLog>(SysAdminActionLog.class);
        util.exportExcel(response, list, "管理员操作记录数据");
    }

    /**
     * 获取管理员操作记录详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysAdminActionLogService.selectSysAdminActionLogById(id));
    }

    /**
     * 新增管理员操作记录
     */
    @Log(title = "管理员操作记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAdminActionLog sysAdminActionLog)
    {
        return toAjax(sysAdminActionLogService.insertSysAdminActionLog(sysAdminActionLog));
    }

    /**
     * 修改管理员操作记录
     */
    @Log(title = "管理员操作记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAdminActionLog sysAdminActionLog)
    {
        return toAjax(sysAdminActionLogService.updateSysAdminActionLog(sysAdminActionLog));
    }

    /**
     * 删除管理员操作记录
     */
    @Log(title = "管理员操作记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAdminActionLogService.deleteSysAdminActionLogByIds(ids));
    }
}
