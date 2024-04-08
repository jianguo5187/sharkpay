package com.ruoyi.framework.web.service;

import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.file.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.user.CaptchaException;
import com.ruoyi.common.exception.user.CaptchaExpireException;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 注册校验方法
 * 
 * @author ruoyi
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword(), payPassword = registerBody.getPayPassword();
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);
        sysUser.setNickName(registerBody.getNickName());
        sysUser.setEmail(registerBody.getEmail());
        sysUser.setPhonenumber(registerBody.getPhonenumber());
        sysUser.setRealName(registerBody.getRealName());
        sysUser.setIdcardNo(registerBody.getIdcardNo());
        sysUser.setInviteCode(registerBody.getInviteCode());

        // 验证码开关
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (StringUtils.isEmpty(sysUser.getPhonenumber()))
        {
            msg = "手机号码不能为空";
        }
        else if (StringUtils.isEmpty(payPassword))
        {
            msg = "支付密码不能为空";
        }
        else if (StringUtils.isEmpty(sysUser.getRealName()))
        {
            msg = "真实姓名不能为空";
        }
        else if (StringUtils.isEmpty(sysUser.getIdcardNo()))
        {
            msg = "身份证号码不能为空";
        }
//        else if (StringUtils.isEmpty(registerBody.getIdcardBackImg()))
//        {
//            msg = "身份证正面图片不能为空";
//        }
//        else if (StringUtils.isEmpty(registerBody.getIdcardBackImg()))
//        {
//            msg = "身份证反面图片不能为空";
//        }
        else if (StringUtils.isEmpty(sysUser.getInviteCode()))
        {
            msg = "邀请码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (!userService.checkUserNameUnique(sysUser))
        {
            msg = "注册用户'" + username + "'失败，注册账号已存在";
        }
        else if (!userService.checkPhoneUnique(sysUser))
        {
            msg = "注册用户'" + username + "'失败，手机号码已存在";
        }
        else if (StringUtils.isNotEmpty(sysUser.getEmail()) && !userService.checkEmailUnique(sysUser))
        {
            msg = "注册用户'" + username + "'失败，邮箱账号已存在";
        }
        else
        {
            SysUser parentUser = userService.selectUserByInviteCode(sysUser);

            if(StringUtils.isNull(parentUser) ) {
                msg = "注册用户'" + username + "'失败，邀请码不存在";
            }else{
                if(StringUtils.isNotEmpty(registerBody.getAvatar())){
                    String avatarImgFileName = ImageUtils.savaBase64ImageFile(registerBody.getAvatar());
                    if(StringUtils.isNotEmpty(avatarImgFileName)){
                        sysUser.setAvatar(avatarImgFileName);
                    }
                }

                if(StringUtils.isNotEmpty(registerBody.getIdcardFrontImg())){
                    String idcardFrontImgFileName = ImageUtils.savaBase64ImageFile(registerBody.getIdcardFrontImg());
                    if(StringUtils.isNotEmpty(idcardFrontImgFileName)){
                        sysUser.setIdcardFrontImg(idcardFrontImgFileName);
                    }else{
                        return "注册用户'" + username + "'失败，身份证正面图片添加失败";
                    }
                }
                if(StringUtils.isNotEmpty(registerBody.getIdcardBackImg())) {
                    String idcardBackImgFileName = ImageUtils.savaBase64ImageFile(registerBody.getIdcardBackImg());
                    if (StringUtils.isNotEmpty(idcardBackImgFileName)) {
                        sysUser.setIdcardBackImg(idcardBackImgFileName);
                    } else {
                        return "注册用户'" + username + "'失败，身份证反面图片添加失败";
                    }
                }

//                sysUser.setNickName(username);
                sysUser.setPassword(SecurityUtils.encryptPassword(password));
                sysUser.setPayPassword(SecurityUtils.encryptPassword(payPassword));
                sysUser.setWalletAddress(ShiroUtils.randomPayAddress());
                sysUser.setInviteCode(ShiroUtils.randomSalt());
                sysUser.setParentUserId(parentUser.getUserId());
                sysUser.setUserType("02"); //APP用户
                sysUser.setRoleIds(new Long[]{3l}); //普通用户
                sysUser.setDeptId(103l); //用户

                boolean regFlag = userService.registerUser(sysUser);
                if (!regFlag)
                {
                    msg = "注册失败,请联系系统管理人员";
                }
                else
                {
                    AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
                }
            }
        }
        return msg;
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
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
