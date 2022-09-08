package com.oscer.hongxing.dao;


import com.oscer.hongxing.bean.SendEmailRecord;
import com.oscer.hongxing.bean.User;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.FormatTool;
import com.oscer.hongxing.common.LinkTool;
import com.oscer.hongxing.db.CacheMgr;
import com.oscer.hongxing.enums.EmailTemplateTypeEnum;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.oscer.hongxing.bean.Entity.ONLINE;


public class UserDAO extends CommonDao<User> {

    public static final UserDAO ME = new UserDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public User read(long id) {
        setSql("select id from users where id =?");
        return getDbQuery().read(User.class, getSql(), id);
    }

    public User getUserByUserNameOrPhone(String key) {
        String sql = "select * from users where (username = ? OR phone = ? OR email = ?) limit 1";
        return getDbQuery().read(User.class, sql, key, key, key);
    }

    public void logout(long id) {
        String sql = "update users set logout_time=now(),online=0 where id=?";
        getDbQuery().update(sql, id);
        CacheMgr.evict(getCache_region(), String.valueOf(id));
    }

    /**
     * 查询用户
     *
     * @param id
     * @return
     */
    public User getById(long id) {
        return User.ME.get(id);
    }

    public User getByIdent(String ident) {
        if (StringUtils.isBlank(ident)) {
            return null;
        }
        String sql = "select id from users where ident =?";
        Number n = getDbQuery().read(Number.class, sql, ident);
        if (n == null || n.longValue() <= 0L) {
            return null;
        }
        return User.ME.get(n.longValue());
    }

    /**
     * 查询用户
     *
     * @param str
     * @return
     */
    public User getUser(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        User user = null;
        user = getByUsername(str);
        if (null != user) {
            return user;
        }
        user = getByNickname(str);
        if (null != user) {
            return user;
        }
        user = getByname(str);
        if (null != user) {
            return user;
        }
        return null;
    }

    /**
     * 根据用户名(注册名)查询
     *
     * @param username
     * @return
     */
    public User getByUsername(String username) {
        String sql = "select id from users where username=?";
        return User.ME.getById(User.ME, sql, username);
    }

    /**
     * 根据用户个性名查询
     *
     * @param nickname
     * @return
     */
    public User getByNickname(String nickname) {
        String sql = "select id from users where nickname=?";
        return User.ME.getById(User.ME, sql, nickname);
    }

    /**
     * 根据用户真实名查询
     *
     * @param name
     * @return
     */
    public User getByname(String name) {
        String sql = "select id from users where name=?";
        return User.ME.getById(User.ME, sql, name);
    }

    /**
     * 用户空间链接
     *
     * @param id
     * @return
     */
    public String user_link(long id) {
        if (id <= 0L) {
            return null;
        }
        String root = LinkTool.root();
        StringBuilder sb = new StringBuilder(root);
        if (root.length() > 0 && root.charAt(0) != '/') {
            sb.append('/');
        }
        User u = User.ME.get(id);
        if (StringUtils.isNotBlank(u.getIdent())) {
            sb.append("u/" + u.getIdent());
        } else {
            sb.append("u/" + id);
        }

        return sb.toString();
    }

    /**
     * 查询今天已签到的人数
     *
     * @return
     */
    public int count_signed_today() {
        String sql = "select count(id) from users where score_today >0";
        return getDbQuery().stat_cache(getCache_region(), "count_signed_today", sql);
    }

    public void evict_count_signed_today() {
        CacheMgr.evict(getCache_region(), "count_signed_today");
    }

    /**
     * 登录
     *
     * @param username
     * @param password
     * @param ip
     * @param openid     是否是第三方
     * @param providerId
     * @return
     * @throws IOException
     */
    public ApiResult login(String username, String password, String ip, boolean openid, String providerId) throws IOException {
        if (StringUtils.isEmpty(username)) {
            return ApiResult.failWithMessage("请填写用户名~");
        }
        if (StringUtils.isEmpty(password)) {
            return ApiResult.failWithMessage("请填写密码~");
        }

        User user = getByUsername(username);
        if (user == null) {
            return ApiResult.failWithMessage("该用户不存在~");
        }
        if (user.getState() != 0) {
            return ApiResult.failWithMessage("该账户已被封~");
        }
        if (user._ValidatePwd(password, user)) {
            Map<String, Object> map = new HashMap<>();
            map.put("login_time", new Date());
            map.put("login_ip", ip);
            map.put("online", ONLINE);
            user.updateFields(map);
            return ApiResult.successWithObject(user, "登录成功");
        } else {
            return ApiResult.failWithMessage("密码错误~");
        }
    }

    /**
     * 根据邮箱查找用户
     *
     * @param email
     * @return
     */
    public User selectByEmail(String email) {
        if (StringUtils.isBlank(email)) {
            return null;
        }
        String sql = "select * from users where email =?";
        return getDbQuery().read(User.class, sql, email);
    }

    /**
     * 根据邮箱查找用户
     *
     * @param username
     * @param email
     * @return
     */
    public User selectByNameAndEmail(String username, String email) {
        if (StringUtils.isBlank(username) || StringUtils.isBlank(email)) {
            return null;
        }
        String sql = "select * from users where username=? and email =? and status=0";
        return getDbQuery().read(User.class, sql, username, email);
    }

    /**
     * 注册账号校验
     *
     * @param user
     * @param code
     * @return
     */
    public ApiResult checkRegisterForm(User user, String code) {
        if (user == null || StringUtils.isBlank(user.getUsername())) {
            return ApiResult.failWithMessage("请填写用户名");
        }
        if (StringUtils.isBlank(user.getEmail())) {
            return ApiResult.failWithMessage("请填写邮箱");
        }
        if (!FormatTool.is_email(user.getEmail())) {
            return ApiResult.failWithMessage("请填写合法邮箱");
        }

        if (selectByEmail(user.getEmail()) != null) {
            return ApiResult.failWithMessage("该邮箱已被注册");
        }
        if (StringUtils.isBlank(user.getPassword())) {
            return ApiResult.failWithMessage("请填写密码");
        }
        if (user.getPassword().length() < 6) {
            return ApiResult.failWithMessage("密码至少6位");
        }
        if (StringUtils.isEmpty(code)) {
            return ApiResult.failWithMessage("请填写验证码");
        }

        return ApiResult.success();
    }


    /**
     * 注册账号
     *
     * @param user
     * @param code
     * @return
     */
    public ApiResult register(User user, String code) {
        ApiResult result = checkRegisterForm(user, code);
        if (result != null && result.getCode() == ApiResult.fail) {
            return result;
        }
        user.setSalt(User.ME._GeneratePwdHash(user.getPassword(), user));
        user.setHeadimg("http://img.oscer.net/avatar/" + (int) (Math.random() * 12) + ".jpg");
        user.save();
        SendEmailRecord record = SendEmailRecordDAO.ME.selectByEmail(user.getEmail(), SendEmailRecord.TYPE_WEB, EmailTemplateTypeEnum.TYPE.REGISTER.getKey());
        if (record != null && record.getId() > 0) {
            record.setReceiver(user.getId());
            record.setUpdate_time(new Date());
            record.doUpdate();
        }
        return ApiResult.success("注册成功");
    }
}
