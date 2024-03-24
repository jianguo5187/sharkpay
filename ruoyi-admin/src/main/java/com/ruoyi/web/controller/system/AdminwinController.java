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
import com.ruoyi.system.domain.Adminwin;
import com.ruoyi.system.service.IAdminwinService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 管理员盈亏Controller
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@RestController
@RequestMapping("/system/adminwin")
public class AdminwinController extends BaseController
{
    @Autowired
    private IAdminwinService adminwinService;

    /**
     * 查询管理员盈亏列表
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:list')")
    @GetMapping("/list")
    public TableDataInfo list(Adminwin adminwin)
    {
        startPage();
        List<Adminwin> list = adminwinService.selectAdminwinList(adminwin);
        return getDataTable(list);
    }

    /**
     * 导出管理员盈亏列表
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:export')")
    @Log(title = "管理员盈亏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Adminwin adminwin)
    {
        List<Adminwin> list = adminwinService.selectAdminwinList(adminwin);
        ExcelUtil<Adminwin> util = new ExcelUtil<Adminwin>(Adminwin.class);
        util.exportExcel(response, list, "管理员盈亏数据");
    }

    /**
     * 获取管理员盈亏详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(adminwinService.selectAdminwinById(id));
    }

    /**
     * 新增管理员盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:add')")
    @Log(title = "管理员盈亏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Adminwin adminwin)
    {
        return toAjax(adminwinService.insertAdminwin(adminwin));
    }

    /**
     * 修改管理员盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:edit')")
    @Log(title = "管理员盈亏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Adminwin adminwin)
    {
        return toAjax(adminwinService.updateAdminwin(adminwin));
    }

    /**
     * 删除管理员盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:adminwin:remove')")
    @Log(title = "管理员盈亏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(adminwinService.deleteAdminwinByIds(ids));
    }
}
