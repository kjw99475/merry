package org.fullstack.merry.service;

import org.fullstack.merry.dto.MyQnaDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.dto.QnaDTO;

import java.util.List;

public interface MyeduService {
    PageResponseDTO<MyQnaDTO> myQnaList(PageRequestDTO pageRequestDTO);
}
