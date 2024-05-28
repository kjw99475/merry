package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.BoardReplyVO;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BoardReplyMapper {

    int reply_regist(BoardReplyVO boardReplyVO);

    int update_reply_cnt(int board_idx);

    List<BoardReplyVO> reply_list(int board_idx);

    int deleteReply(int reply_idx);
    int dedate_reply_cnt(int board_idx);
    int countReply(int board_idx);

    List<BoardReplyVO> ListByPage2(PageRequestDTO requestDTO);
    int TotalCount(PageRequestDTO requestDTO);
}
