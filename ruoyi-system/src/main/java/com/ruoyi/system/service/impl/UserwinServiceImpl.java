package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.vo.UserGameTotalRankListRespVO;
import com.ruoyi.system.domain.vo.UserGameWinRankListRespVO;
import com.ruoyi.system.domain.vo.UserTotalRankListRespVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.UserwinMapper;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.service.IUserwinService;

/**
 * 用户盈亏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@Service
public class UserwinServiceImpl implements IUserwinService 
{
    @Autowired
    private UserwinMapper userwinMapper;

    /**
     * 查询用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 用户盈亏
     */
    @Override
    public Userwin selectUserwinById(Long id)
    {
        return userwinMapper.selectUserwinById(id);
    }

    /**
     * 查询用户盈亏列表
     * 
     * @param userwin 用户盈亏
     * @return 用户盈亏
     */
    @Override
    public List<Userwin> selectUserwinList(Userwin userwin)
    {
        return userwinMapper.selectUserwinList(userwin);
    }

    /**
     * 新增用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    @Override
    public int insertUserwin(Userwin userwin)
    {
        userwin.setCreateTime(DateUtils.getNowDate());
        return userwinMapper.insertUserwin(userwin);
    }

    /**
     * 修改用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    @Override
    public int updateUserwin(Userwin userwin)
    {
        userwin.setUpdateTime(DateUtils.getNowDate());
        return userwinMapper.updateUserwin(userwin);
    }

    /**
     * 批量删除用户盈亏
     * 
     * @param ids 需要删除的用户盈亏主键
     * @return 结果
     */
    @Override
    public int deleteUserwinByIds(Long[] ids)
    {
        return userwinMapper.deleteUserwinByIds(ids);
    }

    /**
     * 删除用户盈亏信息
     * 
     * @param id 用户盈亏主键
     * @return 结果
     */
    @Override
    public int deleteUserwinById(Long id)
    {
        return userwinMapper.deleteUserwinById(id);
    }

    @Override
    public Userwin selectTodayUserwin(Long gameId,Long userId) {
        return userwinMapper.selectTodayUserwin(gameId,userId);
    }

    @Override
    public List<UserTotalRankListRespVO> selectUserTotalRankList(Userwin userwin) {
        List<UserGameWinRankListRespVO> userGameWinRankList = userwinMapper.selectUserGameWinRankList(userwin);
        List<UserTotalRankListRespVO> respVO = new ArrayList<>();

        Map<Long,UserTotalRankListRespVO> userTotalRankMap = new HashMap<>();
//        Map<String, UserGameTotalRankListRespVO> userGameRankMap = new HashMap<>();

        for(UserGameWinRankListRespVO userGameWinRankListRespVO :userGameWinRankList){
            UserTotalRankListRespVO vo = new UserTotalRankListRespVO();
            if(userTotalRankMap.containsKey(userGameWinRankListRespVO.getUserId())){
                vo = userTotalRankMap.get(userGameWinRankListRespVO.getUserId());
            }else{

                vo.setTotalWinMoney(0f);
                vo.setTotalCashBackMoney(0f);
                vo.setTotalBetMoney(0f);
                vo.setJnd20(0f);
                vo.setJnd28(0f);
                vo.setJnd32(0f);
                vo.setJspc28(0f);
                vo.setBt28(0f);
                vo.setMssc(0f);
                vo.setAzxy52(0f);
                vo.setAzxy5(0f);
                vo.setAzxy10(0f);
                vo.setAzxy102(0f);
                vo.setXyft(0f);
                vo.setJssc(0f);
                vo.setJsft(0f);
                vo.setJssc(0f);
                vo.setJssc2(0f);
                vo.setXyft2(0f);

            }
            vo.setUserId(userGameWinRankListRespVO.getUserId());
            vo.setNickName(userGameWinRankListRespVO.getNickName());
            vo.setRealName(userGameWinRankListRespVO.getRealName());
            vo.setUserAmount(userGameWinRankListRespVO.getUserAmount());
            vo.setTotalWinMoney(vo.getTotalWinMoney() +  userGameWinRankListRespVO.getWinMoney());
            vo.setTotalCashBackMoney(vo.getTotalCashBackMoney() +  userGameWinRankListRespVO.getCashBackMoney());
            vo.setTotalBetMoney(vo.getTotalBetMoney() +  userGameWinRankListRespVO.getBigSmallMoney() + userGameWinRankListRespVO.getOtherMoney());

            if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd20")){
                vo.setJnd20(vo.getJnd20() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd28")){
                vo.setJnd28(vo.getJnd28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd32")){
                vo.setJnd32(vo.getJnd32() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jspc28")){
                vo.setJspc28(vo.getJspc28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"bt28")){
                vo.setBt28(vo.getBt28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"mssc")){
                vo.setMssc(vo.getMssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy52")){
                vo.setAzxy52(vo.getAzxy52() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy5")){
                vo.setAzxy5(vo.getAzxy5() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy10")){
                vo.setAzxy10(vo.getAzxy10() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy102")){
                vo.setAzxy102(vo.getAzxy102() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"xyft")){
                vo.setXyft(vo.getXyft() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jssc")){
                vo.setJssc(vo.getJssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jsft")){
                vo.setJsft(vo.getJsft() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jssc2")){
                vo.setJssc(vo.getJssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jsssc")){
                vo.setJssc2(vo.getJssc2() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"xyft2")){
                vo.setXyft2(vo.getXyft2() +  userGameWinRankListRespVO.getWinMoney());
            }
            userTotalRankMap.put(userGameWinRankListRespVO.getUserId(),vo);
//            UserGameTotalRankListRespVO userGameRankVo = new UserGameTotalRankListRespVO();
//            if(userGameRankMap.containsKey(userGameWinRankListRespVO.getUserId() + "_" + userGameWinRankListRespVO.getGameId())){
//                userGameRankVo = userGameRankMap.get(userGameWinRankListRespVO.getUserId() + "_" + userGameWinRankListRespVO.getGameId());
//            }
        }
        for(Map.Entry<Long,UserTotalRankListRespVO> entry: userTotalRankMap.entrySet()){
            respVO.add(entry.getValue());
        }

        return respVO;
    }
}
