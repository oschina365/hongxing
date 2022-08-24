package com.oscer.hongxing.bean;


import com.oscer.hongxing.dao.UserDAO;
import com.oscer.hongxing.db.DbQuery;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户列表
 */
@Entity.Cache(region = "User")
@Data
@Slf4j
public class User extends Entity implements Serializable {

    public final static User ME = new User();
    /**
     * 用户权限
     */
    public final static int ROLE_GENERAL = 1;
    /**
     * 保密
     */
    public static final int SEX_UNKONW = 0;
    /**
     * 男
     */
    public static final int SEX_BOY = 1;
    /**
     * 女
     */
    public static final int SEX_GIRL = 2;

    /**
     * 用户名(登录名,如jack)
     */
    private String username;
    /**
     * 密码(明文)
     */
    private String password;
    /**
     * 密码（加密）
     */
    private String salt;
    /**
     * 头像
     */
    private String headimg;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 手机
     */
    private String phone;
    /**
     * 微信
     */
    private String wx;
    /**
     * 微信二维码加好友，图片地址
     */
    private String wx_qrcode;
    /**
     * 微信二维码收款码，图片地址
     */
    private String wx_pay_qrcode;
    /**
     * 性别（0：保密 1：男 2：女）
     */
    private Integer sex;
    /**
     * 自我简介
     */
    private String self_info;
    /**
     * 最后登录时间
     */
    private Date login_time;
    /**
     * 登出时间(手动登出,系统登出即session超时时间)
     */
    private Date logout_time;

    /**
     * 正常=0  冻结=1
     */
    private Integer state;

    /**
     * 登录IP
     */
    private String login_ip;
    /**
     * 登录IP
     */
    private String update_ip;

    /**
     * 用户是否在线
     * 登录状态（0:下线 1:上线）
     */
    private int online;
    /**
     * 个性域名
     */
    private String ident;


    private String token;

    private Long expires_in;

    /**
     * 用户是否正常
     *
     * @return
     */
    public boolean status_is_normal() {
        if (this != null && this.getState() == Entity.STATUS_NORMAL) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 校验密码
     *
     * @param input_pwd
     * @param user
     * @return
     */
    public boolean _ValidatePwd(String input_pwd, User user) {
        if (StringUtils.isBlank(input_pwd) || user == null || user.getId() <= 0L) {
            return false;
        }
        if (input_pwd.equals(user.getSalt())) {
            return true;
        }
        return _GeneratePwdHash(input_pwd, user).equals(user.getSalt());
    }

    /**
     * 生成密码哈希
     *
     * @param input_pwd
     * @param user
     * @return
     */
    public String _GeneratePwdHash(String input_pwd, User user) {
        System.out.println(String.format("salt:%s", DigestUtils.shaHex(user.getPhone() + "->" + DigestUtils.shaHex(input_pwd))));
        return DigestUtils.shaHex(user.getPhone() + "->" + DigestUtils.shaHex(input_pwd));
    }

    /**
     * 生成密码哈希
     *
     * @param input_pwd
     * @param email
     * @return
     */
    public String _GeneratePwdHash(String input_pwd, String email) {
        return DigestUtils.shaHex(email + "->" + DigestUtils.shaHex(input_pwd));
    }

    /**
     * 通过个性域名,邮箱,手机号码查询用户信息，然后对比输入的密码
     *
     * @param ident
     * @return
     */
    public User _GeneratePwdHashCommon(String ident) {
        String sql = "select id from users where ident =? or email = ? or phone = ? or username=? ";
        Number n = DbQuery.get("mysql").read(Number.class, sql, ident, ident, ident, ident);
        if (n != null && n.longValue() > 0L) {
            return User.ME.get(n.longValue());
        }
        return null;
    }

    /**
     * 通过个性域名
     *
     * @param ident
     * @return
     */
    public boolean _GeneratePwdHashCommonBoolean(String input_pwd, String ident) {
        User u = _GeneratePwdHashCommon(ident);
        if (u != null) {
            return _ValidatePwd(input_pwd, u);
        }
        System.out.println("用户不存在");
        return false;
    }
}
