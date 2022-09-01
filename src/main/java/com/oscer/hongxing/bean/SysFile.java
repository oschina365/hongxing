package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.Date;

/**
 * <p>
 * 文件系统表
 * </p>
 *
 * @author kz
 * @since 2018-01-18
 */
@Data
public class SysFile extends Entity {

    private static final long serialVersionUID = 1L;
    /**
     * 用户ID
     */
    private long user_id;
    /**
     * 文件名称
     */
    private String file_name;
    /**
     * 大小
     */
    private long file_size;
    /**
     * 七牛KEY名
     */
    private String file_key;
    /**
     * 后缀
     */
    private String file_suffix;
    /**
     * 图片类型
     */
    private String file_type;
    /**
     * 路径
     */
    private String file_path;
    /**
     * 微信素材ID
     */
    private String media_id;
    /**
     * 文件上传成功状态（成功：0 失败 ：-1）
     */
    private Integer file_status;


}
