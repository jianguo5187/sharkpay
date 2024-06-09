package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.QRCodeUtil;
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.domain.vo.ShareQRCodeRespVO;
import com.ruoyi.system.service.IQRCodeService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysEntryDomainService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class qRCodeService implements IQRCodeService {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysEntryDomainService entryDomainService;

    @Override
    public String getShareQRCodeBase64(Long userId) {
        SysUser user = userService.selectUserById(userId);

        String content = configService.selectConfigByKey("sys.promote.site") + user.getInviteCode();
        String shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);
//        String shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content,"https://thirdwx.qlogo.cn/mmopen/vi_32/bejsoChBQ9aDviaGZPOwia8tcVvFcYjDOBV4X5Kpfeg009Orm5mHVJicPkHpHHNtXVt6icwjdGQrLZTb4j97HWOLXIgicMNczI1HH8FdeqnJadVY/132");


        return shareQRCodeBase64;
    }

    @Override
    public String getShareQRCodeValue(Long userId) {
        SysUser user = userService.selectUserById(userId);

        String content = configService.selectConfigByKey("sys.promote.site") + user.getInviteCode();
        return content;
    }

    @Override
    public List<ShareQRCodeRespVO> getEnalbeSysEntryDomainList(Long userId) {
        SysUser user = userService.selectUserById(userId);
        SysEntryDomain searchEntryDomain = new SysEntryDomain();
        searchEntryDomain.setStatus("0");
        List<SysEntryDomain> entryDomainList = entryDomainService.selectSysEntryDomainList(searchEntryDomain);
        List<ShareQRCodeRespVO> shareQrCodeList = new ArrayList<>();
        for(SysEntryDomain entryDomain: entryDomainList){
            ShareQRCodeRespVO respVO = new ShareQRCodeRespVO();
            respVO.setShareUrl(entryDomain.getEntryDomainUrl() + "inviteCode=" + user.getInviteCode());
            shareQrCodeList.add(respVO);
        }
        return shareQrCodeList;
    }
}
