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
import com.ruoyi.system.domain.GameTenballKj;
import com.ruoyi.system.service.IGameTenballKjService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 10球开奖开奖Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/tenBallKj")
public class GameTenballKjController extends BaseController
{
    @Autowired
    private IGameTenballKjService gameTenballKjService;

    /**
     * 查询10球开奖开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameTenballKj gameTenballKj)
    {
        startPage();
        List<GameTenballKj> list = gameTenballKjService.selectGameTenballKjList(gameTenballKj);
        return getDataTable(list);
    }

    /**
     * 导出10球开奖开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:export')")
    @Log(title = "10球开奖开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameTenballKj gameTenballKj)
    {
        List<GameTenballKj> list = gameTenballKjService.selectGameTenballKjList(gameTenballKj);
        ExcelUtil<GameTenballKj> util = new ExcelUtil<GameTenballKj>(GameTenballKj.class);
        util.exportExcel(response, list, "10球开奖开奖数据");
    }

    /**
     * 获取10球开奖开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameTenballKjService.selectGameTenballKjById(id));
    }

    /**
     * 新增10球开奖开奖
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:add')")
    @Log(title = "10球开奖开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameTenballKj gameTenballKj)
    {
        return toAjax(gameTenballKjService.insertGameTenballKj(gameTenballKj));
    }

    /**
     * 修改10球开奖开奖
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:edit')")
    @Log(title = "10球开奖开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameTenballKj gameTenballKj)
    {
        return toAjax(gameTenballKjService.updateGameTenballKj(gameTenballKj));
    }

    /**
     * 删除10球开奖开奖
     */
    @PreAuthorize("@ss.hasPermi('system:tenBallKj:remove')")
    @Log(title = "10球开奖开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameTenballKjService.deleteGameTenballKjByIds(ids));
    }
}
