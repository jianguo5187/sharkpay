package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.PostalReqVO;
import com.ruoyi.system.service.IPostalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 快速提现
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/postal")
public class PostalController extends BaseController {

    @Autowired
    private IPostalService postalService;

    /**
     * 快速提现
     */
    @PostMapping("/postal")
    public AjaxResult postal(@RequestBody PostalReqVO vo){

        LoginUser loginUser = getLoginUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data", postalService.postal(loginUser.getUserId(), vo));
        return ajax;
    }

    /**
     * 提现记录
     */
    @PostMapping("/postalList")
    public AjaxResult postalList(@RequestBody ChangeListReqVO vo){

        LoginUser loginUser = getLoginUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("postalList", postalService.postalList(loginUser.getUserId(), vo));
        return ajax;
    }

    /**
     * 提现记录
     */
    @GetMapping("/todayPostalCnt")
    public AjaxResult todayPostalCnt(){

        LoginUser loginUser = getLoginUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("todayPostalCnt", postalService.todayPostalCnt(loginUser.getUserId()));
        return ajax;
    }
}
