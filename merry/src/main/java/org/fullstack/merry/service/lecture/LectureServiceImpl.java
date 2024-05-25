package org.fullstack.merry.service.lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.ChapterMapper;
import org.fullstack.merry.mapper.LectureMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class LectureServiceImpl implements LectureServiceIf{
    private final LectureMapper lectureMapper;
    private final ModelMapper modelMapper;
    private final ChapterMapper chapterMapper;

    @Override
    public int regist(LectureDTO lectureDTO) {
        LectureVO lectureVO = modelMapper.map(lectureDTO, LectureVO.class);
        int result = lectureMapper.regist(lectureVO);
        log.info(lectureVO.getLec_idx());
        int idx = 0;
        idx = lectureVO.getLec_idx();
        return idx;
    }

    @Override
    @Transactional
    public int registLecAndChap(LectureDTO lectureDTO, ChapterDTO[] dtos) {
        LectureVO lectureVO = modelMapper.map(lectureDTO, LectureVO.class);
        int result = lectureMapper.regist(lectureVO);
        List<Integer> resultChaps = new ArrayList<>();
        for (ChapterDTO chapterDTO : dtos) {
            chapterDTO.setLec_idx(lectureVO.getLec_idx());
            resultChaps.add(chapterMapper.regist(chapterDTO));
        }

        return result;
    }

    @Override
    public int modify(LectureDTO lectureDTO) {
        LectureVO lectureVO = modelMapper.map(lectureDTO, LectureVO.class);
        int result = lectureMapper.modify(lectureVO);
        return result;
    }

    @Override
    public int delete(int lec_idx) {
        int result = lectureMapper.delete(lec_idx);
        return result;
    }

    @Override
    public LectureDTO view(int lec_idx) {
        LectureDTO lectureDTO = lectureMapper.view(lec_idx);
        return lectureDTO;
    }

    @Override
    public PageResponseDTO<LectureDTO> lectureList(PageRequestDTO pageRequestDTO) {
        List<LectureVO> lectureVOList = lectureMapper.lectureList(pageRequestDTO);
        List<LectureDTO> dtoList = lectureVOList.stream()
                .map(vo->modelMapper.map(vo, LectureDTO.class))
                .collect(Collectors.toList());
        int total_count = lectureMapper.totalLecture(pageRequestDTO);

        PageResponseDTO<LectureDTO> responseDTO = PageResponseDTO.<LectureDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int totalLecture(PageRequestDTO pageRequestDTO) {
        return lectureMapper.totalLecture(pageRequestDTO);
    }

    @Override
    public String getSubject(int member_idx) {
        return lectureMapper.getSubject(member_idx);
    }

    @Override
    public List<NoticeDTO> noticeList(int lec_idx) {
        List<NoticeDTO> noticeDTOList = lectureMapper.noticeList(lec_idx);
        return noticeDTOList;
    }

    @Override
    public List<QnaDTO> qnaList(int lec_idx) {
        List<QnaDTO> qnaDTOList = lectureMapper.qnaList(lec_idx).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());
        return qnaDTOList;
    }

    @Override
    public List<DataDTO> dataList(int lec_idx) {
        List<DataDTO> dataDTOList = lectureMapper.dataList(lec_idx);
        return dataDTOList;
    }

}
