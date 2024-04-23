package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.ChangeListReqVO;
import com.ruoyi.system.domain.vo.PostalReqVO;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.IPostalService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostalServiceImpl implements IPostalService {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private ISysConfigService configService;

    @Override
    public Usermoney postal(Long userId, PostalReqVO vo) {
        if(vo.getMoney() <= 0){
            throw new ServiceException("提现金额不少于0");
        }

        Float postalMin = 0f;
        Integer postalMaxCnt = 0;
        String postalMinStr = configService.selectConfigByKey("sys.postal.min");
        if(StringUtils.isNotEmpty(postalMinStr)){
            postalMin = Float.parseFloat(postalMinStr);
        }
        if(postalMin > 0 && vo.getMoney().compareTo(postalMin) < 0){
            throw new ServiceException("提现金额不少于:" + postalMin);
        }

        SysUser user = userService.selectUserById(userId);

        if(vo.getMoney() == null || vo.getMoney() <=0 || vo.getMoney().compareTo(user.getAmount()) > 0){
            throw new ServiceException("用户余额不足");
        }
        String postalMaxCntStr = configService.selectConfigByKey("sys.postal.maxCnt");
        if(StringUtils.isNotEmpty(postalMinStr)){
            postalMaxCnt = Integer.parseInt(postalMaxCntStr);
        }

        List<Usermoney> todayPostalList = usermoneyMapper.selectTodayPostalList(userId);
        if(postalMaxCnt > 0 && todayPostalList != null && todayPostalList.size() > postalMaxCnt){
            throw new ServiceException("用户提现次数以达到:" + postalMaxCnt);
        }

        Usermoney searchUsermoney = new Usermoney();
        searchUsermoney.setType("4");
        searchUsermoney.setUserId(userId);
        List<Usermoney> usermoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
        if(usermoneyList != null && usermoneyList.size() > 0){
            throw new ServiceException("客服处理中，请等待客服处理");
        }
        Float userBalance = user.getAmount()- vo.getMoney();

        Usermoney usermoney = new Usermoney();
        usermoney.setUserId(userId);
        usermoney.setRemark("申请提现");
        usermoney.setUserBalance(userBalance);
        usermoney.setUnionPayId(0l);
        usermoney.setCashMoney(vo.getMoney());
        usermoney.setType("4");
        usermoneyMapper.insertUsermoney(usermoney);

        user.setAmount(userBalance);
        userService.updateUserAmount(user);

        return usermoney;
    }

    @Override
    public List<Usermoney> postalList(Long userId, ChangeListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return usermoneyMapper.selectUserChangeList(userId,(vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount());
    }
}
