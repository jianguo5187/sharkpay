package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.HashMap;
import java.util.Map;

public class BetRealTimeReqVO {
    /** 游戏ID */
    private Long gameId;

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 期数 */
    private Long periods;

    /** 是否中奖 */
    private String winFlg;

    /** 仅看未结算Flg */
    private String settledFlgStr;

    private String dataScope;

    /** 请求参数 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public String getWinFlg() {
        return winFlg;
    }

    public void setWinFlg(String winFlg) {
        this.winFlg = winFlg;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSettledFlgStr() {
        return settledFlgStr;
    }

    public void setSettledFlgStr(String settledFlgStr) {
        this.settledFlgStr = settledFlgStr;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    public Map<String, Object> getParams()
    {
        if (params == null)
        {
            params = new HashMap<>();
        }
        return params;
    }

    public void setParams(Map<String, Object> params)
    {
        this.params = params;
    }
}
