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
import com.ruoyi.system.domain.Azxy10record;
import com.ruoyi.system.service.IAzxy10recordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 澳洲幸运10下注Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/azxy10record")
public class Azxy10recordController extends BaseController
{
    @Autowired
    private IAzxy10recordService azxy10recordService;

    /**
     * 查询澳洲幸运10下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:list')")
    @GetMapping("/list")
    public TableDataInfo list(Azxy10record azxy10record)
    {
        startPage();
        List<Azxy10record> list = azxy10recordService.selectAzxy10recordList(azxy10record);
        return getDataTable(list);
    }

    /**
     * 导出澳洲幸运10下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:export')")
    @Log(title = "澳洲幸运10下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Azxy10record azxy10record)
    {
        List<Azxy10record> list = azxy10recordService.selectAzxy10recordList(azxy10record);
        ExcelUtil<Azxy10record> util = new ExcelUtil<Azxy10record>(Azxy10record.class);
        util.exportExcel(response, list, "澳洲幸运10下注数据");
    }

    /**
     * 获取澳洲幸运10下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(azxy10recordService.selectAzxy10recordById(id));
    }

    /**
     * 新增澳洲幸运10下注
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:add')")
    @Log(title = "澳洲幸运10下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Azxy10record azxy10record)
    {
        return toAjax(azxy10recordService.insertAzxy10record(azxy10record));
    }

    /**
     * 修改澳洲幸运10下注
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:edit')")
    @Log(title = "澳洲幸运10下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Azxy10record azxy10record)
    {
        return toAjax(azxy10recordService.updateAzxy10record(azxy10record));
    }

    /**
     * 删除澳洲幸运10下注
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10record:remove')")
    @Log(title = "澳洲幸运10下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(azxy10recordService.deleteAzxy10recordByIds(ids));
    }
}
