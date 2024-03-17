package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.FalseUser;
import com.ruoyi.system.service.IFalseUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投注机器人Controller
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/system/falseUser")
public class FalseUserController extends BaseController
{
    @Autowired
    private IFalseUserService falseUserService;

    /**
     * 查询投注机器人列表
     */
    @GetMapping("/list")
    public TableDataInfo list(FalseUser falseUser)
    {
        startPage();
        List<FalseUser> list = falseUserService.selectFalseUserList(falseUser);
        return getDataTable(list);
    }

    /**
     * 导出投注机器人列表
     */
    @Log(title = "投注机器人", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FalseUser falseUser)
    {
        List<FalseUser> list = falseUserService.selectFalseUserList(falseUser);
        ExcelUtil<FalseUser> util = new ExcelUtil<FalseUser>(FalseUser.class);
        util.exportExcel(response, list, "投注机器人数据");
    }

    /**
     * 获取投注机器人详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(falseUserService.selectFalseUserById(id));
    }

    /**
     * 新增投注机器人
     */
    @Log(title = "投注机器人", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FalseUser falseUser)
    {
        return toAjax(falseUserService.insertFalseUser(falseUser));
    }

    /**
     * 修改投注机器人
     */
    @Log(title = "投注机器人", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FalseUser falseUser)
    {
        return toAjax(falseUserService.updateFalseUser(falseUser));
    }

    /**
     * 删除投注机器人
     */
    @PreAuthorize("@ss.hasPermi('system:falseUser:remove')")
    @Log(title = "投注机器人", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(falseUserService.deleteFalseUserByIds(ids));
    }
}
