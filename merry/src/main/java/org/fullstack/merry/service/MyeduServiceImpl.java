package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.*;
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

    @Override
    public PageResponseDTO<MyReviewDTO> myReviewList(PageRequestDTO pageRequestDTO) {
        List<MyReviewDTO> dtoList = myeduMapper.myReviewList(pageRequestDTO);

        int total_count = myeduMapper.totalMyReview(pageRequestDTO);

        PageResponseDTO<MyReviewDTO> responseDTO = PageResponseDTO.<MyReviewDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public PageResponseDTO<LectureDTO> myLectureList(PageRequestDTO pageRequestDTO) {
        List<LectureVO> voList = myeduMapper.myLectureList(pageRequestDTO);

        List<LectureDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, LectureDTO.class))
                .collect(Collectors.toList());

        int total_count = myeduMapper.totalMyLecture(pageRequestDTO);

        PageResponseDTO<LectureDTO> responseDTO = PageResponseDTO.<LectureDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
