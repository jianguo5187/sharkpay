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
import com.ruoyi.system.domain.GameFiveballRecord;
import com.ruoyi.system.service.IGameFiveballRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 5球下注Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/fiveBallRecord")
public class GameFiveballRecordController extends BaseController
{
    @Autowired
    private IGameFiveballRecordService gameFiveballRecordService;

    /**
     * 查询5球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameFiveballRecord gameFiveballRecord)
    {
        startPage();
        List<GameFiveballRecord> list = gameFiveballRecordService.selectGameFiveballRecordList(gameFiveballRecord);
        return getDataTable(list);
    }

    /**
     * 导出5球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:export')")
    @Log(title = "5球下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameFiveballRecord gameFiveballRecord)
    {
        List<GameFiveballRecord> list = gameFiveballRecordService.selectGameFiveballRecordList(gameFiveballRecord);
        ExcelUtil<GameFiveballRecord> util = new ExcelUtil<GameFiveballRecord>(GameFiveballRecord.class);
        util.exportExcel(response, list, "5球下注数据");
    }

    /**
     * 获取5球下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameFiveballRecordService.selectGameFiveballRecordById(id));
    }

    /**
     * 新增5球下注
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:add')")
    @Log(title = "5球下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameFiveballRecord gameFiveballRecord)
    {
        return toAjax(gameFiveballRecordService.insertGameFiveballRecord(gameFiveballRecord));
    }

    /**
     * 修改5球下注
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:edit')")
    @Log(title = "5球下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameFiveballRecord gameFiveballRecord)
    {
        return toAjax(gameFiveballRecordService.updateGameFiveballRecord(gameFiveballRecord));
    }

    /**
     * 删除5球下注
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallRecord:remove')")
    @Log(title = "5球下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameFiveballRecordService.deleteGameFiveballRecordByIds(ids));
    }
}
