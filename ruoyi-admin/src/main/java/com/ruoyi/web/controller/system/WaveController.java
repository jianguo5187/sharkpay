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
import com.ruoyi.system.domain.Wave;
import com.ruoyi.system.service.IWaveService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 数字红绿蓝属性Controller
 * 
 * @author ruoyi
 * @date 2024-03-27
 */
@RestController
@RequestMapping("/system/wave")
public class WaveController extends BaseController
{
    @Autowired
    private IWaveService waveService;

    /**
     * 查询数字红绿蓝属性列表
     */
    @PreAuthorize("@ss.hasPermi('system:wave:list')")
    @GetMapping("/list")
    public TableDataInfo list(Wave wave)
    {
        startPage();
        List<Wave> list = waveService.selectWaveList(wave);
        return getDataTable(list);
    }

    /**
     * 导出数字红绿蓝属性列表
     */
    @PreAuthorize("@ss.hasPermi('system:wave:export')")
    @Log(title = "数字红绿蓝属性", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Wave wave)
    {
        List<Wave> list = waveService.selectWaveList(wave);
        ExcelUtil<Wave> util = new ExcelUtil<Wave>(Wave.class);
        util.exportExcel(response, list, "数字红绿蓝属性数据");
    }

    /**
     * 获取数字红绿蓝属性详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:wave:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(waveService.selectWaveById(id));
    }

    /**
     * 新增数字红绿蓝属性
     */
    @PreAuthorize("@ss.hasPermi('system:wave:add')")
    @Log(title = "数字红绿蓝属性", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Wave wave)
    {
        return toAjax(waveService.insertWave(wave));
    }

    /**
     * 修改数字红绿蓝属性
     */
    @PreAuthorize("@ss.hasPermi('system:wave:edit')")
    @Log(title = "数字红绿蓝属性", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Wave wave)
    {
        return toAjax(waveService.updateWave(wave));
    }

    /**
     * 删除数字红绿蓝属性
     */
    @PreAuthorize("@ss.hasPermi('system:wave:remove')")
    @Log(title = "数字红绿蓝属性", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(waveService.deleteWaveByIds(ids));
    }
}
