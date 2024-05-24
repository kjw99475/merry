package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardVO> ListByPage(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
    BoardVO view(int board_idx);
    int regist(BoardVO board);
    int modify(BoardVO board);
    int delete(int board_idx);

}
