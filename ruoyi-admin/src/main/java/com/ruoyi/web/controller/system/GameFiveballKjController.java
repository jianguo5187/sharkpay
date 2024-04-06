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
import com.ruoyi.system.domain.GameFiveballKj;
import com.ruoyi.system.service.IGameFiveballKjService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 5球开奖Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/fiveBallKj")
public class GameFiveballKjController extends BaseController
{
    @Autowired
    private IGameFiveballKjService gameFiveballKjService;

    /**
     * 查询5球开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameFiveballKj gameFiveballKj)
    {
        startPage();
        List<GameFiveballKj> list = gameFiveballKjService.selectGameFiveballKjList(gameFiveballKj);
        return getDataTable(list);
    }

    /**
     * 导出5球开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:export')")
    @Log(title = "5球开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameFiveballKj gameFiveballKj)
    {
        List<GameFiveballKj> list = gameFiveballKjService.selectGameFiveballKjList(gameFiveballKj);
        ExcelUtil<GameFiveballKj> util = new ExcelUtil<GameFiveballKj>(GameFiveballKj.class);
        util.exportExcel(response, list, "5球开奖数据");
    }

    /**
     * 获取5球开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameFiveballKjService.selectGameFiveballKjById(id));
    }

    /**
     * 新增5球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:add')")
    @Log(title = "5球开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameFiveballKj gameFiveballKj)
    {
        return toAjax(gameFiveballKjService.insertGameFiveballKj(gameFiveballKj));
    }

    /**
     * 修改5球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:edit')")
    @Log(title = "5球开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameFiveballKj gameFiveballKj)
    {
        return toAjax(gameFiveballKjService.updateGameFiveballKj(gameFiveballKj));
    }

    /**
     * 删除5球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:fiveBallKj:remove')")
    @Log(title = "5球开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameFiveballKjService.deleteGameFiveballKjByIds(ids));
    }
}
