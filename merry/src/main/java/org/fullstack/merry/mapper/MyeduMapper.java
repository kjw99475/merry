package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.dto.MyQnaDTO;
import org.fullstack.merry.dto.MyReviewDTO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

public interface MyeduMapper {

    List<MyQnaDTO> myQnaList(PageRequestDTO pageRequestDTO);
    int totalMyQna(PageRequestDTO pageRequestDTO);

    List<MyReviewDTO> myReviewList(PageRequestDTO pageRequestDTO);
    int totalMyReview(PageRequestDTO pageRequestDTO);
}
