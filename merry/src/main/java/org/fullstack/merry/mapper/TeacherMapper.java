package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.domain.NoticeVO;

import java.util.List;

public interface TeacherMapper {
    List<NoticeVO> noticeList(String M_Idx);
}
