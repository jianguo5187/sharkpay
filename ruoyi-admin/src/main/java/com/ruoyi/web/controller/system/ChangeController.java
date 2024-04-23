package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.ChangeReqVO;
import com.ruoyi.system.service.IChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 快速充值
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/change")
public class ChangeController extends BaseController{

    @Autowired
    private IChangeService changeService;

    /**
     * 快速充值
     */
    @PostMapping("/change")
    public AjaxResult change(@RequestBody ChangeReqVO vo){

        LoginUser loginUser = getLoginUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data", changeService.change(loginUser.getUserId(), vo));
        return ajax;
    }

    /**
     * 快速充值
     */
    @PostMapping("/changeList")
    public AjaxResult changeList(@RequestBody ChangeListReqVO vo){

        LoginUser loginUser = getLoginUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("changeList", changeService.changeList(loginUser.getUserId(), vo));
        return ajax;
    }
}
