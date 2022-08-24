package com.oscer.hongxing.common;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 * @version 1.0.7
 * @date 2020/3/24 0024 17:36
 */
public class AESUtils {

    /**
     * 密钥
     */
    public static String key1 = "shoppassword_key";
    /**
     * 密钥
     */
    public static String key2 = "shop";

    private static String charset = "utf-8";

    /**
     * 偏移量
     */
    private static int offset = 16;

    private static String transformation = "AES/CBC/PKCS5Padding";

    private static String algorithm = "AES";

    /**
     * 加密
     *
     * @param content 需要加密的内容
     * @param key     加密密码
     * @return
     */
    public static String encrypt(String content, String key) {
        try {
            SecretKeySpec skey = new SecretKeySpec(key.getBytes(), algorithm);
            IvParameterSpec iv = new IvParameterSpec(key.getBytes(), 0, offset);
            Cipher cipher = Cipher.getInstance(transformation);
            byte[] byteContent = content.getBytes(charset);
            // 初始化
            cipher.init(Cipher.ENCRYPT_MODE, skey, iv);
            byte[] result = cipher.doFinal(byteContent);
            // 加密
            return Base64.getEncoder().encodeToString(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * AES（256）解密
     *
     * @param content 待解密内容
     * @param key     解密密钥
     * @return 解密之后
     * @throws Exception
     */
    public static String decrypt(String content, String key) {
        try {

            SecretKeySpec skey = new SecretKeySpec(key.getBytes(), algorithm);
            IvParameterSpec iv = new IvParameterSpec(key.getBytes(), 0, offset);
            Cipher cipher = Cipher.getInstance(transformation);
            // 初始化
            cipher.init(Cipher.DECRYPT_MODE, skey, iv);
            byte[] result = cipher.doFinal(Base64.getDecoder().decode(content));
            // 解密
            return new String(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        String phone = "18671310745";
        String encrypt1 = encrypt("Kz123456", key1);
        System.out.println(encrypt1);
        String encrypt2 = encrypt(encrypt1, phone + "#" + key2);
        System.out.println(encrypt2);
        String decrypt3 = decrypt(encrypt2, phone + "#" + key2);
        System.out.println(decrypt3);
        String decrypt4 = decrypt("/Ffn1mlEwqQ3LYlBHLEkhA==", key1);
        System.out.println(decrypt4);
    }


    public static String encryptShop(String decrypt1, String phone) {
        return encrypt(decrypt1, phone + "#" + key2);
    }

    public static String decryptShop(String decrypt) {
        return decrypt(decrypt, key1);
    }
}
