package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.QRCodeUtil;
import com.ruoyi.system.service.IQRCodeService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class qRCodeService implements IQRCodeService {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Override
    public String getShareQRCodeBase64(Long userId) {
        SysUser user = userService.selectUserById(userId);

        String content = configService.selectConfigByKey("sys.promote.site") + user.getInviteCode();
        String shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);;
        return shareQRCodeBase64;
    }

    @Override
    public String getShareQRCodeValue(Long userId) {
        SysUser user = userService.selectUserById(userId);

        String content = configService.selectConfigByKey("sys.promote.site") + user.getInviteCode();
        return content;
    }
}
