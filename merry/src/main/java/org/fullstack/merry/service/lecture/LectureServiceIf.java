package org.fullstack.merry.service.lecture;

import org.fullstack.merry.domain.DataVO;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
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

    int registQna(QnaDTO qnaDTO);
    int modifyQna(QnaDTO qnaDTO);
    int deleteQna(int qna_idx);
    QnaDTO viewQna(int qna_idx);
    int registTeacher(QnaAnswerDTO qnaAnswerDTO);
    int modifyTeacher(QnaAnswerDTO qnaAnswerDTO);
    int deleteTeacher(int qna_idx);

    int registNotice(NoticeDTO noticeDTO);
    int modifyNotice(NoticeDTO noticeDTO);
    int deleteNotice(int notice_idx);
    NoticeDTO viewNotice(int notice_idx);

    int registData(DataDTO dataDTO);
    int modifyData(DataDTO dataDTO);
    int deleteData(int data_idx);
    DataDTO viewData(int data_idx);
}
