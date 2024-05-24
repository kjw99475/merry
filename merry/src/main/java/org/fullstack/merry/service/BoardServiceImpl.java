package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.BoardMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardServiceIf{
    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<BoardDTO> ListByPage(PageRequestDTO requestDTO) {
        List<BoardVO> voList = boardMapper.ListByPage(requestDTO);
        List<BoardDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BoardDTO.class))
                .collect(Collectors.toList());
        int total_count = boardMapper.TotalCount(requestDTO);

        PageResponseDTO<BoardDTO> responseDTO = PageResponseDTO.<BoardDTO>withAll()
                .requestDTO(requestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int TotalCount(PageRequestDTO requestDTO) {
        int total_count = boardMapper.TotalCount(requestDTO);
        return total_count;
    }

    @Override
    public BoardDTO view(int board_idx) {
        BoardVO boardVO = boardMapper.view(board_idx);
        BoardDTO boardDTO = modelMapper.map(boardVO, BoardDTO.class);
        return boardDTO;
    }

    @Override
    public int regist(BoardDTO boardDTO) {
        BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);
        log.info("=============================");
        log.info("bbsVO >>" + boardVO.toString());
        int result = boardMapper.regist(boardVO);
        log.info("result >>" + result);
        log.info("=============================");
        return boardVO.getBoard_idx();
    }

    @Override
    public int modify(BoardDTO boardDTO) {
        BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);
        int result = boardMapper.modify(boardVO);
        return result;
    }

    @Override
    public int delete(int board_idx) {
        int result = boardMapper.delete(board_idx);
        return result;
    }
}
