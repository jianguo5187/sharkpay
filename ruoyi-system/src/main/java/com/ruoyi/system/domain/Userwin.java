package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户盈亏对象 userwin
 *
 * @author ruoyi
 * @date 2024-03-24
 */
public class Userwin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户盈亏ID */
    private Long id;

    /** 盈亏时间(YMD) */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "盈亏时间(YMD)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date winTime;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 今日盈亏金额 */
    @Excel(name = "今日盈亏金额")
    private Float winMoney;

    /** 大小单双盈亏金额 */
    @Excel(name = "大小单双盈亏金额")
    private Float bigSmallMoney;

    /** 其他盈亏金额 */
    @Excel(name = "其他盈亏金额")
    private Float otherMoney;

    /** 混合盈亏金额 */
    @Excel(name = "混合盈亏金额")
    private Float combinationMoney;

    /** 扣除金额 */
    @Excel(name = "扣除金额")
    private Float deductMoney;

    /** 反水金额 */
    @Excel(name = "反水金额")
    private Float cashBackMoney;

    /** 佣金金额 */
    @Excel(name = "佣金金额")
    private Float commissionMoney;

    /** 是否删除(0否 1是) */
    @Excel(name = "是否删除(0否 1是)")
    private String isDelete;

    /** 是否反水(0否 1是) */
    @Excel(name = "是否反水(0否 1是)")
    private String isCashBack;

    /** 是否佣金结算(0否 1是) */
    @Excel(name = "是否佣金结算(0否 1是)")
    private String isCommission;

    /** 数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限；5：仅本人数据权限） */
    private String dataScope;

    /** 反水状态(0否 1是) */
    private String cashBackStatus;

    /** 返佣状态(0否 1是) */
    private String commissionStatus;

    /** 盈亏时间筛选(yyyy-MM-dd) */
    private String filterDay;

    /** 用户昵称 */
    private String nickName;

    /** 上级用户ID */
    private Long parentUserId;

    /** 测试用户标识 */
    private Boolean includeTestUserFlg;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setWinTime(Date winTime)
    {
        this.winTime = winTime;
    }

    public Date getWinTime()
    {
        return winTime;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setGameId(Long gameId)
    {
        this.gameId = gameId;
    }

    public Long getGameId()
    {
        return gameId;
    }
    public void setGameName(String gameName)
    {
        this.gameName = gameName;
    }

    public String getGameName()
    {
        return gameName;
    }
    public void setWinMoney(Float winMoney)
    {
        this.winMoney = winMoney;
    }

    public Float getWinMoney()
    {
        return winMoney;
    }

    public Float getBigSmallMoney() {
        return bigSmallMoney;
    }

    public void setBigSmallMoney(Float bigSmallMoney) {
        this.bigSmallMoney = bigSmallMoney;
    }

    public Float getOtherMoney() {
        return otherMoney;
    }

    public void setOtherMoney(Float otherMoney) {
        this.otherMoney = otherMoney;
    }

    public void setCombinationMoney(Float combinationMoney)
    {
        this.combinationMoney = combinationMoney;
    }

    public Float getCombinationMoney()
    {
        return combinationMoney;
    }

    public Float getDeductMoney() {
        return deductMoney;
    }

    public void setDeductMoney(Float deductMoney) {
        this.deductMoney = deductMoney;
    }

    public Float getCashBackMoney() {
        return cashBackMoney;
    }

    public void setCashBackMoney(Float cashBackMoney) {
        this.cashBackMoney = cashBackMoney;
    }

    public Float getCommissionMoney() {
        return commissionMoney;
    }

    public void setCommissionMoney(Float commissionMoney) {
        this.commissionMoney = commissionMoney;
    }

    public void setIsDelete(String isDelete)
    {
        this.isDelete = isDelete;
    }

    public String getIsDelete()
    {
        return isDelete;
    }

    public void setIsCashBack(String isCashBack)
    {
        this.isCashBack = isCashBack;
    }

    public String getIsCashBack()
    {
        return isCashBack;
    }
    public void setIsCommission(String isCommission)
    {
        this.isCommission = isCommission;
    }

    public String getIsCommission()
    {
        return isCommission;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    public String getCashBackStatus() {
        return cashBackStatus;
    }

    public void setCashBackStatus(String cashBackStatus) {
        this.cashBackStatus = cashBackStatus;
    }

    public String getCommissionStatus() {
        return commissionStatus;
    }

    public void setCommissionStatus(String commissionStatus) {
        this.commissionStatus = commissionStatus;
    }

    public String getFilterDay() {
        return filterDay;
    }

    public void setFilterDay(String filterDay) {
        this.filterDay = filterDay;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Boolean getIncludeTestUserFlg() {
        return includeTestUserFlg;
    }

    public void setIncludeTestUserFlg(Boolean includeTestUserFlg) {
        this.includeTestUserFlg = includeTestUserFlg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("winTime", getWinTime())
            .append("userId", getUserId())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("winMoney", getWinMoney())
            .append("bigSmallMoney", getBigSmallMoney())
            .append("otherMoney", getOtherMoney())
            .append("combinationMoney", getCombinationMoney())
            .append("deductMoney", getDeductMoney())
            .append("cashBackMoney", getCashBackMoney())
            .append("commissionMoney", getCommissionMoney())
            .append("isDelete", getIsDelete())
            .append("isCashBack", getIsCashBack())
            .append("isCommission", getIsCommission())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
