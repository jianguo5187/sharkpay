package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Azxy10kj;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.BetkjReqVO;
import com.ruoyi.system.domain.vo.BetkjRespVo;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.IBetkjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class BetkjServiceImpl implements IBetkjService
{
    @Autowired
    private JsssckjMapper jsssckjMapper;
    @Autowired
    private BetkjMapper betkjMapper;
    @Autowired
    private Azxy10kjMapper azxy10kjMapper;
    @Autowired
    private SysGameMapper sysGameMapper;

    /**
     * 查询开奖列表
     *
     * @param betkjReqVO 开奖
     * @return 开奖集合
     */
    @Override
    public List<BetkjRespVo> selectBetkjList(SysGame gameInfo , BetkjReqVO betkjReqVO) {
//        SysGame gameInfo = sysGameMapper.selectSysGameByGameId(betkjReqVO.getGameId());

        return betkjMapper.selectBetkjList(gameInfo.getGameKj(), gameInfo.getGameType(), betkjReqVO.getPeriods(), betkjReqVO.getStatus());
    }
}