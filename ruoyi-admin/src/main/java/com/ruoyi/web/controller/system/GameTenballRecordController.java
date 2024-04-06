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
import com.ruoyi.system.domain.GameTenballRecord;
import com.ruoyi.system.service.IGameTenballRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 10球下注Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/tenBallRecord")
public class GameTenballRecordController extends BaseController
{
    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

    /**
     * 查询10球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameTenballRecord gameTenballRecord)
    {
        startPage();
        List<GameTenballRecord> list = gameTenballRecordService.selectGameTenballRecordList(gameTenballRecord);
        return getDataTable(list);
    }

    /**
     * 导出10球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:export')")
    @Log(title = "10球下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameTenballRecord gameTenballRecord)
    {
        List<GameTenballRecord> list = gameTenballRecordService.selectGameTenballRecordList(gameTenballRecord);
        ExcelUtil<GameTenballRecord> util = new ExcelUtil<GameTenballRecord>(GameTenballRecord.class);
        util.exportExcel(response, list, "10球下注数据");
    }

    /**
     * 获取10球下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameTenballRecordService.selectGameTenballRecordById(id));
    }

    /**
     * 新增10球下注
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:add')")
    @Log(title = "10球下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameTenballRecord gameTenballRecord)
    {
        return toAjax(gameTenballRecordService.insertGameTenballRecord(gameTenballRecord));
    }

    /**
     * 修改10球下注
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:edit')")
    @Log(title = "10球下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameTenballRecord gameTenballRecord)
    {
        return toAjax(gameTenballRecordService.updateGameTenballRecord(gameTenballRecord));
    }

    /**
     * 删除10球下注
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallRecord:remove')")
    @Log(title = "10球下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameTenballRecordService.deleteGameTenballRecordByIds(ids));
    }
}
