package com.example.dto.feishu;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FeishuUserInfo {
    /**
     * 飞书用户唯一标识
     * 示例值: "5d9e1f3a"
     */
    private String userId;

    /**
     * 飞书企业邮箱
     * 示例值: "user@company.com"
     */
    private String email;

    /**
     * 用户姓名（可选，根据接口返回情况）
     * 示例值: "张三"
     */
    private String name;

    /**
     * 用户手机号（可选）
     * 示例值: "13800138000"
     */
    private String mobile;

    /**
     * 用户开放ID（可选）
     * 示例值: "ou_7dab8a3d3cdcc9da365777c7ad535d62"
     */
    private String openId;
    /**
     * 用户 union id（可选）
     * 示例值: "on_576833b917gda3d939b9a3c2d53v61"
     */
    private String unionId;

    public static FeishuUserInfo fromLarkUser(Map<String,Object> userMap){
        return FeishuUserInfo.builder()
                .userId((String) userMap.get("user_id"))
                .email((String) userMap.get("email"))
                .name((String) userMap.get("name"))
                .mobile((String) userMap.get("mobile"))
                .openId((String) userMap.get("open_id"))
                .unionId((String) userMap.get("union_id"))
                .build();
    }
}
