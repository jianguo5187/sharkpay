package com.ruoyi.system.domain.vo;

import java.util.List;

public class ThreeBallsAddMultiBetRecordReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 期数 */
    private Long periods;

    /** 期数 */
    private List<ThreeBallsMultiBetRecordReqVO> recordList;

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public List<ThreeBallsMultiBetRecordReqVO> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<ThreeBallsMultiBetRecordReqVO> recordList) {
        this.recordList = recordList;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }
}
