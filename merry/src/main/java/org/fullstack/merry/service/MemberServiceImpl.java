package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.MemberVO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf {
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);
        return result;
    }

    @Override
    public MemberDTO view(String member_id) {
        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }
    @Override
    public int modify(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);
        return result;
    }

    @Override
    public int leave(String member_id) {
        int result = memberMapper.leave(member_id);
        return result;
    }

    @Override
    public PageResponseDTO<MemberDTO> memberList(PageRequestDTO pageRequestDTO) {

        List<MemberVO> memberVOList = memberMapper.memberList(pageRequestDTO);
        List<MemberDTO> memberDTOList = memberVOList.stream()
                .map(vo->modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        int totalMember = memberMapper.totalMember(pageRequestDTO);

        PageResponseDTO<MemberDTO> responseDTO = PageResponseDTO.<MemberDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(memberDTOList)
                .total_count(totalMember)
                .build();



        return responseDTO;
    }

    @Override
    public int registTeacher(int member_idx) {
        int result = memberMapper.registTeacher(member_idx);
        return result;
    }

}