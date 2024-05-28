package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardReplyVO;
import org.fullstack.merry.dto.BoardReplyDTO;
import org.fullstack.merry.mapper.BoardReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BoardReplyServiceImpl implements BoardReplyServiceIf{
    private final BoardReplyMapper boardReplyMapper;
    private final ModelMapper modelMapper;

    @Override
    public int reply_regist(BoardReplyDTO boardReplyDTO) {
        BoardReplyVO boardReplyVO = modelMapper.map(boardReplyDTO, BoardReplyVO.class);
        int result = boardReplyMapper.reply_regist(boardReplyVO);
        return result;
    }

    @Override
    public int update_reply_cnt(int comu_idx) {
        return 0;
    }

    @Override
    public List<BoardReplyDTO> reply_list(int board_idx) {
        List<BoardReplyVO> voList = boardReplyMapper.reply_list(board_idx);
        List<BoardReplyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BoardReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public int deleteReply(int reply_idx, int board_idx) {
        int result = boardReplyMapper.deleteReply(board_idx);
        return result;
    }

    @Override
    public int dedate_reply_cnt(int board_idx) {
        return 0;
    }

    @Override
    public int countReply(int board_idx) {
        int result = 0;
        result = boardReplyMapper.countReply(board_idx);
        return result;
    }
}
