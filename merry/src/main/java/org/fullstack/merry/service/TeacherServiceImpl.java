package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
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
    public List<Integer> cartList(String member_id) {
        List<Integer> cartlist = teacherMapper.cartList(member_id);
        return cartlist;
    }

    @Override
    public List<Integer> zzimList(String member_id) {
        List<Integer> zzimlist = teacherMapper.zzimList(member_id);
        return zzimlist;
    }
}
