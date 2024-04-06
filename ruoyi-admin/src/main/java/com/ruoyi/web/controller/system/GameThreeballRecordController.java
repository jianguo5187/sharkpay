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
import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.service.IGameThreeballRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 3球下注Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/threeBallRecord")
public class GameThreeballRecordController extends BaseController
{
    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    /**
     * 查询3球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameThreeballRecord gameThreeballRecord)
    {
        startPage();
        List<GameThreeballRecord> list = gameThreeballRecordService.selectGameThreeballRecordList(gameThreeballRecord);
        return getDataTable(list);
    }

    /**
     * 导出3球下注列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:export')")
    @Log(title = "3球下注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameThreeballRecord gameThreeballRecord)
    {
        List<GameThreeballRecord> list = gameThreeballRecordService.selectGameThreeballRecordList(gameThreeballRecord);
        ExcelUtil<GameThreeballRecord> util = new ExcelUtil<GameThreeballRecord>(GameThreeballRecord.class);
        util.exportExcel(response, list, "3球下注数据");
    }

    /**
     * 获取3球下注详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameThreeballRecordService.selectGameThreeballRecordById(id));
    }

    /**
     * 新增3球下注
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:add')")
    @Log(title = "3球下注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameThreeballRecord gameThreeballRecord)
    {
        return toAjax(gameThreeballRecordService.insertGameThreeballRecord(gameThreeballRecord));
    }

    /**
     * 修改3球下注
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:edit')")
    @Log(title = "3球下注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameThreeballRecord gameThreeballRecord)
    {
        return toAjax(gameThreeballRecordService.updateGameThreeballRecord(gameThreeballRecord));
    }

    /**
     * 删除3球下注
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallRecord:remove')")
    @Log(title = "3球下注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameThreeballRecordService.deleteGameThreeballRecordByIds(ids));
    }
}
