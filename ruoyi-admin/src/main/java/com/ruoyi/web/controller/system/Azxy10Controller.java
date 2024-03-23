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
import com.ruoyi.system.domain.Azxy10;
import com.ruoyi.system.service.IAzxy10Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 澳洲幸运10开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/azxy10")
public class Azxy10Controller extends BaseController
{
    @Autowired
    private IAzxy10Service azxy10Service;

    /**
     * 查询澳洲幸运10开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:list')")
    @GetMapping("/list")
    public TableDataInfo list(Azxy10 azxy10)
    {
        startPage();
        List<Azxy10> list = azxy10Service.selectAzxy10List(azxy10);
        return getDataTable(list);
    }

    /**
     * 导出澳洲幸运10开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:export')")
    @Log(title = "澳洲幸运10开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Azxy10 azxy10)
    {
        List<Azxy10> list = azxy10Service.selectAzxy10List(azxy10);
        ExcelUtil<Azxy10> util = new ExcelUtil<Azxy10>(Azxy10.class);
        util.exportExcel(response, list, "澳洲幸运10开奖历史数据");
    }

    /**
     * 获取澳洲幸运10开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(azxy10Service.selectAzxy10ById(id));
    }

    /**
     * 新增澳洲幸运10开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:add')")
    @Log(title = "澳洲幸运10开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Azxy10 azxy10)
    {
        return toAjax(azxy10Service.insertAzxy10(azxy10));
    }

    /**
     * 修改澳洲幸运10开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:edit')")
    @Log(title = "澳洲幸运10开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Azxy10 azxy10)
    {
        return toAjax(azxy10Service.updateAzxy10(azxy10));
    }

    /**
     * 删除澳洲幸运10开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10:remove')")
    @Log(title = "澳洲幸运10开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(azxy10Service.deleteAzxy10ByIds(ids));
    }
}
