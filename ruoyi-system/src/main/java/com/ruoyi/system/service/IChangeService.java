package com.ruoyi.system.service;

import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.ChangeReqVO;

import java.util.List;

public interface IChangeService {

    public Usermoney change (Long userId, ChangeReqVO vo);

    List<Usermoney> changeList(Long userId, ChangeListReqVO vo);
}
