package org.fullstack.merry.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack.merry.domain.BoardReplyVO;

import java.util.List;

@Mapper
public interface BoardReplyMapper {

    int reply_regist(BoardReplyVO boardReplyVO);

    int update_reply_cnt(int board_idx);

    List<BoardReplyVO> reply_list(int board_idx);

    int deleteReply(int reply_idx);
    int dedate_reply_cnt(int board_idx);
}
