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
import com.ruoyi.system.domain.SysBetType;
import com.ruoyi.system.service.ISysBetTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游戏玩法Controller
 * 
 * @author ruoyi
 * @date 2024-03-10
 */
@RestController
@RequestMapping("/system/betType")
public class SysBetTypeController extends BaseController
{
    @Autowired
    private ISysBetTypeService sysBetTypeService;

    /**
     * 查询游戏玩法列表
     */
    @PreAuthorize("@ss.hasPermi('system:betType:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysBetType sysBetType)
    {
        startPage();
        List<SysBetType> list = sysBetTypeService.selectSysBetTypeList(sysBetType);
        return getDataTable(list);
    }

    /**
     * 导出游戏玩法列表
     */
    @PreAuthorize("@ss.hasPermi('system:betType:export')")
    @Log(title = "游戏玩法", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysBetType sysBetType)
    {
        List<SysBetType> list = sysBetTypeService.selectSysBetTypeList(sysBetType);
        ExcelUtil<SysBetType> util = new ExcelUtil<SysBetType>(SysBetType.class);
        util.exportExcel(response, list, "游戏玩法数据");
    }

    /**
     * 获取游戏玩法详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:betType:query')")
    @GetMapping(value = "/{betTypeId}")
    public AjaxResult getInfo(@PathVariable("betTypeId") Long betTypeId)
    {
        return success(sysBetTypeService.selectSysBetTypeByBetTypeId(betTypeId));
    }

    /**
     * 新增游戏玩法
     */
    @PreAuthorize("@ss.hasPermi('system:betType:add')")
    @Log(title = "游戏玩法", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysBetType sysBetType)
    {
        return toAjax(sysBetTypeService.insertSysBetType(sysBetType));
    }

    /**
     * 修改游戏玩法
     */
    @PreAuthorize("@ss.hasPermi('system:betType:edit')")
    @Log(title = "游戏玩法", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysBetType sysBetType)
    {
        return toAjax(sysBetTypeService.updateSysBetType(sysBetType));
    }

    /**
     * 删除游戏玩法
     */
    @PreAuthorize("@ss.hasPermi('system:betType:remove')")
    @Log(title = "游戏玩法", businessType = BusinessType.DELETE)
	@DeleteMapping("/{betTypeIds}")
    public AjaxResult remove(@PathVariable Long[] betTypeIds)
    {
        return toAjax(sysBetTypeService.deleteSysBetTypeByBetTypeIds(betTypeIds));
    }

    /**
     * 获取游戏玩法列表
     *
     * @return 游戏玩法信息
     */
    @PostMapping("getValidBetType")
    public AjaxResult getValidBetType(@RequestBody SysBetType sysBetType)
    {
        AjaxResult ajax = AjaxResult.success();
        SysBetType betType = new SysBetType();
        betType.setStatus("0"); //有效
        betType.setGameId(sysBetType.getGameId());

        ajax.put("betTypeList", sysBetTypeService.selectSysBetTypeList(betType));
        return ajax;
    }
}
