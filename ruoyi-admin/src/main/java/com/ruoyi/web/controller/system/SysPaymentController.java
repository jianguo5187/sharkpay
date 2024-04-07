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
import com.ruoyi.system.domain.SysPayment;
import com.ruoyi.system.service.ISysPaymentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 支付方式Controller
 * 
 * @author ruoyi
 * @date 2024-04-07
 */
@RestController
@RequestMapping("/system/payment")
public class SysPaymentController extends BaseController
{
    @Autowired
    private ISysPaymentService sysPaymentService;

    /**
     * 查询支付方式列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysPayment sysPayment)
    {
        startPage();
        List<SysPayment> list = sysPaymentService.selectSysPaymentList(sysPayment);
        return getDataTable(list);
    }

    /**
     * 导出支付方式列表
     */
    @PreAuthorize("@ss.hasPermi('system:payment:export')")
    @Log(title = "支付方式", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPayment sysPayment)
    {
        List<SysPayment> list = sysPaymentService.selectSysPaymentList(sysPayment);
        ExcelUtil<SysPayment> util = new ExcelUtil<SysPayment>(SysPayment.class);
        util.exportExcel(response, list, "支付方式数据");
    }

    /**
     * 获取支付方式详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:payment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysPaymentService.selectSysPaymentById(id));
    }

    /**
     * 新增支付方式
     */
    @Log(title = "支付方式", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPayment sysPayment)
    {
        return toAjax(sysPaymentService.insertSysPayment(sysPayment));
    }

    /**
     * 修改支付方式
     */
    @Log(title = "支付方式", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPayment sysPayment)
    {
        return toAjax(sysPaymentService.updateSysPayment(sysPayment));
    }

    /**
     * 删除支付方式
     */
    @Log(title = "支付方式", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysPaymentService.deleteSysPaymentByIds(ids));
    }
}
