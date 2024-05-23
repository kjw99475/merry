package org.fullstack.merry.utils;

import java.security.SecureRandom;

public class TempPasswordUtil {
    public static String makeTempPassword(int len1, int len2, int len3) {
        SecureRandom sr = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        String tmp_pwd0 = "abcdefghijklmnopqrstuvwxyz";
        String tmp_pwd1 = "0123456789";
        String tmp_pwd2 = "!@#$%^*+=-";
        sr.setSeed(System.currentTimeMillis());

        for (int i = 0; i < len1; i++) {
            int char_idx = sr.nextInt(tmp_pwd0.length());
            sb.append(tmp_pwd0.charAt(char_idx));
        }

        for (int i = 0; i < len2; i++) {
            int char_idx = sr.nextInt(tmp_pwd1.length());
            sb.append(tmp_pwd1.charAt(char_idx));
        }

        for (int i = 0; i < len3; i++) {
            int char_idx = sr.nextInt(tmp_pwd2.length());
            sb.append(tmp_pwd2.charAt(char_idx));
        }

        return sb.toString();
    }
}
