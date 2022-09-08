package com.oscer.hongxing.common;

import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 响应信息主体
 *
 * @author jmy
 * @version 1.1
 * @date 2021-04-01 14:52
 */
@Builder
@ToString
@AllArgsConstructor
@Accessors(chain = true)
public class R<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    @Getter
    @Setter
    private int code;

    @Getter
    @Setter
    private String msg = "success";

    @Getter
    @Setter
    private T data;

    @Getter
    @Setter
    private long count;

    public R() {
        super();
    }

    public R(T data) {
        super();
        this.data = data;
    }

    /**
     * 异常返回
     *
     * @param e
     */
    public R(Throwable e) {
        super();
        this.msg = e.getMessage();
        this.code = CommonConstants.FAIL;
    }

    /**
     * 只返回成功失败，不返回原因
     *
     * @param success
     */
    public R(Boolean success) {
        super();
        this.code = success ? CommonConstants.SUCCESS : CommonConstants.FAIL;
    }

    /**
     * 返回成功失败，也返回原因
     *
     * @param success
     * @param msg
     */
    public R(Boolean success, String msg) {
        super();
        this.code = success ? CommonConstants.SUCCESS : CommonConstants.FAIL;
        this.msg = msg;
    }

    /**
     * 失败返回
     *
     * @param data
     * @param msg
     */
    public R(T data, String msg) {
        super();
        this.data = data;
        this.msg = msg;
    }

    /**
     * 只返回成功
     *
     * @param <T>
     * @return
     */
    public static <T> R<T> ok() {
        return restResult(null, CommonConstants.SUCCESS, null);
    }

    /**
     * 成功及原因
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> R<T> ok(T data) {
        return restResult(data, CommonConstants.SUCCESS, null);
    }

    /**
     * 成功及原因
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> R<T> ok(T data, Long count) {
        return restResult(data, CommonConstants.SUCCESS, null, count);
    }

    /**
     * 返回成功和msg
     *
     * @param data
     * @param msg
     * @param <T>
     * @return
     */
    public static <T> R<T> ok(T data, String msg) {
        return restResult(data, CommonConstants.SUCCESS, msg);
    }

    /**
     * 失败返回
     *
     * @param <T>
     * @return
     */
    public static <T> R<T> failed() {
        return restResult(null, CommonConstants.FAIL, null);
    }

    /**
     * 失败以及原因
     *
     * @param msg
     * @param <T>
     * @return
     */
    public static <T> R<T> failed(String msg) {
        return restResult(null, CommonConstants.FAIL, msg);
    }

    /**
     * 失败和数据
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> R<T> failed(T data) {
        return restResult(data, CommonConstants.FAIL, null);
    }

    /**
     * 失败，数据和失败原因
     *
     * @param data
     * @param msg
     * @param <T>
     * @return
     */
    public static <T> R<T> failed(T data, String msg) {
        return restResult(data, CommonConstants.FAIL, msg);
    }

    /**
     * 结果基础构造
     *
     * @param data
     * @param code
     * @param msg
     * @param <T>
     * @return
     */
    private static <T> R<T> restResult(T data, int code, String msg) {
        R<T> apiResult = new R<>();
        apiResult.setCode(code);
        apiResult.setData(data);
        apiResult.setMsg(msg);
        return apiResult;
    }

    /**
     * 结果基础构造
     *
     * @param data
     * @param code
     * @param msg
     * @param <T>
     * @return
     */
    private static <T> R<T> restResult(T data, int code, String msg, Long count) {
        R<T> apiResult = new R<>();
        apiResult.setCode(code);
        apiResult.setData(data);
        apiResult.setMsg(msg);
        apiResult.setCount(count);
        return apiResult;
    }

    /**
     * 判断返回结果是否是成功
     *
     * @return
     */
    public boolean isSuccess() {
        return CommonConstants.SUCCESS == this.getCode();
    }

}
