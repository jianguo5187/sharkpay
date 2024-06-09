package com.ruoyi.system.service;

import com.ruoyi.system.domain.vo.ShareQRCodeBase64ReqVO;
import com.ruoyi.system.domain.vo.ShareQRCodeRespVO;

import java.util.List;

public interface IQRCodeService {
    public String getShareQRCodeBase64(Long userId, ShareQRCodeBase64ReqVO reqVO);
    public String getShareQRCodeValue(Long userId);

    public List<ShareQRCodeRespVO> getEnalbeSysEntryDomainList(Long userId);
}
