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
import com.ruoyi.system.domain.GameAutoBetRecord;
import com.ruoyi.system.service.IGameAutoBetRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 追号Controller
 * 
 * @author ruoyi
 * @date 2024-11-11
 */
@RestController
@RequestMapping("/system/autoBetRecord")
public class GameAutoBetRecordController extends BaseController
{
    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    /**
     * 查询追号列表
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameAutoBetRecord gameAutoBetRecord)
    {
        startPage();
        List<GameAutoBetRecord> list = gameAutoBetRecordService.selectGameAutoBetRecordList(gameAutoBetRecord);
        return getDataTable(list);
    }

    /**
     * 导出追号列表
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:export')")
    @Log(title = "追号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameAutoBetRecord gameAutoBetRecord)
    {
        List<GameAutoBetRecord> list = gameAutoBetRecordService.selectGameAutoBetRecordList(gameAutoBetRecord);
        ExcelUtil<GameAutoBetRecord> util = new ExcelUtil<GameAutoBetRecord>(GameAutoBetRecord.class);
        util.exportExcel(response, list, "追号数据");
    }

    /**
     * 获取追号详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameAutoBetRecordService.selectGameAutoBetRecordById(id));
    }

    /**
     * 新增追号
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:add')")
    @Log(title = "追号", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameAutoBetRecord gameAutoBetRecord)
    {
        return toAjax(gameAutoBetRecordService.insertGameAutoBetRecord(gameAutoBetRecord));
    }

    /**
     * 修改追号
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:edit')")
    @Log(title = "追号", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameAutoBetRecord gameAutoBetRecord)
    {
        return toAjax(gameAutoBetRecordService.updateGameAutoBetRecord(gameAutoBetRecord));
    }

    /**
     * 删除追号
     */
    @PreAuthorize("@ss.hasPermi('system:autoBetRecord:remove')")
    @Log(title = "追号", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameAutoBetRecordService.deleteGameAutoBetRecordByIds(ids));
    }
}
