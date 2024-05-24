package org.fullstack.merry.service;

import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

import java.util.List;

public interface BoardServiceIf {
    PageResponseDTO<BoardDTO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    BoardDTO view(int board_idx);
    int regist(BoardDTO board);
    int modify(BoardDTO board);
    int delete(int board_idx);
}
