package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.dto.MyQnaDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.dto.QnaDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.MyeduMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MyeduServiceImpl implements MyeduService {

    private final MyeduMapper myeduMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<MyQnaDTO> myQnaList(PageRequestDTO pageRequestDTO) {
        List<MyQnaDTO> dtoList = myeduMapper.myQnaList(pageRequestDTO);

        int total_count = myeduMapper.totalMyQna(pageRequestDTO);

        PageResponseDTO<MyQnaDTO> responseDTO = PageResponseDTO.<MyQnaDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
