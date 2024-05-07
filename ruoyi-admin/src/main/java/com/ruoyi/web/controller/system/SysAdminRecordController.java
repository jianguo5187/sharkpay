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
import com.ruoyi.system.domain.SysAdminRecord;
import com.ruoyi.system.service.ISysAdminRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 管理员记录Controller
 * 
 * @author ruoyi
 * @date 2024-05-07
 */
@RestController
@RequestMapping("/system/adminRecord")
public class SysAdminRecordController extends BaseController
{
    @Autowired
    private ISysAdminRecordService sysAdminRecordService;

    /**
     * 查询管理员记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAdminRecord sysAdminRecord)
    {
        startPage();
        List<SysAdminRecord> list = sysAdminRecordService.selectSysAdminRecordList(sysAdminRecord);
        return getDataTable(list);
    }

    /**
     * 导出管理员记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:export')")
    @Log(title = "管理员记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysAdminRecord sysAdminRecord)
    {
        List<SysAdminRecord> list = sysAdminRecordService.selectSysAdminRecordList(sysAdminRecord);
        ExcelUtil<SysAdminRecord> util = new ExcelUtil<SysAdminRecord>(SysAdminRecord.class);
        util.exportExcel(response, list, "管理员记录数据");
    }

    /**
     * 获取管理员记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysAdminRecordService.selectSysAdminRecordById(id));
    }

    /**
     * 新增管理员记录
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:add')")
    @Log(title = "管理员记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAdminRecord sysAdminRecord)
    {
        return toAjax(sysAdminRecordService.insertSysAdminRecord(sysAdminRecord));
    }

    /**
     * 修改管理员记录
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:edit')")
    @Log(title = "管理员记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAdminRecord sysAdminRecord)
    {
        return toAjax(sysAdminRecordService.updateSysAdminRecord(sysAdminRecord));
    }

    /**
     * 删除管理员记录
     */
    @PreAuthorize("@ss.hasPermi('system:adminRecord:remove')")
    @Log(title = "管理员记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAdminRecordService.deleteSysAdminRecordByIds(ids));
    }
}
