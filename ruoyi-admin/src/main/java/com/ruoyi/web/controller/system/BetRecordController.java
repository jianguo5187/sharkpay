package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.BetRealTimeReqVO;
import com.ruoyi.system.domain.vo.BetRealTimeRespVO;
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
import com.ruoyi.system.domain.BetRecord;
import com.ruoyi.system.service.IBetRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投注单Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/betRecord")
public class BetRecordController extends BaseController
{
    @Autowired
    private IBetRecordService betRecordService;

    /**
     * 查询投注单列表
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(BetRecord betRecord)
    {
        startPage();
        List<BetRecord> list = betRecordService.selectBetRecordList(betRecord);
        return getDataTable(list);
    }

    /**
     * 导出投注单列表
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:export')")
    @Log(title = "投注单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BetRecord betRecord)
    {
        List<BetRecord> list = betRecordService.selectBetRecordList(betRecord);
        ExcelUtil<BetRecord> util = new ExcelUtil<BetRecord>(BetRecord.class);
        util.exportExcel(response, list, "投注单数据");
    }

    /**
     * 获取投注单详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:query')")
    @GetMapping(value = "/{betId}")
    public AjaxResult getInfo(@PathVariable("betId") Long betId)
    {
        return success(betRecordService.selectBetRecordByBetId(betId));
    }

    /**
     * 新增投注单
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:add')")
    @Log(title = "投注单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BetRecord betRecord)
    {
        return toAjax(betRecordService.insertBetRecord(betRecord));
    }

    /**
     * 修改投注单
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:edit')")
    @Log(title = "投注单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BetRecord betRecord)
    {
        return toAjax(betRecordService.updateBetRecord(betRecord));
    }

    /**
     * 删除投注单
     */
    @PreAuthorize("@ss.hasPermi('system:betRecord:remove')")
    @Log(title = "投注单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{betIds}")
    public AjaxResult remove(@PathVariable Long[] betIds)
    {
        return toAjax(betRecordService.deleteBetRecordByBetIds(betIds));
    }

    /**
     * 查询实时投注列表
     */
    @GetMapping("/listBetRealTime")
    public TableDataInfo listBetRealTime(BetRealTimeReqVO vo)
    {
        startPage();
        List<BetRealTimeRespVO> list = betRecordService.selectBetRealTimeList(vo);
        return getDataTable(list);
    }

    /**
     * 管理员撤单投注单
     */
    @DeleteMapping("/adminCancel/{betId}")
    public AjaxResult adminCancelBetRecord(@PathVariable Long betId)
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        betRecordService.adminCancelBetRecord(sessionUser.getUserId(),betId);
        return ajax;
    }
}
