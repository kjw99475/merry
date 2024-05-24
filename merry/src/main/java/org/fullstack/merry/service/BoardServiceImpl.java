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
        return 0;
    }

    @Override
    public BoardDTO view(int board_idx) {
        return null;
    }

    @Override
    public int regist(BoardDTO board) {
        return 0;
    }

    @Override
    public int modify(BoardDTO board) {
        return 0;
    }

    @Override
    public int delete(int board_idx) {
        return 0;
    }
}
