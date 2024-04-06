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
import com.ruoyi.system.domain.GameFiveballOpenData;
import com.ruoyi.system.service.IGameFiveballOpenDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 5球开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/fiveBallData")
public class GameFiveballOpenDataController extends BaseController
{
    @Autowired
    private IGameFiveballOpenDataService gameFiveballOpenDataService;

    /**
     * 查询5球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameFiveballOpenData gameFiveballOpenData)
    {
        startPage();
        List<GameFiveballOpenData> list = gameFiveballOpenDataService.selectGameFiveballOpenDataList(gameFiveballOpenData);
        return getDataTable(list);
    }

    /**
     * 导出5球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:export')")
    @Log(title = "5球开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameFiveballOpenData gameFiveballOpenData)
    {
        List<GameFiveballOpenData> list = gameFiveballOpenDataService.selectGameFiveballOpenDataList(gameFiveballOpenData);
        ExcelUtil<GameFiveballOpenData> util = new ExcelUtil<GameFiveballOpenData>(GameFiveballOpenData.class);
        util.exportExcel(response, list, "5球开奖历史数据");
    }

    /**
     * 获取5球开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameFiveballOpenDataService.selectGameFiveballOpenDataById(id));
    }

    /**
     * 新增5球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:add')")
    @Log(title = "5球开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameFiveballOpenData gameFiveballOpenData)
    {
        return toAjax(gameFiveballOpenDataService.insertGameFiveballOpenData(gameFiveballOpenData));
    }

    /**
     * 修改5球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:edit')")
    @Log(title = "5球开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameFiveballOpenData gameFiveballOpenData)
    {
        return toAjax(gameFiveballOpenDataService.updateGameFiveballOpenData(gameFiveballOpenData));
    }

    /**
     * 删除5球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallData:remove')")
    @Log(title = "5球开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameFiveballOpenDataService.deleteGameFiveballOpenDataByIds(ids));
    }
}
