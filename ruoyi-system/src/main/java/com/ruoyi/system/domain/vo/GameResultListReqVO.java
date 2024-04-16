package com.ruoyi.system.domain.vo;

public class GameResultListReqVO {

    /** 游戏ID */
    private Long gameId;

    /** 页数 */
    private Integer pageNumber;

    /** 每页件数 */
    private Integer pageRowCount;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageRowCount() {
        return pageRowCount;
    }

    public void setPageRowCount(Integer pageRowCount) {
        this.pageRowCount = pageRowCount;
    }
}
