package org.fullstack.merry.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
    public static void setCookie (HttpServletResponse res, String cName, String cVal, int sTime) {
        Cookie cookie = new Cookie(cName, cVal);
        cookie.setMaxAge(sTime);
        cookie.setPath("/");
        res.addCookie(cookie);
    }

    public static String readCookie (HttpServletRequest req, String cName) {
        String cookieValue = "";

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                if (cookieName.equals(cName)) {
                    cookieValue = c.getValue();
                }
            }
        }
        return cookieValue;
    }

    public static void removeCookie (HttpServletResponse res, String cName) {
        setCookie(res, cName, "", 0);
    }

}
