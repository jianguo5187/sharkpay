package com.ruoyi.system.service;

import com.ruoyi.system.domain.Azxy10kj;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.BetkjReqVO;
import com.ruoyi.system.domain.vo.BetkjRespVo;

import java.util.List;

/**
 * 开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IBetkjService
{

    /**
     * 查询开奖列表
     * 
     * @param betkjReqVO 开奖
     * @return 开奖集合
     */
    public List<BetkjRespVo> selectBetkjList(SysGame gameInfo, BetkjReqVO betkjReqVO);
}
