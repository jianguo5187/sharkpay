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
import com.ruoyi.system.domain.Jsssc;
import com.ruoyi.system.service.IJssscService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 极速时时彩开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/jsssc")
public class JssscController extends BaseController
{
    @Autowired
    private IJssscService jssscService;

    /**
     * 查询极速时时彩开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jsssc jsssc)
    {
        startPage();
        List<Jsssc> list = jssscService.selectJssscList(jsssc);
        return getDataTable(list);
    }

    /**
     * 导出极速时时彩开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:export')")
    @Log(title = "极速时时彩开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jsssc jsssc)
    {
        List<Jsssc> list = jssscService.selectJssscList(jsssc);
        ExcelUtil<Jsssc> util = new ExcelUtil<Jsssc>(Jsssc.class);
        util.exportExcel(response, list, "极速时时彩开奖历史数据");
    }

    /**
     * 获取极速时时彩开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jssscService.selectJssscById(id));
    }

    /**
     * 新增极速时时彩开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:add')")
    @Log(title = "极速时时彩开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jsssc jsssc)
    {
        return toAjax(jssscService.insertJsssc(jsssc));
    }

    /**
     * 修改极速时时彩开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:edit')")
    @Log(title = "极速时时彩开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jsssc jsssc)
    {
        return toAjax(jssscService.updateJsssc(jsssc));
    }

    /**
     * 删除极速时时彩开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:jsssc:remove')")
    @Log(title = "极速时时彩开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jssscService.deleteJssscByIds(ids));
    }
}
