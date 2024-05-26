package com.ruoyi.system.service;

public interface IQRCodeService {
    public String getShareQRCodeBase64(Long userId);
    public String getShareQRCodeValue(Long userId);
}
