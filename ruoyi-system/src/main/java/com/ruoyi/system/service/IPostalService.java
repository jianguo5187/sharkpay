package com.ruoyi.system.service;

import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.ChangeReqVO;
import com.ruoyi.system.domain.vo.PostalReqVO;

import java.util.List;

public interface IPostalService {

    public Usermoney postal (Long userId, PostalReqVO vo);

    public List<Usermoney> postalList(Long userId, ChangeListReqVO vo);

    public Integer todayPostalCnt(Long userId);
}
