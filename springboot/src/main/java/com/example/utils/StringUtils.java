package com.example.utils;

public abstract class StringUtils {
    public static boolean hasText(String str) {
        return str != null && !str.trim().isEmpty();
    }
}
