package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.system.domain.RobotBetOption;
import com.ruoyi.system.service.IRobotBetOptionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投注话术Controller
 * 
 * @author ruoyi
 * @date 2024-12-02
 */
@RestController
@RequestMapping("/system/robotBetOption")
public class RobotBetOptionController extends BaseController
{
    @Autowired
    private IRobotBetOptionService robotBetOptionService;

    /**
     * 查询投注话术列表
     */
    @GetMapping("/list")
    public TableDataInfo list(RobotBetOption robotBetOption)
    {
        startPage();
        List<RobotBetOption> list = robotBetOptionService.selectRobotBetOptionList(robotBetOption);
        return getDataTable(list);
    }

    /**
     * 导出投注话术列表
     */
    @Log(title = "投注话术", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RobotBetOption robotBetOption)
    {
        List<RobotBetOption> list = robotBetOptionService.selectRobotBetOptionList(robotBetOption);
        ExcelUtil<RobotBetOption> util = new ExcelUtil<RobotBetOption>(RobotBetOption.class);
        util.exportExcel(response, list, "投注话术数据");
    }

    /**
     * 获取投注话术详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(robotBetOptionService.selectRobotBetOptionById(id));
    }

    /**
     * 新增投注话术
     */
    @Log(title = "投注话术", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RobotBetOption robotBetOption)
    {
        if(StringUtils.isEmpty(robotBetOption.getBetItemOption()) || robotBetOption.getBetItemOption().split("\\|").length != 3){
            return error("输入的话术不规范，请用|隔开");
        }
        return toAjax(robotBetOptionService.insertRobotBetOption(robotBetOption));
    }

    /**
     * 修改投注话术
     */
    @Log(title = "投注话术", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RobotBetOption robotBetOption)
    {
        if(StringUtils.isEmpty(robotBetOption.getBetItemOption()) || robotBetOption.getBetItemOption().split("\\|").length != 3){
            return error("输入的话术不规范，请用|隔开");
        }
        return toAjax(robotBetOptionService.updateRobotBetOption(robotBetOption));
    }

    /**
     * 删除投注话术
     */
    @Log(title = "投注话术", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(robotBetOptionService.deleteRobotBetOptionByIds(ids));
    }
}
