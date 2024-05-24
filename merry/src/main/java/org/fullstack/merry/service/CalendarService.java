package org.fullstack.merry.service;

import org.fullstack.merry.domain.Calendar;

import java.util.List;

public interface CalendarService {

    int calendarRegist(Calendar dateData);

    List<Calendar> calendarList();

    Calendar calendarView(int id);

    int calendarModify(Calendar calendar);

    int calendarDelete(int id);
}
