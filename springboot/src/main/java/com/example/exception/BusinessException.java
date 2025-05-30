package com.example.exception;

public class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String format, Object... args) {
        super(String.format(format, args));
    }
}
