package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.ChangeReqVO;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.IChangeService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChangeServiceImpl implements IChangeService {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private ISysConfigService configService;

    @Override
    public Usermoney change(Long userId, ChangeReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Float changMin = Float.parseFloat(configService.selectConfigByKey("sys.change.min"));

        if(vo.getMoney().compareTo(changMin) < 0){
            throw new ServiceException("最低充值不少于:" + changMin);
        }
        Usermoney searchUsermoney = new Usermoney();
        searchUsermoney.setType("1");
        searchUsermoney.setUserId(userId);
        List<Usermoney> usermoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
        if(usermoneyList != null && usermoneyList.size() > 0){
            throw new ServiceException("客服处理中，请等待客服处理");
        }

        Usermoney usermoney = new Usermoney();
        usermoney.setUserId(userId);
        if(vo.getChangeType().compareTo(1l) == 0){
            usermoney.setUserAccount("支付宝");
            usermoney.setRemark("支付宝充值");
        }else if(vo.getChangeType().compareTo(2l) == 0){
            usermoney.setUserAccount("微信");
            usermoney.setRemark("微信充值");
        }else {
            usermoney.setUserAccount("银联");
            usermoney.setRemark("银联充值");
        }
        usermoney.setUserBalance(user.getAmount());
        usermoney.setUnionPayId(vo.getChangeType());
        usermoney.setCashMoney(vo.getMoney());
        usermoney.setType("1");
        usermoneyMapper.insertUsermoney(usermoney);
        return usermoney;
    }

    @Override
    public List<Usermoney> changeList(Long userId, ChangeListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return usermoneyMapper.selectUserChangeList(userId,(vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount());
    }
}
