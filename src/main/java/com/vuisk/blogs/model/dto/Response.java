package com.vuisk.blogs.model.dto;

import java.io.Serializable;


/**
 * Thông tin trả về cho mọi function của webservice
 *
 * @author PhuongDT
 *
 */
public class Response<T> implements Serializable {

    /**
     * Function có thành công hay không
     */
    private boolean success;
    /**
     * *
     * Mã trả về của function
     */
    private long code;
    /**
     * Message thông báo từ function
     */
    private String message;
    /**
     * Dữ liệu trả về của function
     */
    private T data;

    public Response() {
    }

    public Response(boolean success) {
        this.success = success;
    }

    public Response(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public Response(boolean success, String message, long code) {
        this.success = success;
        this.message = message;
        this.code = code;
    }

    public Response(boolean success, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public Response(boolean success, String message, long code, T data) {
        this.success = success;
        this.message = message;
        this.code = code;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

}
