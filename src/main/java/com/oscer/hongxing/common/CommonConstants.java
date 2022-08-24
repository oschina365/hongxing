package com.oscer.hongxing.common;

/**
 *
 * @author kz
 * @version 1.1
 * @date 2021-04-01 14:52
 */
public interface CommonConstants {

	/**
	 * 系统用户名
	 */
	String SYSTEM_USER = "system";

	/**
	 * 删除
	 */
	String STATUS_DEL = "1";

	/**
	 * 正常
	 */
	String STATUS_NORMAL = "0";

	/**
	 * 锁定
	 */
	String STATUS_LOCK = "9";

	/**
	 * 菜单
	 */
	String MENU = "0";

	/**
	 * 编码
	 */
	String UTF8 = "UTF-8";

	/**
	 * 成功标记
	 */
	Integer SUCCESS = 0;

	/**
	 * 失败标记
	 */
	Integer FAIL = 1;

	/**
	 * 树节点的默认根节点
	 */
	String TREE_ROOT = "0";

	/**
	 * 成功/是/能
	 */
	int TRUE = 1;

	/**
	 * 失败/否/不能
	 */
	int FALSE = 0;

	/**
	 * 随机字符串 KEY
	 */
	String SIGN_NONCE_KEY = "nonce";

	/**
	 * 时间戳 KEY
	 */
	String SIGN_TIMESTAMP_KEY = "timestamp";

	/**
	 * 签名类型 KEY
	 */
	String SIGN_SIGN_TYPE_KEY = "sign_type";

	/**
	 * 签名结果 KEY
	 */
	String SIGN_SIGN_KEY = "sign";

	/**
	 * header 中版本信息
	 */
	String VERSION = "VERSION";

	/**
	 * 菜单树根节点
	 */
	Integer MENU_TREE_ROOT_ID = -1;

	/**
	 * 滑块验证码
	 */
	String IMAGE_CODE_TYPE = "blockPuzzle";

	/**
	 * 验证码开关
	 */
	String CAPTCHA_FLAG = "captcha_flag";

	/**
	 * 密码传输是否加密
	 */
	String ENC_FLAG = "enc_flag";

	/**
	 * header 中 授权字段
	 */
	String AUTHORIZATION = "Authorization";

}
