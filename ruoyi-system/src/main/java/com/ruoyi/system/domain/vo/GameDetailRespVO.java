package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class GameDetailRespVO {

    /** 游戏ID */
    private Long gameId;

    /** 游戏名 */
    private String gameName;

    /** 期数 */
    private Long periods;

    /** 中奖金额 */
    private Float winMoney;

    /** 投注状态（0投注 1撤单） */
    private String status;

    /** 开奖结果 */
    private String openCode;

    /** 开奖标识 0:未开奖 1:已开奖 */
    private String openFlg;

    /** 投注时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recordTime;

    /** 投注详情 */
    private List<PlayedDetailRespVO> playedDetail;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Float getWinMoney() {
        return winMoney;
    }

    public void setWinMoney(Float winMoney) {
        this.winMoney = winMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOpenCode() {
        return openCode;
    }

    public void setOpenCode(String openCode) {
        this.openCode = openCode;
    }

    public String getOpenFlg() {
        return openFlg;
    }

    public void setOpenFlg(String openFlg) {
        this.openFlg = openFlg;
    }

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }

    public List<PlayedDetailRespVO> getPlayedDetail() {
        return playedDetail;
    }

    public void setPlayedDetail(List<PlayedDetailRespVO> playedDetail) {
        this.playedDetail = playedDetail;
    }
}
