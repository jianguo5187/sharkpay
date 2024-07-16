package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.QRCodeUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.domain.vo.ShareQRCodeBase64ReqVO;
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
    public String getShareQRCodeBase64(Long userId, ShareQRCodeBase64ReqVO reqVO) {
        String content = getShareQRCodeValue(userId);

        String shareQRCodeBase64 = "";
        if(StringUtils.isNotEmpty(reqVO.getDomainUrl())){
            String logoImg = configService.selectConfigByKey("sys.logo.img");
            shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content,reqVO.getDomainUrl() + logoImg);
        }else{
            shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);
        }

        return shareQRCodeBase64;
    }

    @Override
    public String getShareQRCodeValue(Long userId) {
//        SysUser user = userService.selectUserById(userId);

        SysEntryDomain searchEntryDomain = new SysEntryDomain();
        searchEntryDomain.setStatus("0");
        List<SysEntryDomain> entryDomainList = entryDomainService.selectSysEntryDomainList(searchEntryDomain);
        if(entryDomainList == null || entryDomainList.size() == 0){
            throw new ServiceException("未配置有效入口域名");
        }

        String content = entryDomainList.get(0).getEntryDomainUrl() + "parentUserId=" + userId;
        return content;
    }

    @Override
    public List<ShareQRCodeRespVO> getEnalbeSysEntryDomainList(Long userId) {
//        SysUser user = userService.selectUserById(userId);
        SysEntryDomain searchEntryDomain = new SysEntryDomain();
        searchEntryDomain.setStatus("0");
        List<SysEntryDomain> entryDomainList = entryDomainService.selectSysEntryDomainList(searchEntryDomain);
        List<ShareQRCodeRespVO> shareQrCodeList = new ArrayList<>();
        for(SysEntryDomain entryDomain: entryDomainList){
            ShareQRCodeRespVO respVO = new ShareQRCodeRespVO();
            respVO.setShareUrl(entryDomain.getEntryDomainUrl() + "parentUserId=" + userId);
            shareQrCodeList.add(respVO);
        }
        return shareQrCodeList;
    }
}
