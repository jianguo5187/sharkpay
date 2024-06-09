package com.ruoyi.system.service;

import com.ruoyi.system.domain.vo.ShareQRCodeRespVO;

import java.util.List;

public interface IQRCodeService {
    public String getShareQRCodeBase64(Long userId);
    public String getShareQRCodeValue(Long userId);

    public List<ShareQRCodeRespVO> getEnalbeSysEntryDomainList(Long userId);
}
