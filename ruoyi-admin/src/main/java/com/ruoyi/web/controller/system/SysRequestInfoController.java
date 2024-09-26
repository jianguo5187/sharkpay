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
import com.ruoyi.system.domain.SysRequestInfo;
import com.ruoyi.system.service.ISysRequestInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 请求信息Controller
 * 
 * @author ruoyi
 * @date 2024-09-13
 */
@RestController
@RequestMapping("/system/info")
public class SysRequestInfoController extends BaseController
{
    @Autowired
    private ISysRequestInfoService sysRequestInfoService;

    /**
     * 查询请求信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysRequestInfo sysRequestInfo)
    {
        startPage();
        List<SysRequestInfo> list = sysRequestInfoService.selectSysRequestInfoList(sysRequestInfo);
        return getDataTable(list);
    }

    /**
     * 导出请求信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "请求信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRequestInfo sysRequestInfo)
    {
        List<SysRequestInfo> list = sysRequestInfoService.selectSysRequestInfoList(sysRequestInfo);
        ExcelUtil<SysRequestInfo> util = new ExcelUtil<SysRequestInfo>(SysRequestInfo.class);
        util.exportExcel(response, list, "请求信息数据");
    }

    /**
     * 获取请求信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{requestInfoId}")
    public AjaxResult getInfo(@PathVariable("requestInfoId") Long requestInfoId)
    {
        return success(sysRequestInfoService.selectSysRequestInfoByRequestInfoId(requestInfoId));
    }

    /**
     * 新增请求信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "请求信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRequestInfo sysRequestInfo)
    {
        return toAjax(sysRequestInfoService.insertSysRequestInfo(sysRequestInfo));
    }

    /**
     * 修改请求信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "请求信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRequestInfo sysRequestInfo)
    {
        return toAjax(sysRequestInfoService.updateSysRequestInfo(sysRequestInfo));
    }

    /**
     * 删除请求信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "请求信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{requestInfoIds}")
    public AjaxResult remove(@PathVariable Long[] requestInfoIds)
    {
        return toAjax(sysRequestInfoService.deleteSysRequestInfoByRequestInfoIds(requestInfoIds));
    }
}
