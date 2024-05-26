package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.GradeVO;
import org.fullstack.merry.dto.GradeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.GradeMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class GradeServiceImpl implements GradeService {

    private final GradeMapper gradeMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<GradeDTO> gradeList(PageRequestDTO pageRequestDTO) {
        List<GradeVO> voList = gradeMapper.gradeList(pageRequestDTO);
        List<GradeDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, GradeDTO.class))
                .collect(Collectors.toList());

        int total_count = gradeMapper.totalGrade(pageRequestDTO);

        PageResponseDTO<GradeDTO> responseDTO = PageResponseDTO.<GradeDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
