package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.Azxy10kj;
import com.ruoyi.system.service.IAzxy10kjService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 澳洲幸运10开奖Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/azxy10kj")
public class Azxy10kjController extends BaseController
{
    @Autowired
    private IAzxy10kjService azxy10kjService;

    /**
     * 查询澳洲幸运10开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:list')")
    @GetMapping("/list")
    public TableDataInfo list(Azxy10kj azxy10kj)
    {
        startPage();
        List<Azxy10kj> list = azxy10kjService.selectAzxy10kjList(azxy10kj);
        return getDataTable(list);
    }

    /**
     * 导出澳洲幸运10开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:export')")
    @Log(title = "澳洲幸运10开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Azxy10kj azxy10kj)
    {
        List<Azxy10kj> list = azxy10kjService.selectAzxy10kjList(azxy10kj);
        ExcelUtil<Azxy10kj> util = new ExcelUtil<Azxy10kj>(Azxy10kj.class);
        util.exportExcel(response, list, "澳洲幸运10开奖数据");
    }

    /**
     * 获取澳洲幸运10开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(azxy10kjService.selectAzxy10kjById(id));
    }

    /**
     * 新增澳洲幸运10开奖
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:add')")
    @Log(title = "澳洲幸运10开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Azxy10kj azxy10kj)
    {
        return toAjax(azxy10kjService.insertAzxy10kj(azxy10kj));
    }

    /**
     * 修改澳洲幸运10开奖
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:edit')")
    @Log(title = "澳洲幸运10开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Azxy10kj azxy10kj)
    {
        return toAjax(azxy10kjService.updateAzxy10kj(azxy10kj));
    }

    /**
     * 删除澳洲幸运10开奖
     */
    @PreAuthorize("@ss.hasPermi('system:azxy10kj:remove')")
    @Log(title = "澳洲幸运10开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(azxy10kjService.deleteAzxy10kjByIds(ids));
    }
}
