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
import com.ruoyi.system.domain.SysLandingDomain;
import com.ruoyi.system.service.ISysLandingDomainService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 落地域名Controller
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
@RestController
@RequestMapping("/system/landingDomain")
public class SysLandingDomainController extends BaseController
{
    @Autowired
    private ISysLandingDomainService sysLandingDomainService;

    /**
     * 查询落地域名列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysLandingDomain sysLandingDomain)
    {
        startPage();
        List<SysLandingDomain> list = sysLandingDomainService.selectSysLandingDomainList(sysLandingDomain);
        return getDataTable(list);
    }

    /**
     * 导出落地域名列表
     */
    @Log(title = "落地域名", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLandingDomain sysLandingDomain)
    {
        List<SysLandingDomain> list = sysLandingDomainService.selectSysLandingDomainList(sysLandingDomain);
        ExcelUtil<SysLandingDomain> util = new ExcelUtil<SysLandingDomain>(SysLandingDomain.class);
        util.exportExcel(response, list, "落地域名数据");
    }

    /**
     * 获取落地域名详细信息
     */
    @GetMapping(value = "/{landingDomainId}")
    public AjaxResult getInfo(@PathVariable("landingDomainId") Long landingDomainId)
    {
        return success(sysLandingDomainService.selectSysLandingDomainByLandingDomainId(landingDomainId));
    }

    /**
     * 新增落地域名
     */
    @Log(title = "落地域名", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysLandingDomain sysLandingDomain)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        sysLandingDomain.setCreateBy(sessionUser.getNickName());
        return toAjax(sysLandingDomainService.insertSysLandingDomain(sysLandingDomain));
    }

    /**
     * 修改落地域名
     */
    @Log(title = "落地域名", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysLandingDomain sysLandingDomain)
    {
        return toAjax(sysLandingDomainService.updateSysLandingDomain(sysLandingDomain));
    }

    /**
     * 删除落地域名
     */
    @Log(title = "落地域名", businessType = BusinessType.DELETE)
	@DeleteMapping("/{landingDomainIds}")
    public AjaxResult remove(@PathVariable Long[] landingDomainIds)
    {
        return toAjax(sysLandingDomainService.deleteSysLandingDomainByLandingDomainIds(landingDomainIds));
    }
}
