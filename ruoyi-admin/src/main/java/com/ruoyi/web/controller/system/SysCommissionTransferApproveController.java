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
import com.ruoyi.system.domain.SysCommissionTransferApprove;
import com.ruoyi.system.service.ISysCommissionTransferApproveService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 佣金转出审核Controller
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
@RestController
@RequestMapping("/system/commissionTransfer")
public class SysCommissionTransferApproveController extends BaseController
{
    @Autowired
    private ISysCommissionTransferApproveService sysCommissionTransferApproveService;

    /**
     * 查询佣金转出审核列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        startPage();
        List<SysCommissionTransferApprove> list = sysCommissionTransferApproveService.selectSysCommissionTransferApproveList(sysCommissionTransferApprove);
        return getDataTable(list);
    }

    /**
     * 导出佣金转出审核列表
     */
    @Log(title = "佣金转出审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        List<SysCommissionTransferApprove> list = sysCommissionTransferApproveService.selectSysCommissionTransferApproveList(sysCommissionTransferApprove);
        ExcelUtil<SysCommissionTransferApprove> util = new ExcelUtil<SysCommissionTransferApprove>(SysCommissionTransferApprove.class);
        util.exportExcel(response, list, "佣金转出审核数据");
    }

    /**
     * 获取佣金转出审核详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysCommissionTransferApproveService.selectSysCommissionTransferApproveById(id));
    }

    /**
     * 新增佣金转出审核
     */
    @Log(title = "佣金转出审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        return toAjax(sysCommissionTransferApproveService.insertSysCommissionTransferApprove(sysCommissionTransferApprove));
    }

    /**
     * 修改佣金转出审核
     */
    @Log(title = "佣金转出审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        return toAjax(sysCommissionTransferApproveService.updateSysCommissionTransferApprove(sysCommissionTransferApprove));
    }

    /**
     * 删除佣金转出审核
     */
    @Log(title = "佣金转出审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysCommissionTransferApproveService.deleteSysCommissionTransferApproveByIds(ids));
    }

    /**
     * 同意佣金转出
     */
    @PostMapping("/agreeTransferApply")
    public AjaxResult agreeTransferApply(@RequestBody SysCommissionTransferApprove sysCommissionTransferApprove){
        SysUser actionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(sysCommissionTransferApproveService.agreeTransferApply(sysCommissionTransferApprove,actionUser));
    }


    /**
     * 拒绝佣金转出
     */
    @PostMapping("/refuseTransferApply")
    public AjaxResult refuseTransferApply(@RequestBody SysCommissionTransferApprove sysCommissionTransferApprove){
        SysUser actionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(sysCommissionTransferApproveService.refuseTransferApply(sysCommissionTransferApprove,actionUser));
    }
}
