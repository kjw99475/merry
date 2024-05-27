package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack.merry.domain.Calendar;

import java.util.List;

public interface CalendarMapper {

    int calendarRegist(Calendar calendar);

    List<Calendar> calendarList(String member_id);

    Calendar calendarView(int id);

    int calendarModify(Calendar calendar);

    int calendarDelete(int id);
}
