package com.ruoyi.framework.web.service;

import javax.annotation.Resource;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.file.ImageUtils;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.framework.pojo.dos.WxMiniAppLoginResponseDO;
import com.ruoyi.framework.pojo.dos.WxMiniAppLoginUserInfoResponseDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.user.BlackListException;
import com.ruoyi.common.exception.user.CaptchaException;
import com.ruoyi.common.exception.user.CaptchaExpireException;
import com.ruoyi.common.exception.user.UserNotExistsException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.framework.security.context.AuthenticationContextHolder;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 登录校验方法
 * 
 * @author ruoyi
 */
@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;
    
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPermissionService permissionService;

//    微信小程序appId
//    @Value("${wx.minApp.appId}")
//    private String appId;
//
//    //微信小程序密钥
//    @Value("${wx.minApp.appSecret}")
//    private String appSecret;

    //微信登录通过code换取网页授权access_token的URL
    @Value("${wx.minApp.oauth2Url}")
    private String oauth2Url;

    //微信登录拉取用户信息的URL
    @Value("${wx.minApp.userinfoUrl}")
    private String userinfoUrl;

    /**
     * 登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid)
    {
        // 验证码校验
        validateCaptcha(username, code, uuid);
        // 登录前置校验
        loginPreCheck(username, password);
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
            AuthenticationContextHolder.clearContext();
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUserId());
        // 生成token
        return tokenService.createToken(loginUser);
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
            String captcha = redisCache.getCacheObject(verifyKey);
            redisCache.deleteObject(verifyKey);
            if (captcha == null)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
                throw new CaptchaExpireException();
            }
            if (!code.equalsIgnoreCase(captcha))
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
                throw new CaptchaException();
            }
        }
    }

    /**
     * 登录前置校验
     * @param username 用户名
     * @param password 用户密码
     */
    public void loginPreCheck(String username, String password)
    {
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null")));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // IP黑名单校验
        String blackStr = configService.selectConfigByKey("sys.login.blackIPList");
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr()))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("login.blocked")));
            throw new BlackListException();
        }
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr());
        sysUser.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(sysUser);
    }
    /**
     * 小程序一键登录
     * @return token
     */
    public String miniProgramLogin(String code,Long parentUserId){
        //微信小程序获取openId请求地址

        String appId = configService.selectConfigByKey("sys.wechat.appId");
        String appSecret = configService.selectConfigByKey("sys.wechat.appSecret");
//        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";
        String replaceUrl = oauth2Url.replace("{0}", appId).replace("{1}", appSecret).replace("{2}", code);
        String res = HttpUtil.get(replaceUrl);
        WxMiniAppLoginResponseDO response = JSONUtil.toBean(res, WxMiniAppLoginResponseDO.class);
        if (StringUtils.isEmpty(response.getErrcode())){

            //检查数据库种是否有个openId对应的用户，若有，则直接返回token，若没有，则创建用户后再生成token并返回
            SysUser user = userService.getUserByOpenId(response.getOpenid());
            String userName = "";
            if (user == null){
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
                String formattedString = now.format(formatter);

                SysUser regUser = new SysUser();
                userName = "微信用户_" + formattedString;

                String accessToken = response.getAccessToken();
                String openId = response.getOpenid();

//                String usserInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN";
                String usserInfoReplaceUrl = userinfoUrl.replace("{0}", accessToken).replace("{1}", openId);
                String usserInfoRes = HttpUtil.get(usserInfoReplaceUrl);
                WxMiniAppLoginUserInfoResponseDO usserInfoResponse = JSONUtil.toBean(usserInfoRes, WxMiniAppLoginUserInfoResponseDO.class);

                if (StringUtils.isNotEmpty(usserInfoResponse.getErrcode())){
                    throw new ServiceException(StringUtils.format("获取微信用户信息失败，错误编码{}，错误信息：{}",usserInfoResponse.getErrcode(),usserInfoResponse.getErrmsg()));
                }
                String nickName = usserInfoResponse.getNickname();

                if(StringUtils.isNotEmpty(usserInfoResponse.getHeadimgurl())){
                    String avatarImgFileName = ImageUtils.saveUrlImageFile(usserInfoResponse.getHeadimgurl());
                    if(StringUtils.isNotEmpty(avatarImgFileName)){
                        regUser.setAvatar(avatarImgFileName);
                    }
                }

                regUser.setOpenId(response.getOpenid());
                regUser.setUserName(userName);
                regUser.setNickName(nickName);
                regUser.setPassword(SecurityUtils.encryptPassword(configService.selectConfigByKey("sys.user.initPassword")));  //todo 待建立常量类

                regUser.setPayPassword(SecurityUtils.encryptPassword(configService.selectConfigByKey("sys.user.initPassword")));
                regUser.setWalletAddress(ShiroUtils.randomPayAddress());
                regUser.setInviteCode(ShiroUtils.randomSalt());
                regUser.setParentUserId(2l);
                if(parentUserId != null && parentUserId > 0){
//                if(StringUtils.isNotEmpty(inviteCode)) {
                    SysUser parentUser = userService.selectUserById(parentUserId);
                    if(parentUser != null){
                        regUser.setParentUserId(parentUser.getUserId());
                    }
//                    SysUser searchParentUser = new SysUser();
//                    searchParentUser.setInviteCode(inviteCode);
//                    SysUser parentUser = userService.selectUserByInviteCode(searchParentUser);
//                    if (StringUtils.isNotEmpty(parentUser.getInviteCode()) && StringUtils.isNull(parentUser)) {
//                        regUser.setParentUserId(parentUser.getUserId());
//                    }
                }
                regUser.setUserType("02"); //APP用户
                regUser.setRoleIds(new Long[]{3l}); //普通用户
                regUser.setDeptId(103l); //用户

                user = regUser;
                userService.registerUser(user);
            }else{
                userName = user.getUserName();
            }
            UserDetails userDetail = createLoginUser(user);
            LoginUser loginUser = BeanUtil.copyProperties(userDetail, LoginUser.class);
            //记录登录日志
            recordLoginInfo(loginUser.getUserId());
            // 生成token
            return tokenService.createToken(loginUser);
        }else {
            throw new ServiceException(StringUtils.format("获取微信授权信息失败，错误编码{}，错误信息：{}",response.getErrcode(),response.getErrmsg()));
        }
    }

    public UserDetails createLoginUser(SysUser user)
    {
        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
    }
}
