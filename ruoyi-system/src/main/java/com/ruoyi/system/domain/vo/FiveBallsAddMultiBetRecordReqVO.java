package com.ruoyi.system.domain.vo;

import java.util.List;

public class FiveBallsAddMultiBetRecordReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 期数 */
    private Long periods;

    /** 追号区分（0否 1是） */
    private String autoBetFlg;

    /** 期数 */
    private List<FiveBallsMultiBetRecordReqVO> recordList;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public List<FiveBallsMultiBetRecordReqVO> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<FiveBallsMultiBetRecordReqVO> recordList) {
        this.recordList = recordList;
    }

    public String getAutoBetFlg() {
        return autoBetFlg;
    }

    public void setAutoBetFlg(String autoBetFlg) {
        this.autoBetFlg = autoBetFlg;
    }
}
