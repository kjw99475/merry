package org.fullstack.merry.service;

import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.NoticeDTO;

import java.util.List;

public interface TeacherServiceIf {
    List<NoticeDTO> noticeList(String memberIdx);
}
