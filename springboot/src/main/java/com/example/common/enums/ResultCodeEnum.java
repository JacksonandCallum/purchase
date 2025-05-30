package com.example.common.enums;

import lombok.Getter;

public enum ResultCodeEnum {
    SUCCESS("200", "成功"),

    PARAM_ERROR("400", "参数异常"),
    TOKEN_INVALID_ERROR("401", "无效的token"),
    TOKEN_CHECK_ERROR("401", "token验证失败，请重新登录"),
    PARAM_LOST_ERROR("4001", "参数缺失"),
    EXCEL_IS_NULL("4002","excel表数据为空"),
    DATA_IS_NULL("4003","未找到数据"),
    SKU_MATCH_ERROR("4004","sku匹配数据不存在"),
    SKU_IS_NULL("4005","sku为空"),
    IMPORT_ERROR("4006","导入数据时出现错误"),
    FILE_READ_ERROR("4007","读取文件时出现错误"),

    SYSTEM_ERROR("500", "系统异常"),
    USER_EXIST_ERROR("5001", "用户名已存在"),
    USER_NOT_LOGIN("5002", "用户未登录"),
    USER_ACCOUNT_ERROR("5003", "账号或密码错误"),
    USER_NOT_EXIST_ERROR("5004", "用户不存在"),
    PARAM_PASSWORD_ERROR("5005", "原密码输入错误"),
    INVITE_CODE_ERROR("5006","邀请码不存在 || 邀请码已被使用 || 邀请码已过期")
    ;

    public final String code;
    public final String msg;

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    ResultCodeEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
