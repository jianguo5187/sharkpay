package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.*;
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
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.service.IUsermoneyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户资金流水Controller
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@RestController
@RequestMapping("/system/usermoney")
public class UsermoneyController extends BaseController
{
    @Autowired
    private IUsermoneyService usermoneyService;

    /**
     * 查询用户资金流水列表
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:list')")
    @GetMapping("/list")
    public TableDataInfo list(Usermoney usermoney)
    {
        startPage();
        List<Usermoney> list = usermoneyService.selectUsermoneyList(usermoney);
        return getDataTable(list);
    }

    /**
     * 导出用户资金流水列表
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:export')")
    @Log(title = "用户资金流水", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Usermoney usermoney)
    {
        List<Usermoney> list = usermoneyService.selectUsermoneyList(usermoney);
        ExcelUtil<Usermoney> util = new ExcelUtil<Usermoney>(Usermoney.class);
        util.exportExcel(response, list, "用户资金流水数据");
    }

    /**
     * 获取用户资金流水详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(usermoneyService.selectUsermoneyById(id));
    }

    /**
     * 新增用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:add')")
    @Log(title = "用户资金流水", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Usermoney usermoney)
    {
        return toAjax(usermoneyService.insertUsermoney(usermoney));
    }

    /**
     * 修改用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:edit')")
    @Log(title = "用户资金流水", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Usermoney usermoney)
    {
        return toAjax(usermoneyService.updateUsermoney(usermoney));
    }

    /**
     * 删除用户资金流水
     */
    @PreAuthorize("@ss.hasPermi('system:usermoney:remove')")
    @Log(title = "用户资金流水", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(usermoneyService.deleteUsermoneyByIds(ids));
    }

    /**
     * 查询用户资金流水列表
     */
    @GetMapping("/listPostal")
    public TableDataInfo listPostal(PostalListReqVO vo)
    {
        startPage();
        List<PostalListRespVO> list = usermoneyService.selectPostalList(vo);
        return getDataTable(list);
    }

    /**
     * 同意提现申请
     */
    @PostMapping("/agreePostalApply")
    public AjaxResult agreePostalApply(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.agreePostalApply(usermoney,sessionUser.getUserId()));
    }

    /**
     * 拒绝提现申请
     */
    @PostMapping("/refusePostalApply")
    public AjaxResult refusePostalApply(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.refusePostalApply(usermoney,sessionUser.getUserId()));
    }

    /**
     * 充值列表
     */
    @GetMapping("/listRecharge")
    public TableDataInfo listRecharge(RechargeListReqVO vo)
    {
        startPage();
        List<RechargeListRespVO> list = usermoneyService.selectRechargeList(vo);
        return getDataTable(list);
    }

    /**
     * 同意充值申请
     */
    @PostMapping("/agreeRechargeApply")
    public AjaxResult agreeRechargeApply(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.agreeRechargeApply(usermoney,sessionUser.getUserId()));
    }

    /**
     * 拒绝充值申请
     */
    @PostMapping("/refuseRechargeApply")
    public AjaxResult refuseRechargeApply(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.refuseRechargeApply(usermoney,sessionUser.getUserId()));
    }

    /**
     * 管理员上分
     */
    @PostMapping("/adminRecharge")
    public AjaxResult adminRecharge(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.adminRecharge(usermoney,sessionUser.getUserId()));
    }

    /**
     * 管理员下分
     */
    @PostMapping("/adminPostal")
    public AjaxResult adminPostal(@RequestBody Usermoney usermoney)
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        return toAjax(usermoneyService.adminPostal(usermoney,sessionUser.getUserId()));
    }

    @GetMapping("/listUserMoneyUpTotal")
    public TableDataInfo listUserMoneyUpTotal(Usermoney usermoney)
    {
        startPage();
        List<UserMoneyUpTotalListRespVO> list = usermoneyService.selectUserMoneyUpTotalList(usermoney);
        return getDataTable(list);
    }

    @GetMapping("/listUserMoneyDownTotal")
    public TableDataInfo listUserMoneyDownTotal(Usermoney usermoney)
    {
        startPage();
        List<UserMoneyDownTotalListRespVO> list = usermoneyService.selectUserMoneyDownTotalList(usermoney);
        return getDataTable(list);
    }

    @GetMapping("/listCommissionList")
    public TableDataInfo listCommissionList(Usermoney usermoney)
    {
        startPage();
        List<CommissionListRespVO> list =usermoneyService.selectCommissionList(usermoney);
        return getDataTable(list);
    }

    /**
     * 获取未承认的充值（上分）件数
     */
    @GetMapping("/getNoApproveRechargeCnt")
    public AjaxResult getNoApproveRechargeCnt()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("upCount",usermoneyService.getNoApproveRechargeCnt());
        return ajax;
    }

    /**
     * 获取未承认的提现（下分）件数
     */
    @GetMapping("/getNoApprovePostalCnt")
    public AjaxResult getNoApprovePostalCnt()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("downCount",usermoneyService.getNoApprovePostalCnt());
        return ajax;
    }

    @GetMapping("/listUserFlowMoney")
    public TableDataInfo listUserFlowMoney(Usermoney usermoney)
    {
        startPage();
        List<UserMoneyDetailListRespVO> list =usermoneyService.selectUserMoneyDetailList(usermoney);
        return getDataTable(list);
    }

    /**
     * 更新金额
     */
    @PostMapping("/updateUpDownAmount")
    public AjaxResult updateUpDownAmount(@RequestBody Usermoney usermoney)
    {
        return toAjax(usermoneyService.updateUsermoney(usermoney));
    }

    /**
     * 获取未承认的上下分件数
     */
    @GetMapping("/noApproveUpAndDownCnt")
    public AjaxResult noApproveUpAndDownCnt()
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("upCount",usermoneyService.getNoApproveRechargeCnt());
        ajax.put("downCount",usermoneyService.getNoApprovePostalCnt());
        return ajax;
    }
}
