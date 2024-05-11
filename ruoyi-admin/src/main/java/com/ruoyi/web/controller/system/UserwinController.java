package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.UserTotalRankListRespVO;
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
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.service.IUserwinService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户盈亏Controller
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@RestController
@RequestMapping("/system/userwin")
public class UserwinController extends BaseController
{
    @Autowired
    private IUserwinService userwinService;

    /**
     * 查询用户盈亏列表
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:list')")
    @GetMapping("/list")
    public TableDataInfo list(Userwin userwin)
    {
        startPage();
        List<Userwin> list = userwinService.selectUserwinList(userwin);
        return getDataTable(list);
    }

    /**
     * 导出用户盈亏列表
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:export')")
    @Log(title = "用户盈亏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Userwin userwin)
    {
        List<Userwin> list = userwinService.selectUserwinList(userwin);
        ExcelUtil<Userwin> util = new ExcelUtil<Userwin>(Userwin.class);
        util.exportExcel(response, list, "用户盈亏数据");
    }

    /**
     * 获取用户盈亏详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userwinService.selectUserwinById(id));
    }

    /**
     * 新增用户盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:add')")
    @Log(title = "用户盈亏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Userwin userwin)
    {
        return toAjax(userwinService.insertUserwin(userwin));
    }

    /**
     * 修改用户盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:edit')")
    @Log(title = "用户盈亏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Userwin userwin)
    {
        return toAjax(userwinService.updateUserwin(userwin));
    }

    /**
     * 删除用户盈亏
     */
    @PreAuthorize("@ss.hasPermi('system:userwin:remove')")
    @Log(title = "用户盈亏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userwinService.deleteUserwinByIds(ids));
    }



    @GetMapping("/listUserTotalRank")
    public TableDataInfo listUserTotalRank(Userwin userwin)
    {
        startPage();
        List<UserTotalRankListRespVO> list = userwinService.selectUserTotalRankList(userwin);
        return getDataTable(list);
    }
}
