package org.fullstack.merry.service.lecture;

import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface LectureServiceIf {
    int regist(LectureDTO lectureDTO);
    int registLecAndChap(LectureDTO lectureDTO, ChapterDTO[] chapterDTO);
    int modify(LectureDTO lectureDTO);
    int delete(int lec_idx);
    LectureDTO view(int lec_idx);
    PageResponseDTO<LectureDTO> lectureList(PageRequestDTO pageRequestDTO);
    int totalLecture(PageRequestDTO pageRequestDTO);
    String getSubject(int member_idx);
    List<NoticeDTO> noticeList(int lec_idx);
    List<QnaDTO> qnaList(int lec_idx);
    List<DataDTO> dataList(int lec_idx);
}
