package org.fullstack.merry.service;

import org.fullstack.merry.dto.*;

import java.util.List;

public interface MyeduService {
    PageResponseDTO<MyQnaDTO> myQnaList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<MyReviewDTO> myReviewList(PageRequestDTO pageRequestDTO);
}
