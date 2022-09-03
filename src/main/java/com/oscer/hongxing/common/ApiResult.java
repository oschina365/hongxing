package com.oscer.hongxing.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

public class ApiResult<T> {

    private int code;
    private String message;
    private T result;

    public static int success = 1;
    public static int fail = 0;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    public ApiResult() {
        this(0, "其他未知异常", null);
    }

    public ApiResult(int code, String message, T result) {
        this.code = code;
        this.message = message;
        this.result = result;
        this.time = new Date();
    }

    public ApiResult(int code, String message, Object list, Long count) {

        this.code = code;
        this.message = message;
        this.result = (T) new MapData(list, count);
        this.time = new Date();
    }

    @Data
    @AllArgsConstructor
    public static class MapData {
        private Object list;
        private Long count;
    }

    public static ApiResult success() {
        return new ApiResult(success, "success", null);
    }

    public static ApiResult success(String message) {
        return new ApiResult(success, message, "");
    }

    public static ApiResult successWithObject(Object object, String message) {
        return new ApiResult(success, message, object);
    }

    public static ApiResult successWithMapData(Object list, Long count, String message) {
        return new ApiResult(success, message, list, count);
    }

    public static ApiResult successWithObject(Object object) {
        return new ApiResult(success, "success", object);
    }

    public static ApiResult fail() {
        return new ApiResult(fail, null, null);
    }

    public static ApiResult failWithMessage(String message) {
        return new ApiResult(fail, message, null);
    }

    public static ApiResult failWithMessageAndObject(String message, Object object) {
        return new ApiResult(fail, message, object);
    }

    public String json() {
        return JSON.toJSONString(this);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }
}
