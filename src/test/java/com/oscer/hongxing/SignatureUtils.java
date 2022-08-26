package com.oscer.hongxing;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.checkerframework.checker.units.qual.A;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 签名工具
 *
 * @author yangye
 * @version 1.0.7
 * @date 2020/3/5 0005 15:15
 */
@Slf4j
public class SignatureUtils {

    /**
     * 字符串转换为 Map
     *
     * @param jsonString
     * @param <T>
     * @return
     */
    public static <T> Map<String, Object> json2map(String jsonString) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        try {
            return mapper.readValue(jsonString, Map.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("name", "kez");
        paramMap.put("iphone", "122222222");
        paramMap.put("gender", "1");
        System.out.println(getSign(paramMap, null));

        AppBankClientDataDTO dataDTO  =new AppBankClientDataDTO();
        dataDTO.setCardId("1");
        dataDTO.setChannelId("33333");
        dataDTO.setUserName("李亚红");
        Map<String, Object> stringObjectMap = json2map(JSONObject.toJSONString(dataDTO));
        System.out.println(stringObjectMap);
    }



    /**
     * 得到签名
     *
     * @param paramMap  参数集合不含app_secret 必须包含app_id=客户端ID sign_type = SHA256|MD5 签名方式
     *                  timestamp=时间戳 nonce=随机字符串
     * @param appSecret 验证接口的clientSecret
     * @return
     */
    public static String getSign(Map<String, String> paramMap, String appSecret) {
        if (paramMap == null) {
            return "";
        }
        // 排序
        Set<String> keySet = paramMap.keySet();
        String[] keyArray = keySet.toArray(new String[keySet.size()]);
        Arrays.sort(keyArray);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        for (String k : keyArray) {
            if (paramMap.get(k).trim().length() > 0) {
                // 参数值为空，则不参与签名
                sb.append(k).append("=").append(paramMap.get(k).trim());
                if (i != keyArray.length - 1) {
                    sb.append("&");
                }
                i++;
            }

        }
        return sb.toString();
    }

    public enum SignType {

        MD5, SHA256;

        public static boolean contains(String type) {
            for (SignType typeEnum : SignType.values()) {
                if (typeEnum.name().equals(type)) {
                    return true;
                }
            }
            return false;
        }

    }

}
