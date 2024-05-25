package org.fullstack.merry.service.lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.DataVO;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
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

    @Override
    public int registQna(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = lectureMapper.registQna(qnaVO);
        return result;
    }

    @Override
    public int modifyQna(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = lectureMapper.modifyQna(qnaVO);
        return result;
    }

    @Override
    public int deleteQna(int qna_idx) {
        int result = lectureMapper.deleteQna(qna_idx);
        return result;
    }

    @Override
    public QnaDTO viewQna(int qna_idx) {
        QnaVO qnaVO = lectureMapper.viewQna(qna_idx);
        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);
        return qnaDTO;
    }

    @Override
    public int registTeacher(QnaAnswerDTO qnaAnswerDTO) {
        int result = lectureMapper.registTeacher(qnaAnswerDTO);
        return result;
    }

    @Override
    public int modifyTeacher(QnaAnswerDTO qnaAnswerDTO) {
        int result = lectureMapper.modifyTeacher(qnaAnswerDTO);
        return result;
    }

    @Override
    public int deleteTeacher(int qna_idx) {
        int result = lectureMapper.deleteTeacher(qna_idx);
        return result;
    }

    @Override
    public int registNotice(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = lectureMapper.registNotice(noticeVO);
        return result;
    }

    @Override
    public int modifyNotice(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = lectureMapper.modifyNotice(noticeVO);
        return result;
    }

    @Override
    public int deleteNotice(int notice_idx) {
        int result = lectureMapper.deleteNotice(notice_idx);
        return result;
    }

    @Override
    public NoticeDTO viewNotice(int notice_idx) {
        NoticeVO noticeVO = lectureMapper.viewNotice(notice_idx);
        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);
        return noticeDTO;
    }

    @Override
    public int registData(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = lectureMapper.registData(dataVO);
        return result;
    }

    @Override
    public int modifyData(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = lectureMapper.modifyData(dataVO);
        return result;
    }

    @Override
    public int deleteData(int data_idx) {
        int result = lectureMapper.deleteData(data_idx);
        return result;
    }

    @Override
    public DataDTO viewData(int data_idx) {
        DataDTO dataDTO = lectureMapper.viewData(data_idx);
        return dataDTO;
    }

}
