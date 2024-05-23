package org.fullstack.merry.utils;

import lombok.extern.log4j.Log4j2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Log4j2
public class DiffDateUtil {
    public static int diffDate(String date1) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = format.parse(date1);
        Date now = new Date();
        long sec_diff = (now.getTime() - d1.getTime()) / 1000; // 초
        long month_diff = sec_diff / (24*60*60*30);

        return (int)month_diff;
    }
}
