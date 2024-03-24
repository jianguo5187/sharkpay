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
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.service.IUsermoneyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户资金流水Controller
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@RestController
@RequestMapping("/system/usermoney")
public class UsermoneyController extends BaseController
{
    @Autowired
    private IUsermoneyService usermoneyService;

    /**
     * 查询用户资金流水列表
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:list')")
    @GetMapping("/list")
    public TableDataInfo list(Usermoney usermoney)
    {
        startPage();
        List<Usermoney> list = usermoneyService.selectUsermoneyList(usermoney);
        return getDataTable(list);
    }

    /**
     * 导出用户资金流水列表
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:export')")
    @Log(title = "用户资金流水", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Usermoney usermoney)
    {
        List<Usermoney> list = usermoneyService.selectUsermoneyList(usermoney);
        ExcelUtil<Usermoney> util = new ExcelUtil<Usermoney>(Usermoney.class);
        util.exportExcel(response, list, "用户资金流水数据");
    }

    /**
     * 获取用户资金流水详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(usermoneyService.selectUsermoneyById(id));
    }

    /**
     * 新增用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:add')")
    @Log(title = "用户资金流水", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Usermoney usermoney)
    {
        return toAjax(usermoneyService.insertUsermoney(usermoney));
    }

    /**
     * 修改用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:edit')")
    @Log(title = "用户资金流水", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Usermoney usermoney)
    {
        return toAjax(usermoneyService.updateUsermoney(usermoney));
    }

    /**
     * 删除用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:remove')")
    @Log(title = "用户资金流水", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(usermoneyService.deleteUsermoneyByIds(ids));
    }
}
