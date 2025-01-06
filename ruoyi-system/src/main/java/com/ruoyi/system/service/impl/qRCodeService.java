package com.ruoyi.system.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.QRCodeUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.domain.vo.ShareQRCodeBase64ReqVO;
import com.ruoyi.system.domain.vo.ShareQRCodeRespVO;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
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

    @Autowired
    private ISysLandingDomainService sysLandingDomainService;

    @Override
    public String getShareQRCodeBase64(Long userId, ShareQRCodeBase64ReqVO reqVO) {
        String content = getShareQRCodeValue(userId);

        String shareQRCodeBase64 = "";
//        if(StringUtils.isNotEmpty(reqVO.getDomainUrl())){
            String logoImg = configService.selectConfigByKey("sys.logo.img");

//            SysLandingDomain landingDomainSearch = new SysLandingDomain();
//            landingDomainSearch.setStatus("0");
//            landingDomainSearch.setDelFlag("0");
//            List<SysLandingDomain> landingDomainList = sysLandingDomainService.selectSysLandingDomainList(landingDomainSearch);
            String landingDomainUrl= sysLandingDomainService.getValidLandingDomainUrl();
            if(StringUtils.isNotEmpty(landingDomainUrl)) {
//                landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl();
//                if(landingDomainUrl.startsWith("http") || landingDomainUrl.startsWith("https")){
//                    landingDomainUrl = landingDomainUrl.replace("http://","").replace("https://","");
//                }
                landingDomainUrl = landingDomainUrl+"/prod-api";

                try {
                    shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content,landingDomainUrl + logoImg);
                }catch (Exception e){
                    shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);
                }
            }else{
                shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);
            }
//        }else{
//            shareQRCodeBase64 = QRCodeUtil.getBase64QRCode(content);
//        }

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
        String webType = configService.selectConfigByKey("sys.web.type");
        String qrWebPort = configService.selectConfigByKey("sys.qrweb.port");
        if(StringUtils.isEmpty(qrWebPort)){
            qrWebPort = "6678";
        }

        // TODO OLD
        Instant now = Instant.now();
        Long timestamp = now.toEpochMilli();
        String content = "";
        if(!StringUtils.equals(qrWebPort,"80")&&!StringUtils.equals(qrWebPort,"443")) {
            content = entryDomainList.get(0).getEntryDomainUrl() + ":" + qrWebPort +"?webType=" + webType + "&parentUserId=" + userId + "&time=" + timestamp;
        }else{

//        // TODO 0907
            content = entryDomainList.get(0).getEntryDomainUrl() + "?webType=" + webType + "&parentUserId=" + userId + "&time=" + timestamp;
        }
        return content;
    }

    @Override
    public List<ShareQRCodeRespVO> getEnalbeSysEntryDomainList(Long userId) {
//        SysUser user = userService.selectUserById(userId);
        String webType = configService.selectConfigByKey("sys.web.type");
        String qrWebPort = configService.selectConfigByKey("sys.qrweb.port");
        if(StringUtils.isEmpty(qrWebPort)){
            qrWebPort = "6678";
        }
        SysEntryDomain searchEntryDomain = new SysEntryDomain();
        searchEntryDomain.setStatus("0");
        List<SysEntryDomain> entryDomainList = entryDomainService.selectSysEntryDomainList(searchEntryDomain);
        List<ShareQRCodeRespVO> shareQrCodeList = new ArrayList<>();
        Instant now = Instant.now();
        Long timestamp = now.toEpochMilli();
        for(SysEntryDomain entryDomain: entryDomainList){
            ShareQRCodeRespVO respVO = new ShareQRCodeRespVO();
        // TODO OLD
            if(!StringUtils.equals(qrWebPort,"80")&&!StringUtils.equals(qrWebPort,"443")) {
                respVO.setShareUrl(entryDomain.getEntryDomainUrl() + ":" + qrWebPort + "?webType=" + webType +"&parentUserId=" + userId + "&time=" + timestamp);
            }else {
//        // TODO 0907
                respVO.setShareUrl(entryDomain.getEntryDomainUrl() + "?webType=" + webType + "&parentUserId=" + userId + "&time=" + timestamp);
            }
            shareQrCodeList.add(respVO);
        }
        return shareQrCodeList;
    }
}
