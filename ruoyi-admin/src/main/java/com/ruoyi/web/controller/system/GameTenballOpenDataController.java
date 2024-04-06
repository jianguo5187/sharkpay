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
import com.ruoyi.system.domain.GameTenballOpenData;
import com.ruoyi.system.service.IGameTenballOpenDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 10球开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/tenBallData")
public class GameTenballOpenDataController extends BaseController
{
    @Autowired
    private IGameTenballOpenDataService gameTenballOpenDataService;

    /**
     * 查询10球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameTenballOpenData gameTenballOpenData)
    {
        startPage();
        List<GameTenballOpenData> list = gameTenballOpenDataService.selectGameTenballOpenDataList(gameTenballOpenData);
        return getDataTable(list);
    }

    /**
     * 导出10球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:export')")
    @Log(title = "10球开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameTenballOpenData gameTenballOpenData)
    {
        List<GameTenballOpenData> list = gameTenballOpenDataService.selectGameTenballOpenDataList(gameTenballOpenData);
        ExcelUtil<GameTenballOpenData> util = new ExcelUtil<GameTenballOpenData>(GameTenballOpenData.class);
        util.exportExcel(response, list, "10球开奖历史数据");
    }

    /**
     * 获取10球开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameTenballOpenDataService.selectGameTenballOpenDataById(id));
    }

    /**
     * 新增10球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:add')")
    @Log(title = "10球开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameTenballOpenData gameTenballOpenData)
    {
        return toAjax(gameTenballOpenDataService.insertGameTenballOpenData(gameTenballOpenData));
    }

    /**
     * 修改10球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:edit')")
    @Log(title = "10球开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameTenballOpenData gameTenballOpenData)
    {
        return toAjax(gameTenballOpenDataService.updateGameTenballOpenData(gameTenballOpenData));
    }

    /**
     * 删除10球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallData:remove')")
    @Log(title = "10球开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameTenballOpenDataService.deleteGameTenballOpenDataByIds(ids));
    }
}
