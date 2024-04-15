package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.GameListReqVO;
import com.ruoyi.system.domain.vo.GameListRespVO;
import com.ruoyi.system.mapper.BetkjMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class SysAppServiceImpl implements ISysAppService {


    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IGameFiveballRecordService gameFiveballRecordService;

    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private BetkjMapper betkjMapper;

    @Override
    public List<GameListRespVO> gameRecordList(Long userId, GameListReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        String day = vo.getFilterDay();

        if(StringUtils.isEmpty(vo.getFilterDay())){
            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
            String today = sd.format(new Date());
            day = today;
        }

        String recordTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            // 3球
            recordTable = "game_threeball_record";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            // 5球
            recordTable = "game_fiveball_record";
        }else{
            // 10球
            recordTable = "game_tenball_record";
        }

        return betkjMapper.gameRecordList(vo.getGameId(), recordTable,userId,day);
    }
}
