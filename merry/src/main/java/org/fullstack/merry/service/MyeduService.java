package org.fullstack.merry.service;

import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface MyeduService {
    PageResponseDTO<MyQnaDTO> myQnaList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<MyReviewDTO> myReviewList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<LectureDTO> myLectureList(PageRequestDTO pageRequestDTO);
}
