package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.Calendar;
import org.fullstack.merry.mapper.CalendarMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

    private final CalendarMapper calendarMapper;

    @Override
    public int calendarRegist(Calendar calendar) {
        int result = calendarMapper.calendarRegist(calendar);

        return result;
    }

    @Override
    public List<Calendar> calendarList(String member_id) {
        List<Calendar> planList = calendarMapper.calendarList(member_id);

        return planList;
    }

    @Override
    public Calendar calendarView(int id) {
        Calendar calendar = calendarMapper.calendarView(id);

        return calendar;
    }

    @Override
    public int calendarModify(Calendar calendar) {
        int result = calendarMapper.calendarModify(calendar);

        return result;
    }

    @Override
    public int calendarDelete(int id) {
        int result = calendarMapper.calendarDelete(id);

        return result;
    }
}
