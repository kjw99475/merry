package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.Calendar;

import java.util.List;

public interface CalendarMapper {

    int calendarRegist(Calendar calendar);

    List<Calendar> calendarList();

    Calendar calendarView(int id);

    int calendarModify(Calendar calendar);

    int calendarDelete(int id);
}
