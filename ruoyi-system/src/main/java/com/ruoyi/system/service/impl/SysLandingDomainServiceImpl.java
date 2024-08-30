package com.ruoyi.system.service.impl;

import java.net.URLEncoder;
import java.util.List;
import java.util.Random;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysEntryDomainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysLandingDomainMapper;
import com.ruoyi.system.domain.SysLandingDomain;
import com.ruoyi.system.service.ISysLandingDomainService;

/**
 * 落地域名Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
@Service
public class SysLandingDomainServiceImpl implements ISysLandingDomainService 
{
    @Autowired
    private SysLandingDomainMapper sysLandingDomainMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysEntryDomainService sysEntryDomainService;

    /**
     * 查询落地域名
     * 
     * @param landingDomainId 落地域名主键
     * @return 落地域名
     */
    @Override
    public SysLandingDomain selectSysLandingDomainByLandingDomainId(Long landingDomainId)
    {
        return sysLandingDomainMapper.selectSysLandingDomainByLandingDomainId(landingDomainId);
    }

    /**
     * 查询落地域名列表
     * 
     * @param sysLandingDomain 落地域名
     * @return 落地域名
     */
    @Override
    public List<SysLandingDomain> selectSysLandingDomainList(SysLandingDomain sysLandingDomain)
    {
        return sysLandingDomainMapper.selectSysLandingDomainList(sysLandingDomain);
    }

    /**
     * 新增落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    @Override
    public int insertSysLandingDomain(SysLandingDomain sysLandingDomain)
    {
        sysLandingDomain.setCreateTime(DateUtils.getNowDate());
        return sysLandingDomainMapper.insertSysLandingDomain(sysLandingDomain);
    }

    /**
     * 修改落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    @Override
    public int updateSysLandingDomain(SysLandingDomain sysLandingDomain)
    {
        sysLandingDomain.setUpdateTime(DateUtils.getNowDate());
        return sysLandingDomainMapper.updateSysLandingDomain(sysLandingDomain);
    }

    /**
     * 批量删除落地域名
     * 
     * @param landingDomainIds 需要删除的落地域名主键
     * @return 结果
     */
    @Override
    public int deleteSysLandingDomainByLandingDomainIds(Long[] landingDomainIds)
    {
        int rowId = sysLandingDomainMapper.deleteSysLandingDomainByLandingDomainIds(landingDomainIds);

        String webType = configService.selectConfigByKey("sys.web.type");

        String qrServerIp = configService.selectConfigByKey("sys.web.qrServer");

        if(!qrServerIp.startsWith("http") && !qrServerIp.startsWith("https")){
            qrServerIp = "http://" + qrServerIp;
        }

//        SysEntryDomain entryDomainSearch = new SysEntryDomain();
//        entryDomainSearch.setStatus("0");
//        entryDomainSearch.setDelFlag("0");
//        List<SysEntryDomain> entryDomainList = sysEntryDomainService.selectSysEntryDomainList(entryDomainSearch);
//        if(entryDomainList.size() > 0){
//            String entryDomainUrl = entryDomainList.get(0).getEntryDomainUrl();

            SysLandingDomain landingDomainSearch = new SysLandingDomain();
            landingDomainSearch.setStatus("0");
            landingDomainSearch.setDelFlag("0");
            List<SysLandingDomain> landingDomainList = selectSysLandingDomainList(landingDomainSearch);
            if(landingDomainList.size() > 0){
                String landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl();
                HttpUtils.sendGet(qrServerIp + ":6678/app/updateMainUrl?"+"webType="+webType+"&mainUrl="+ ServletUtils.urlEncode(landingDomainUrl));
            }
//        }
        return rowId;
    }

    /**
     * 删除落地域名信息
     * 
     * @param landingDomainId 落地域名主键
     * @return 结果
     */
    @Override
    public int deleteSysLandingDomainByLandingDomainId(Long landingDomainId)
    {
        return sysLandingDomainMapper.deleteSysLandingDomainByLandingDomainId(landingDomainId);
    }

    @Override
    public String getValidLandingDomainUrl(){

        SysLandingDomain landingDomainSearch = new SysLandingDomain();
        landingDomainSearch.setStatus("0");
        landingDomainSearch.setDelFlag("0");
        List<SysLandingDomain> landingDomainList = selectSysLandingDomainList(landingDomainSearch);

        String landingDomainUrl= "";
        if(landingDomainList.size() > 0){

            landingDomainUrl = landingDomainList.get(0).getLandingDomainUrl();
            if(landingDomainUrl.startsWith("http") || landingDomainUrl.startsWith("https")){
                landingDomainUrl = landingDomainUrl.replace("http://","").replace("https://","");
            }

            landingDomainUrl = "http://" + generateSoleName() + "." + landingDomainUrl;
        }
        return landingDomainUrl;
    }

    public static String generateSoleName() {
        String tmpResult;
        StringBuilder soleResult = new StringBuilder();
        //生成7位随机
        for (int i = 1; i <= 6; i++) {
            //判断产生的随机数是0还是1，是0进入if语句用于输出数字，是1进入else用于输出字符
            int mark = 1;
            if(i > 1){
                mark = Math.random() >= 0.5 ? 1 : 0;
            }
            if (0 == mark) {
                Random random = new Random();
                //产生0-9数字
                tmpResult = random.nextInt(10) + "";
            } else {
                char[] englishNumArray = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                        'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
                Random random = new Random();
                int sub = random.nextInt(englishNumArray.length);
                //产生A——z字符
                tmpResult = englishNumArray[sub] + "";
            }
            soleResult.append(tmpResult);
        }
        return soleResult.toString();
    }
}
