package org.fullstack.merry.service;

import org.fullstack.merry.dto.BoardReplyDTO;

import java.util.List;

public interface BoardReplyServiceIf {
//    List<BoardReplyDTO> ListByPage(int board_idx);
//
//    int regist(BoardReplyDTO replyDTO);
//
//    int delete(int idx);

    int reply_regist(BoardReplyDTO boardReplyDTO);
    int update_reply_cnt(int comu_idx);
    List<BoardReplyDTO> reply_list(int board_idx);
    int deleteReply(int reply_idx, int board_idx);
    int dedate_reply_cnt(int board_idx);
    int countReply(int board_idx);
}
