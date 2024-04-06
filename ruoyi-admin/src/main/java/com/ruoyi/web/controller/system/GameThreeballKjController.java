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
import com.ruoyi.system.domain.GameThreeballKj;
import com.ruoyi.system.service.IGameThreeballKjService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 3球开奖Controller
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@RestController
@RequestMapping("/system/threeBallKj")
public class GameThreeballKjController extends BaseController
{
    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    /**
     * 查询3球开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:list')")
    @GetMapping("/list")
    public TableDataInfo list(GameThreeballKj gameThreeballKj)
    {
        startPage();
        List<GameThreeballKj> list = gameThreeballKjService.selectGameThreeballKjList(gameThreeballKj);
        return getDataTable(list);
    }

    /**
     * 导出3球开奖列表
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:export')")
    @Log(title = "3球开奖", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GameThreeballKj gameThreeballKj)
    {
        List<GameThreeballKj> list = gameThreeballKjService.selectGameThreeballKjList(gameThreeballKj);
        ExcelUtil<GameThreeballKj> util = new ExcelUtil<GameThreeballKj>(GameThreeballKj.class);
        util.exportExcel(response, list, "3球开奖数据");
    }

    /**
     * 获取3球开奖详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gameThreeballKjService.selectGameThreeballKjById(id));
    }

    /**
     * 新增3球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:add')")
    @Log(title = "3球开奖", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GameThreeballKj gameThreeballKj)
    {
        return toAjax(gameThreeballKjService.insertGameThreeballKj(gameThreeballKj));
    }

    /**
     * 修改3球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:edit')")
    @Log(title = "3球开奖", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GameThreeballKj gameThreeballKj)
    {
        return toAjax(gameThreeballKjService.updateGameThreeballKj(gameThreeballKj));
    }

    /**
     * 删除3球开奖
     */
    @PreAuthorize("@ss.hasPermi('system:threeBallKj:remove')")
    @Log(title = "3球开奖", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gameThreeballKjService.deleteGameThreeballKjByIds(ids));
    }
}
