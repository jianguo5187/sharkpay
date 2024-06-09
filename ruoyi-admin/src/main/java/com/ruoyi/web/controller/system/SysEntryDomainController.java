package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
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
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.service.ISysEntryDomainService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 入口域名Controller
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
@RestController
@RequestMapping("/system/entryDomain")
public class SysEntryDomainController extends BaseController
{
    @Autowired
    private ISysEntryDomainService sysEntryDomainService;

    /**
     * 查询入口域名列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysEntryDomain sysEntryDomain)
    {
        startPage();
        List<SysEntryDomain> list = sysEntryDomainService.selectSysEntryDomainList(sysEntryDomain);
        return getDataTable(list);
    }

    /**
     * 导出入口域名列表
     */
    @Log(title = "入口域名", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEntryDomain sysEntryDomain)
    {
        List<SysEntryDomain> list = sysEntryDomainService.selectSysEntryDomainList(sysEntryDomain);
        ExcelUtil<SysEntryDomain> util = new ExcelUtil<SysEntryDomain>(SysEntryDomain.class);
        util.exportExcel(response, list, "入口域名数据");
    }

    /**
     * 获取入口域名详细信息
     */
    @GetMapping(value = "/{entryDomainId}")
    public AjaxResult getInfo(@PathVariable("entryDomainId") Long entryDomainId)
    {
        return success(sysEntryDomainService.selectSysEntryDomainByEntryDomainId(entryDomainId));
    }

    /**
     * 新增入口域名
     */
    @Log(title = "入口域名", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEntryDomain sysEntryDomain)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        sysEntryDomain.setCreateBy(sessionUser.getNickName());
        return toAjax(sysEntryDomainService.insertSysEntryDomain(sysEntryDomain));
    }

    /**
     * 修改入口域名
     */
    @Log(title = "入口域名", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEntryDomain sysEntryDomain)
    {
        return toAjax(sysEntryDomainService.updateSysEntryDomain(sysEntryDomain));
    }

    /**
     * 删除入口域名
     */
    @Log(title = "入口域名", businessType = BusinessType.DELETE)
	@DeleteMapping("/{entryDomainIds}")
    public AjaxResult remove(@PathVariable Long[] entryDomainIds)
    {
        return toAjax(sysEntryDomainService.deleteSysEntryDomainByEntryDomainIds(entryDomainIds));
    }
}
