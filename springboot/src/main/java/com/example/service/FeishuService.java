package com.example.service;

import com.example.dto.feishu.FeishuUserInfo;
import com.example.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;


@Service
@Slf4j
public class FeishuService {
    @Value("${feishu.app-id}")
    private String appId;

    @Value("${feishu.app-secret}")
    private String appSecret;

    private final RestTemplate restTemplate;
    private final RedisTemplate<String,String> redisTemplate;

    private static final String ACCESS_TOKEN_KEY = "feishu:access_token";
    private static final String USER_CACHE_PREFIX = "feishu:user:";

    @Autowired
    public FeishuService(RestTemplate restTemplate, RedisTemplate<String,String> redisTemplate) {
        this.restTemplate = restTemplate;
        this.redisTemplate = redisTemplate;
    }

    @Cacheable(value = "feishuUser",key = "#email")
    public FeishuUserInfo getFeishuUser(String email) {
        String accessToken = getAccessToken();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        String url = "https://open.feishu.cn/open-apis/contact/v3/users?emails=" + email;
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET,new HttpEntity<>(headers),Map.class);
        if(response.getStatusCode() == HttpStatus.OK && response.getBody() != null){
            Map<String, Object> body = response.getBody();
            if (body.containsKey("data")) {
                Map<String, Object> data = (Map<String, Object>) body.get("data");
                if (data != null && data.containsKey("items")) {
                    Object items = data.get("items");
                    if (items instanceof List) {
                        List<?> rawList = (List<?>) items;
                        if (!rawList.isEmpty() && rawList.get(0) instanceof Map) {
                            return FeishuUserInfo.fromLarkUser((Map<String, Object>) rawList.get(0));
                        }
                    }
                }
            }
        }
        log.error("飞书用户信息获取失败，响应：{}", response);
        throw new BusinessException("飞书用户信息获取失败");
    }

    private String getAccessToken() {
        String cachedToken = redisTemplate.opsForValue().get(ACCESS_TOKEN_KEY);
        if (cachedToken != null) return cachedToken;

        String url = "https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal";
        Map<String, String> params = new HashMap<>();
        params.put("app_id", appId);
        params.put("app_secret", appSecret);

        ResponseEntity<Map> response = restTemplate.postForEntity(url, params, Map.class);
        if (response.getStatusCode() == HttpStatus.OK) {
            String token = (String) response.getBody().get("tenant_access_token");
            int expiresIn = (Integer) response.getBody().get("expire");
            redisTemplate.opsForValue().set(
                    ACCESS_TOKEN_KEY,
                    token,
                    expiresIn - 60,
                    TimeUnit.SECONDS
            );
            return token;
        }
        throw new BusinessException("飞书访问令牌获取失败");
    }
}
