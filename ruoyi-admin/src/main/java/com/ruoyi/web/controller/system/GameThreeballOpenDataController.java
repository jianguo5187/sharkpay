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
import com.ruoyi.system.domain.GameThreeballOpenData;
import com.ruoyi.system.service.IGameThreeballOpenDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 3球开奖历史Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/threeBallData")
public class GameThreeballOpenDataController extends BaseController
{
    @Autowired
    private IGameThreeballOpenDataService gameThreeballOpenDataService;

    /**
     * 查询3球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameThreeballOpenData gameThreeballOpenData)
    {
        startPage();
        List<GameThreeballOpenData> list = gameThreeballOpenDataService.selectGameThreeballOpenDataList(gameThreeballOpenData);
        return getDataTable(list);
    }

    /**
     * 导出3球开奖历史列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:export')")
    @Log(title = "3球开奖历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameThreeballOpenData gameThreeballOpenData)
    {
        List<GameThreeballOpenData> list = gameThreeballOpenDataService.selectGameThreeballOpenDataList(gameThreeballOpenData);
        ExcelUtil<GameThreeballOpenData> util = new ExcelUtil<GameThreeballOpenData>(GameThreeballOpenData.class);
        util.exportExcel(response, list, "3球开奖历史数据");
    }

    /**
     * 获取3球开奖历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameThreeballOpenDataService.selectGameThreeballOpenDataById(id));
    }

    /**
     * 新增3球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:add')")
    @Log(title = "3球开奖历史", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameThreeballOpenData gameThreeballOpenData)
    {
        return toAjax(gameThreeballOpenDataService.insertGameThreeballOpenData(gameThreeballOpenData));
    }

    /**
     * 修改3球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:edit')")
    @Log(title = "3球开奖历史", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameThreeballOpenData gameThreeballOpenData)
    {
        return toAjax(gameThreeballOpenDataService.updateGameThreeballOpenData(gameThreeballOpenData));
    }

    /**
     * 删除3球开奖历史
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallData:remove')")
    @Log(title = "3球开奖历史", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameThreeballOpenDataService.deleteGameThreeballOpenDataByIds(ids));
    }
}
