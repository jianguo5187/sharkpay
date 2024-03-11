package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysChat;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.vo.req.ChatContentReqVO;
import com.ruoyi.common.core.vo.req.ChatUpdateReadedReqVO;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.ISysChatService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 聊天信息Controller
 * 
 * @author ruoyi
 * @date 2024-01-06
 */
@RestController
@RequestMapping("/system/chat")
public class SysChatController extends BaseController
{
    @Autowired
    private ISysChatService sysChatService;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询聊天信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:chat:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysChat sysChat)
    {
        startPage();
        List<SysChat> list = sysChatService.selectSysChatList(sysChat);
        return getDataTable(list);
    }

    /**
     * 导出聊天信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:chat:export')")
    @Log(title = "聊天信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysChat sysChat)
    {
        List<SysChat> list = sysChatService.selectSysChatList(sysChat);
        ExcelUtil<SysChat> util = new ExcelUtil<SysChat>(SysChat.class);
        util.exportExcel(response, list, "聊天信息数据");
    }

    /**
     * 获取聊天信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:chat:query')")
    @GetMapping(value = "/{chatId}")
    public AjaxResult getInfo(@PathVariable("chatId") Long chatId)
    {
        return success(sysChatService.selectSysChatByChatId(chatId));
    }

    /**
     * 新增聊天信息
     */
    @PreAuthorize("@ss.hasPermi('system:chat:add')")
    @Log(title = "聊天信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysChat sysChat)
    {
        return toAjax(sysChatService.insertSysChat(sysChat));
    }

    /**
     * 修改聊天信息
     */
    @PreAuthorize("@ss.hasPermi('system:chat:edit')")
    @Log(title = "聊天信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysChat sysChat)
    {
        return toAjax(sysChatService.updateSysChat(sysChat));
    }

    /**
     * 删除聊天信息
     */
    @PreAuthorize("@ss.hasPermi('system:chat:remove')")
    @Log(title = "聊天信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{chatIds}")
    public AjaxResult remove(@PathVariable Long[] chatIds)
    {
        return toAjax(sysChatService.deleteSysChatByChatIds(chatIds));
    }

    /**
     * 查询聊天信息列表
     */
    @GetMapping("/getChatUserlist")
    public AjaxResult getChatUserlist()
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser user = SecurityUtils.getLoginUser().getUser();
//        ajax.put("chatUserList", sysChatService.selectChatUserListByUserId(user.getUserId(),user.getDeptId(),user.getParentUserId()));
        ajax.put("loginUserName", user.getNickName());
        return ajax;
    }

    /**
     * 查询聊天记录列表
     *
     * @return 聊天信息集合
     */
    @PostMapping("/getChatContentlist")
    public AjaxResult getChatContentlist(@RequestBody ChatContentReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("chatContentList",sysChatService.selectChatContentList(vo));
        return ajax;
    }

    /**
     * 修改消息为已读
     *
     * @return 聊天信息集合
     */
    @PostMapping("/updateChatRead")
    public AjaxResult updateChatRead(@RequestBody ChatUpdateReadedReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        toAjax(sysChatService.updateChatReaded(vo));
//        ajax.put("chatContentList",sysChatService.selectChatContentList(vo));
        return ajax;
    }

}
