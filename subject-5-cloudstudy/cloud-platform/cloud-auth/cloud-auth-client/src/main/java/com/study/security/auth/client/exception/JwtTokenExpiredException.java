package com.study.security.auth.client.exception;

/**
 * @ClassName JwtTokenExpiredException
 * @Description jwt异常定义
 * @Author 网易云课堂微专业-java高级开发工程师
 * @Date 2019/6/11 15:39
 * @Version 1.0
 */
public class JwtTokenExpiredException extends Exception {
    public JwtTokenExpiredException(String s) {
        super(s);
    }
}
