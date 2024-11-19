package com.ruoyi.system.service.impl;

import java.net.URLEncoder;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysEntryDomainMapper;
import com.ruoyi.system.domain.SysEntryDomain;
import com.ruoyi.system.service.ISysEntryDomainService;

/**
 * 入口域名Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
@Service
public class SysEntryDomainServiceImpl implements ISysEntryDomainService 
{
    @Autowired
    private SysEntryDomainMapper sysEntryDomainMapper;

    @Autowired
    private ISysConfigService configService;

    /**
     * 查询入口域名
     * 
     * @param entryDomainId 入口域名主键
     * @return 入口域名
     */
    @Override
    public SysEntryDomain selectSysEntryDomainByEntryDomainId(Long entryDomainId)
    {
        return sysEntryDomainMapper.selectSysEntryDomainByEntryDomainId(entryDomainId);
    }

    /**
     * 查询入口域名列表
     * 
     * @param sysEntryDomain 入口域名
     * @return 入口域名
     */
    @Override
    public List<SysEntryDomain> selectSysEntryDomainList(SysEntryDomain sysEntryDomain)
    {
        return sysEntryDomainMapper.selectSysEntryDomainList(sysEntryDomain);
    }

    /**
     * 新增入口域名
     * 
     * @param sysEntryDomain 入口域名
     * @return 结果
     */
    @Override
    public int insertSysEntryDomain(SysEntryDomain sysEntryDomain)
    {
        sysEntryDomain.setCreateTime(DateUtils.getNowDate());
        int row = sysEntryDomainMapper.insertSysEntryDomain(sysEntryDomain);

        SysEntryDomain entryDomainSearch = new SysEntryDomain();
        entryDomainSearch.setStatus("0");
        entryDomainSearch.setDelFlag("0");
        List<SysEntryDomain> entryDomainList = selectSysEntryDomainList(entryDomainSearch);
        if(entryDomainList.size() == 1){

            String webType = configService.selectConfigByKey("sys.web.type");
            String webName = configService.selectConfigByKey("sys.web.name");

            String qrServerIp = configService.selectConfigByKey("sys.web.qrServer");
            if(!qrServerIp.startsWith("http") && !qrServerIp.startsWith("https")){
                qrServerIp = "http://" + qrServerIp;
            }

            String entryDomainUrl = entryDomainList.get(0).getEntryDomainUrl();
            HttpUtils.sendGet(qrServerIp + ":6678/app/updateEntryUrl?"+"webType="+webType+"&webName="+ URLEncoder.encode(webName)+"&qrUrl="+ServletUtils.urlEncode(entryDomainUrl));

        }

        return row;
    }

    /**
     * 修改入口域名
     * 
     * @param sysEntryDomain 入口域名
     * @return 结果
     */
    @Override
    public int updateSysEntryDomain(SysEntryDomain sysEntryDomain)
    {
        sysEntryDomain.setUpdateTime(DateUtils.getNowDate());
        return sysEntryDomainMapper.updateSysEntryDomain(sysEntryDomain);
    }

    /**
     * 批量删除入口域名
     * 
     * @param entryDomainIds 需要删除的入口域名主键
     * @return 结果
     */
    @Override
    public int deleteSysEntryDomainByEntryDomainIds(Long[] entryDomainIds)
    {
        int rowId = sysEntryDomainMapper.deleteSysEntryDomainByEntryDomainIds(entryDomainIds);

        String webType = configService.selectConfigByKey("sys.web.type");
        String webName = configService.selectConfigByKey("sys.web.name");

        String qrServerIp = configService.selectConfigByKey("sys.web.qrServer");
        if(!qrServerIp.startsWith("http") && !qrServerIp.startsWith("https")){
            qrServerIp = "http://" + qrServerIp;
        }

        SysEntryDomain entryDomainSearch = new SysEntryDomain();
        entryDomainSearch.setStatus("0");
        entryDomainSearch.setDelFlag("0");
        List<SysEntryDomain> entryDomainList = selectSysEntryDomainList(entryDomainSearch);
        String entryDomainUrl = "";
        if(entryDomainList.size() > 0){
            entryDomainUrl = entryDomainList.get(0).getEntryDomainUrl();
        }else{
            SysEntryDomain searchNoDeleteEntryDomain = new SysEntryDomain();
            searchNoDeleteEntryDomain.setDelFlag("0");
            List<SysEntryDomain> noDeleteEntryDomainList = selectSysEntryDomainList(searchNoDeleteEntryDomain);
            if(noDeleteEntryDomainList.size() == 0){
                SysEntryDomain searchNoValidEntryDomain = new SysEntryDomain();
                searchNoValidEntryDomain.setStatus("0");
                List<SysEntryDomain> noValidEntryDomainList = selectSysEntryDomainList(searchNoValidEntryDomain);
                if(noValidEntryDomainList.size() > 0){

                    SysEntryDomain noValidEntryDomain = noValidEntryDomainList.get(0);
                    noValidEntryDomain.setStatus("0");
                    noValidEntryDomain.setDelFlag("0");
                    updateSysEntryDomain(noValidEntryDomain);

                    entryDomainUrl = noValidEntryDomain.getEntryDomainUrl();
                }
            }else{
                SysEntryDomain noDeleteEntryDomain = noDeleteEntryDomainList.get(0);
                noDeleteEntryDomain.setStatus("0");
                noDeleteEntryDomain.setDelFlag("0");
                updateSysEntryDomain(noDeleteEntryDomain);

                entryDomainUrl = noDeleteEntryDomain.getEntryDomainUrl();
            }

        }
        HttpUtils.sendGet(qrServerIp + ":6678/app/updateEntryUrl?"+"webType="+webType+"&webName="+ URLEncoder.encode(webName)+"&qrUrl="+ServletUtils.urlEncode(entryDomainUrl));

        return rowId;
    }

    /**
     * 删除入口域名信息
     * 
     * @param entryDomainId 入口域名主键
     * @return 结果
     */
    @Override
    public int deleteSysEntryDomainByEntryDomainId(Long entryDomainId)
    {
        return sysEntryDomainMapper.deleteSysEntryDomainByEntryDomainId(entryDomainId);
    }
}
