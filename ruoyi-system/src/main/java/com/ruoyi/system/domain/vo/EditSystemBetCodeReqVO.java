package com.ruoyi.system.domain.vo;

public class EditSystemBetCodeReqVO {
    /** 游戏ID */
    private Long gameId;

    /** 游戏类别 */
    private String gameType;

    /** 期数 */
    private Long periods;

    /** 开奖新号码 */
    private String newOpenCode;

    /** 延迟秒数 */
    private Integer sleepSeconds;

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public String getGameType() {
        return gameType;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public String getNewOpenCode() {
        return newOpenCode;
    }

    public void setNewOpenCode(String newOpenCode) {
        this.newOpenCode = newOpenCode;
    }

    public Integer getSleepSeconds() {
        return sleepSeconds;
    }

    public void setSleepSeconds(Integer sleepSeconds) {
        this.sleepSeconds = sleepSeconds;
    }
}
