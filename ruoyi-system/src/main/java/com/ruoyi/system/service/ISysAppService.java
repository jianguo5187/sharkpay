package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.GameAutoBetRecord;
import com.ruoyi.system.domain.SysReplace;
import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface ISysAppService {

    public List<GameListRespVO> gameRecordList(Long userId, GameListReqVO vo);

    public GameDetailRespVO gameRecordDetail(Long userId, GameDetailReqVO vo);

    public void clearGameRecode(Long userId);

    public List<GameResultListRespVO> gameResultList(GameResultListReqVO vo);

    public List<SysReplace> replaceList();

    public HomePageDataRespVO getHomePageDate();

    public void updateLogoImg(UpdateLogoImgReqVO vo);

    public List<VirtuallyGameRecordRespVO> getVirtuallyRecordList(VirtuallyRecordListReqVO vo);

    public List<CashbackReportRespVO> getCashbackReportList(Long userId,CashbackComissionReportReqVO vo);

    public List<CommissionReportRespVO> getCommissionReportList(Long userId, CashbackComissionReportReqVO vo);

    public void updateChatImg(UpdateLogoImgReqVO vo);

    public List<String> getOpenData(String gameType);

    public void updateSiteSetting(UpdateSiteSettingReqVO vo);

    public String checkIpAddressValid(CheckIpAddressValidReqVO vo);

    public void autoModifyValidDomainUrl();

    public GameLimitSettingRespVO getGameLimitSetting();

    public void updatGameLimitSetting(GameLimitSettingUpdateReqVO vo);

    public List<ChildReportRespVO> selectChildReportList(ChildReportReqVO vo);

    public List<GameAutoBetRecord> getAutoBetScheduleList(Long userId, AutoBetScheduleListReqVO vo);

    public int stopAutoBetSchedule(SysUser user, StopAutoBetScheduleReqVO vo);
}
