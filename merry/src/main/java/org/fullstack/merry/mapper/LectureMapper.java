package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface LectureMapper {
    int regist(LectureVO lectureVO);
    int modify(LectureVO lectureVO);
    int delete(int lec_idx);
    LectureDTO view(int lec_idx);
    List<LectureVO> lectureList(PageRequestDTO pageRequestDTO);
    int totalLecture(PageRequestDTO pageRequestDTO);
}
