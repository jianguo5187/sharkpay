package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户资金流水对象 usermoney
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public class Usermoney extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户资金流水ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 资金流水内容 */
    @Excel(name = "资金流水内容")
    private String cashContent;

    /** 资金流水时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "资金流水时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date cashTime;

    /** 流水金额 */
    @Excel(name = "流水金额")
    private Float cashMoney;

    /** 1、申请充值、2、充值成功3、充值失败4、申请提现5、提现成功6、提现失败7、购买彩票8、彩票中奖9、彩票撤单 10、下线创收 11、提取返利 12、代理佣金13、代理金额由于下线开奖变动14、代理金额转入15、代理金额转出16.牛牛押金返还 */
    @Excel(name = "1、申请充值、2、充值成功3、充值失败4、申请提现5、提现成功6、提现失败7、购买彩票8、彩票中奖9、彩票撤单 10、下线创收 11、提取返利 12、代理佣金13、代理金额由于下线开奖变动14、代理金额转入15、代理金额转出16.牛牛押金返还")
    private String type;

    /** 账户剩余金额 */
    @Excel(name = "账户剩余金额")
    private Float userBalance;

    /** 提现账户ID */
    @Excel(name = "提现账户ID")
    private Long unionPayId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 支付方式 */
    @Excel(name = "支付方式")
    private String userPay;

    /** 账户名 */
    @Excel(name = "账户名")
    private String userAccount;

    /** 管理员上下分备注信息 */
    @Excel(name = "管理员上下分备注信息")
    private String cashDescribe;

    /** 游戏ID */
    @Excel(name = "游戏ID")
    private Long gameId;

    /** 游戏名 */
    @Excel(name = "游戏名")
    private String gameName;

    /** 房间号 */
    @Excel(name = "房间号")
    private Integer house;

    /** 是否删除(0否 1是) */
    @Excel(name = "是否删除(0否 1是)")
    private String isDelete;

    /** 是否合庄模式 */
    @Excel(name = "是否合庄模式")
    private String hzId;

    /** 数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限；5：仅本人数据权限） */
    private String dataScope;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setCashContent(String cashContent) 
    {
        this.cashContent = cashContent;
    }

    public String getCashContent() 
    {
        return cashContent;
    }
    public void setCashTime(Date cashTime) 
    {
        this.cashTime = cashTime;
    }

    public Date getCashTime() 
    {
        return cashTime;
    }
    public void setCashMoney(Float cashMoney) 
    {
        this.cashMoney = cashMoney;
    }

    public Float getCashMoney() 
    {
        return cashMoney;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setUserBalance(Float userBalance)
    {
        this.userBalance = userBalance;
    }

    public Float getUserBalance()
    {
        return userBalance;
    }
    public void setUnionPayId(Long unionPayId) 
    {
        this.unionPayId = unionPayId;
    }

    public Long getUnionPayId() 
    {
        return unionPayId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setUserPay(String userPay) 
    {
        this.userPay = userPay;
    }

    public String getUserPay() 
    {
        return userPay;
    }
    public void setUserAccount(String userAccount) 
    {
        this.userAccount = userAccount;
    }

    public String getUserAccount() 
    {
        return userAccount;
    }
    public void setCashDescribe(String cashDescribe) 
    {
        this.cashDescribe = cashDescribe;
    }

    public String getCashDescribe() 
    {
        return cashDescribe;
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
    public void setHouse(Integer house) 
    {
        this.house = house;
    }

    public Integer getHouse() 
    {
        return house;
    }
    public void setIsDelete(String isDelete) 
    {
        this.isDelete = isDelete;
    }

    public String getIsDelete() 
    {
        return isDelete;
    }
    public void setHzId(String hzId) 
    {
        this.hzId = hzId;
    }

    public String getHzId() 
    {
        return hzId;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("cashContent", getCashContent())
            .append("cashTime", getCashTime())
            .append("cashMoney", getCashMoney())
            .append("type", getType())
            .append("userBalance", getUserBalance())
            .append("unionPayId", getUnionPayId())
            .append("userName", getUserName())
            .append("userPay", getUserPay())
            .append("userAccount", getUserAccount())
            .append("cashDescribe", getCashDescribe())
            .append("gameId", getGameId())
            .append("gameName", getGameName())
            .append("house", getHouse())
            .append("isDelete", getIsDelete())
            .append("hzId", getHzId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
