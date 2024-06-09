package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.ShareQRCodeBase64ReqVO;
import com.ruoyi.system.service.IQRCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 推广Controller
 *
 * @author ruoyi
 * @date 2024-03-17
 */
@RestController
@RequestMapping("/qrCode")
public class QRCodeController extends BaseController {

    @Autowired
    private IQRCodeService qrCodeService;

    /**
     * 获取昨天盈亏数据接口
     */
    @PostMapping("/getShareQRCodeBase64")
    public AjaxResult getShareQRCodeBase64(@RequestBody ShareQRCodeBase64ReqVO reqVO){
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data",qrCodeService.getShareQRCodeBase64(sessionUser.getUserId(),reqVO));
        ajax.put("urlData",qrCodeService.getShareQRCodeValue(sessionUser.getUserId()));
        return ajax;
    }
}
