package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.DataVO;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.lecture.LectureReviewVO;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface LectureMapper {
    int regist(LectureVO lectureVO);
    int modify(LectureVO lectureVO);
    int delete(int lec_idx);
    LectureDTO view(int lec_idx);
    List<LectureVO> lectureList(PageRequestDTO pageRequestDTO);
    int totalLecture(PageRequestDTO pageRequestDTO);
    String getSubject(int member_idx);
    List<NoticeDTO> noticeList(int lec_idx);
    List<QnaVO> qnaList(int lec_idx);
    List<DataDTO> dataList(int lec_idx);

    //qna
    int registQna(QnaVO qnaVO);
    int modifyQna(QnaVO qnaVO);
    int deleteQna(int qna_idx);
    QnaVO viewQna(int qna_idx);
    int registTeacher(QnaAnswerDTO qnaAnswerDTO);
    int modifyTeacher(QnaAnswerDTO qnaAnswerDTO);
    int deleteTeacher(int qna_idx);

    //notice
    int registNotice(NoticeVO noticeVO);
    int modifyNotice(NoticeVO noticeVO);
    int deleteNotice(int notice_idx);
    NoticeVO viewNotice(int notice_idx);

    //data
    int registData(DataVO dataVO);
    int modifyData(DataVO dataVO);
    int deleteData(int data_idx);
    DataDTO viewData(int data_idx);

    //review
    int registReview(LectureReviewVO lectureReviewVO);
    int modifyReview(LectureReviewVO lectureReviewVO);
    int deleteReview(int review_idx);
    List<LectureReviewVO> reviewList(int lec_idx);

    //결제내역 조회
   int viewOrder(OrderDTO orderDTO);

    //리뷰 작성여부 조회
    int countReview(OrderDTO orderDTO);

    int realDelete(int lec_idx);
}
