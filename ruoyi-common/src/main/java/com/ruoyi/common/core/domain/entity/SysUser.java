package com.ruoyi.common.core.domain.entity;

import java.util.Date;
import java.util.List;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.annotation.Excel.Type;
import com.ruoyi.common.annotation.Excels;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.xss.Xss;

/**
 * 用户对象 sys_user
 * 
 * @author ruoyi
 */
public class SysUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    @Excel(name = "用户序号", cellType = ColumnType.NUMERIC, prompt = "用户编号")
    private Long userId;

    /** 部门ID */
    @Excel(name = "部门编号", type = Type.IMPORT)
    private Long deptId;

    /** 用户账号 */
    @Excel(name = "登录名称")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户名称")
    private String nickName;

    /** 用户备注名 */
    @Excel(name = "用户备注名")
    private String remarkName;

    /** 用户类型（00系统用户,01平台管理员,02APP用户） */
    private String userType;

    /** 用户邮箱 */
    @Excel(name = "用户邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 用户性别 */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 用户头像 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 最后登录IP */
    @Excel(name = "最后登录IP", type = Type.EXPORT)
    private String loginIp;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Type.EXPORT)
    private Date loginDate;

    /** 余额 */
    private Float amount;

    /** 积分 */
    private Float score;

    /** 支付密码 */
    private String payPassword;

    /** 真实姓名 */
    private String realName;

    /** 身份证号码 */
    private String idcardNo;

    /** 身份证正面图片路径 */
    private String idcardFrontImg;

    /** 身份证反面图片路径 */
    private String idcardBackImg;

    /** 钱包地址 */
    private String walletAddress;

    /** 邀请码 */
    private String inviteCode;

    /** 上级用户ID */
    private Long parentUserId;

    /** 外部OpenId */
    private String openId;

    /** 3球佣金比率 */
    @Excel(name = "3球佣金比率")
    private Float threeBallCommission;

    /** 5球佣金比率 */
    @Excel(name = "5球佣金比率")
    private Float fiveBallCommission;

    /** 10球佣金比率 */
    @Excel(name = "10球佣金比率")
    private Float tenBallCommission;

    /** 3球反水比率 */
    @Excel(name = "3球反水比率")
    private Float threeBallCashback;

    /** 5球反水比率 */
    @Excel(name = "5球反水比率")
    private Float fiveBallCashback;

    /** 10球反水比率 */
    @Excel(name = "10球反水比率")
    private Float tenBallCashback;

    /** 测试用户(0不是,1是) */
    @Excel(name = "测试用户(0不是,1是)")
    private String isTest;

    /** 部门对象 */
    @Excels({
        @Excel(name = "部门名称", targetAttr = "deptName", type = Type.EXPORT),
        @Excel(name = "部门负责人", targetAttr = "leader", type = Type.EXPORT)
    })
    private SysDept dept;

    /** 角色对象 */
    private List<SysRole> roles;

    /** 角色组 */
    private Long[] roleIds;

    /** 岗位组 */
    private Long[] postIds;

    /** 角色ID */
    private Long roleId;

    /** 上级用户昵称 */
    private String parentNickName;



    /** 盈亏金额 */
    private Float totalWinMoney;

    /** 今日金额 */
    private Float todayWinMoney;

    /** 流水金额 */
    private Float totalBetMoney;

    /** 加拿大2.0 */
    private float jnd20;

    /** 加拿大2.8 */
    private float jnd28;

    /** 加拿大3.2 */
    private float jnd32;

    /** 比特2.0 */
    private float jspc28;

    /** 比特2.8 */
    private float bt28;

    /** 极速赛车 */
    private float mssc;

    /** 澳洲幸运5高赔率 */
    private float azxy52;

    /** 澳洲幸运5 */
    private float azxy5;

    /** 澳洲幸运10 */
    private float azxy10;

    /** 澳洲幸运10高赔率 */
    private float azxy102;

    /** 幸运飞艇 */
    private float xyft;

    /** 168极速赛车 */
    private float jssc;

    /** 168极速飞艇 */
    private float jsft;

    /** 168极速赛车高赔率 */
    private float jssc2;

    /** 168极速时时彩 */
    private float jsssc;

    /** 幸运飞艇高赔率 */
    private float xyft2;


    /** 被合并用户ID */
    private Long mergeUserId;

    public SysUser()
    {

    }

    public SysUser(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    @Xss(message = "用户昵称不能包含脚本字符")
    @Size(min = 0, max = 30, message = "用户昵称长度不能超过30个字符")
    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Xss(message = "用户账号不能包含脚本字符")
    @NotBlank(message = "用户账号不能为空")
    @Size(min = 0, max = 30, message = "用户账号长度不能超过30个字符")
    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
    public String getPhonenumber()
    {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getLoginIp()
    {
        return loginIp;
    }

    public void setLoginIp(String loginIp)
    {
        this.loginIp = loginIp;
    }

    public Date getLoginDate()
    {
        return loginDate;
    }

    public void setLoginDate(Date loginDate)
    {
        this.loginDate = loginDate;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public String getPayPassword() {
        return payPassword;
    }

    public void setPayPassword(String payPassword) {
        this.payPassword = payPassword;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcardNo() {
        return idcardNo;
    }

    public void setIdcardNo(String idcardNo) {
        this.idcardNo = idcardNo;
    }

    public String getIdcardFrontImg() {
        return idcardFrontImg;
    }

    public void setIdcardFrontImg(String idcardFrontImg) {
        this.idcardFrontImg = idcardFrontImg;
    }

    public String getIdcardBackImg() {
        return idcardBackImg;
    }

    public void setIdcardBackImg(String idcardBackImg) {
        this.idcardBackImg = idcardBackImg;
    }

    public String getWalletAddress() {
        return walletAddress;
    }

    public void setWalletAddress(String walletAddress) {
        this.walletAddress = walletAddress;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Float getThreeBallCommission() {
        return threeBallCommission;
    }

    public void setThreeBallCommission(Float threeBallCommission) {
        this.threeBallCommission = threeBallCommission;
    }

    public Float getFiveBallCommission() {
        return fiveBallCommission;
    }

    public void setFiveBallCommission(Float fiveBallCommission) {
        this.fiveBallCommission = fiveBallCommission;
    }

    public Float getTenBallCommission() {
        return tenBallCommission;
    }

    public void setTenBallCommission(Float tenBallCommission) {
        this.tenBallCommission = tenBallCommission;
    }

    public Float getThreeBallCashback() {
        return threeBallCashback;
    }

    public void setThreeBallCashback(Float threeBallCashback) {
        this.threeBallCashback = threeBallCashback;
    }

    public Float getFiveBallCashback() {
        return fiveBallCashback;
    }

    public void setFiveBallCashback(Float fiveBallCashback) {
        this.fiveBallCashback = fiveBallCashback;
    }

    public Float getTenBallCashback() {
        return tenBallCashback;
    }

    public void setTenBallCashback(Float tenBallCashback) {
        this.tenBallCashback = tenBallCashback;
    }

    public String getIsTest() {
        return isTest;
    }

    public void setIsTest(String isTest) {
        this.isTest = isTest;
    }

    public SysDept getDept()
    {
        return dept;
    }

    public void setDept(SysDept dept)
    {
        this.dept = dept;
    }

    public List<SysRole> getRoles()
    {
        return roles;
    }

    public void setRoles(List<SysRole> roles)
    {
        this.roles = roles;
    }

    public Long[] getRoleIds()
    {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds)
    {
        this.roleIds = roleIds;
    }

    public Long[] getPostIds()
    {
        return postIds;
    }

    public void setPostIds(Long[] postIds)
    {
        this.postIds = postIds;
    }

    public Long getRoleId()
    {
        return roleId;
    }

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Float getTotalWinMoney() {
        return totalWinMoney;
    }

    public void setTotalWinMoney(Float totalWinMoney) {
        this.totalWinMoney = totalWinMoney;
    }

    public Float getTodayWinMoney() {
        return todayWinMoney;
    }

    public void setTodayWinMoney(Float todayWinMoney) {
        this.todayWinMoney = todayWinMoney;
    }

    public Float getTotalBetMoney() {
        return totalBetMoney;
    }

    public void setTotalBetMoney(Float totalBetMoney) {
        this.totalBetMoney = totalBetMoney;
    }

    public String getParentNickName() {
        return parentNickName;
    }

    public void setParentNickName(String parentNickName) {
        this.parentNickName = parentNickName;
    }

    public float getJnd20() {
        return jnd20;
    }

    public void setJnd20(float jnd20) {
        this.jnd20 = jnd20;
    }

    public float getJnd28() {
        return jnd28;
    }

    public void setJnd28(float jnd28) {
        this.jnd28 = jnd28;
    }

    public float getJnd32() {
        return jnd32;
    }

    public void setJnd32(float jnd32) {
        this.jnd32 = jnd32;
    }

    public float getJspc28() {
        return jspc28;
    }

    public void setJspc28(float jspc28) {
        this.jspc28 = jspc28;
    }

    public float getBt28() {
        return bt28;
    }

    public void setBt28(float bt28) {
        this.bt28 = bt28;
    }

    public float getMssc() {
        return mssc;
    }

    public void setMssc(float mssc) {
        this.mssc = mssc;
    }

    public float getAzxy52() {
        return azxy52;
    }

    public void setAzxy52(float azxy52) {
        this.azxy52 = azxy52;
    }

    public float getAzxy5() {
        return azxy5;
    }

    public void setAzxy5(float azxy5) {
        this.azxy5 = azxy5;
    }

    public float getAzxy10() {
        return azxy10;
    }

    public void setAzxy10(float azxy10) {
        this.azxy10 = azxy10;
    }

    public float getAzxy102() {
        return azxy102;
    }

    public void setAzxy102(float azxy102) {
        this.azxy102 = azxy102;
    }

    public float getXyft() {
        return xyft;
    }

    public void setXyft(float xyft) {
        this.xyft = xyft;
    }

    public float getJssc() {
        return jssc;
    }

    public void setJssc(float jssc) {
        this.jssc = jssc;
    }

    public float getJsft() {
        return jsft;
    }

    public void setJsft(float jsft) {
        this.jsft = jsft;
    }

    public float getJssc2() {
        return jssc2;
    }

    public void setJssc2(float jssc2) {
        this.jssc2 = jssc2;
    }

    public float getJsssc() {
        return jsssc;
    }

    public void setJsssc(float jsssc) {
        this.jsssc = jsssc;
    }

    public float getXyft2() {
        return xyft2;
    }

    public void setXyft2(float xyft2) {
        this.xyft2 = xyft2;
    }

    public Long getMergeUserId() {
        return mergeUserId;
    }

    public void setMergeUserId(Long mergeUserId) {
        this.mergeUserId = mergeUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("deptId", getDeptId())
            .append("userName", getUserName())
            .append("nickName", getNickName())
            .append("email", getEmail())
            .append("phonenumber", getPhonenumber())
            .append("sex", getSex())
            .append("avatar", getAvatar())
            .append("password", getPassword())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("loginIp", getLoginIp())
            .append("loginDate", getLoginDate())
            .append("threeBallCommission", getThreeBallCommission())
            .append("fiveBallCommission", getFiveBallCommission())
            .append("tenBallCommission", getTenBallCommission())
            .append("threeBallCashback", getThreeBallCashback())
            .append("fiveBallCashback", getFiveBallCashback())
            .append("tenBallCashback", getTenBallCashback())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("dept", getDept())
            .toString();
    }
}
