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
import com.ruoyi.system.domain.SysWechatAuth;
import com.ruoyi.system.service.ISysWechatAuthService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 授权域名Controller
 * 
 * @author ruoyi
 * @date 2024-12-31
 */
@RestController
@RequestMapping("/system/wechatAuth")
public class SysWechatAuthController extends BaseController
{
    @Autowired
    private ISysWechatAuthService sysWechatAuthService;

    /**
     * 查询授权域名列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysWechatAuth sysWechatAuth)
    {
        startPage();
        sysWechatAuth.setDelFlag("0");
        List<SysWechatAuth> list = sysWechatAuthService.selectSysWechatAuthList(sysWechatAuth);
        return getDataTable(list);
    }

    /**
     * 导出授权域名列表
     */
    @Log(title = "授权域名", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysWechatAuth sysWechatAuth)
    {
        sysWechatAuth.setDelFlag("0");
        List<SysWechatAuth> list = sysWechatAuthService.selectSysWechatAuthList(sysWechatAuth);
        ExcelUtil<SysWechatAuth> util = new ExcelUtil<SysWechatAuth>(SysWechatAuth.class);
        util.exportExcel(response, list, "授权域名数据");
    }

    /**
     * 获取授权域名详细信息
     */
    @GetMapping(value = "/{wechatAuthId}")
    public AjaxResult getInfo(@PathVariable("wechatAuthId") Long wechatAuthId)
    {
        return success(sysWechatAuthService.selectSysWechatAuthByWechatAuthId(wechatAuthId));
    }

    /**
     * 新增授权域名
     */
    @Log(title = "授权域名", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysWechatAuth sysWechatAuth)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        sysWechatAuth.setCreateBy(sessionUser.getNickName());
        return toAjax(sysWechatAuthService.insertSysWechatAuth(sysWechatAuth));
    }

    /**
     * 修改授权域名
     */
    @Log(title = "授权域名", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysWechatAuth sysWechatAuth)
    {
        return toAjax(sysWechatAuthService.updateSysWechatAuth(sysWechatAuth));
    }

    /**
     * 删除授权域名
     */
    @Log(title = "授权域名", businessType = BusinessType.DELETE)
	@DeleteMapping("/{wechatAuthIds}")
    public AjaxResult remove(@PathVariable Long[] wechatAuthIds)
    {
        return toAjax(sysWechatAuthService.deleteSysWechatAuthByWechatAuthIds(wechatAuthIds));
    }
}
