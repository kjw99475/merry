package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.domain.GradeVO;
import org.fullstack.merry.domain.TeacherVO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.TeacherMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class TeacherServiceImpl implements TeacherServiceIf {
    private final TeacherMapper teacherMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<NoticeDTO> noticeList(String memberIdx) {
        List<NoticeDTO> noticeList = teacherMapper.noticeList(memberIdx).stream()
                .map(vo->modelMapper.map(vo, NoticeDTO.class))
                .collect(Collectors.toList());
        return noticeList;
    }

    @Override
    public List<TeacherDTO> teacherlist() {
        List<TeacherDTO> memberList = teacherMapper.teacherlist().stream()
                .map(vo->modelMapper.map(vo, TeacherDTO.class))
                .collect(Collectors.toList());
        return memberList;
    }
    @Override
    public List<LectureDTO> lectureList(String teacherIdx){
        List<LectureDTO> LectureList = teacherMapper.lecturelist(teacherIdx).stream()
                .map(vo->modelMapper.map(vo, LectureDTO.class))
                .collect(Collectors.toList());
        return LectureList;
    }
    @Override
    public List<QnaDTO> qnaList(String teacher_idx){
        List<QnaDTO> qnalist = teacherMapper.qnaList(teacher_idx).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());
        return qnalist;
    }
    @Override
    public List<DataDTO> dataList(String teacher_idx){
        List<DataDTO> datalist = teacherMapper.datalist(teacher_idx).stream()
                .map(vo->modelMapper.map(vo, DataDTO.class))
                .collect(Collectors.toList());
        return datalist;
    }

    @Override
    public List<Integer> cartList(String member_id) {
        List<Integer> cartlist = teacherMapper.cartList(member_id);
        return cartlist;
    }

    @Override
    public List<Integer> zzimList(String member_id) {
        List<Integer> zzimlist = teacherMapper.zzimList(member_id);
        return zzimlist;
    }

    @Override
    public int teacherGradeRegist(GradeDTO gradeDTO) {
        GradeVO gradeVO = modelMapper.map(gradeDTO, GradeVO.class);

        int result = teacherMapper.teacherGradeRegist(gradeVO);

        return result;
    }

    @Override
    public PageResponseDTO<GradeDTO> gradeList(PageRequestDTO pageRequestDTO) {
        List<GradeVO> voList = teacherMapper.gradeList(pageRequestDTO);

        List<GradeDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, GradeDTO.class))
                .collect(Collectors.toList());

        int total_count = teacherMapper.totalGrade(pageRequestDTO);

        PageResponseDTO<GradeDTO> responseDTO = PageResponseDTO.<GradeDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int teacherInfoRegist(TeacherDTO teacherDTO) {
        TeacherVO teacherVO = modelMapper.map(teacherDTO, TeacherVO.class);
        int result = teacherMapper.teacherInfoRegist(teacherVO);
        return result;
    }

    @Override
    public int teacherInfoModify(TeacherDTO teacherDTO) {
        TeacherVO teacherVO = modelMapper.map(teacherDTO, TeacherVO.class);
        int result = teacherMapper.teacherInfoModify(teacherVO);
        return result;
    }

    @Override
    public int infoPresent(int member_idx) {
        return teacherMapper.infoPresent(member_idx);
    }

    @Override
    public TeacherDTO viewInfo(int member_idx) {
        TeacherVO teacherVO = teacherMapper.viewInfo(member_idx);
        TeacherDTO teacherDTO = modelMapper.map(teacherVO, TeacherDTO.class);
        return teacherDTO;
    }
}