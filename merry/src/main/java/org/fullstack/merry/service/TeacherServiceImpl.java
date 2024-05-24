package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.NoticeDTO;
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
    public List<MemberDTO> memberList() {
        List<MemberDTO> memberList = teacherMapper.memberList();
        return memberList;
    }
}
