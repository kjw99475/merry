package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.MemberVO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf {
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public MemberDTO view(String user_id) {
        MemberVO memberVO = memberMapper.view(user_id);
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
    public int leave(String user_id) {
        int result = memberMapper.leave(user_id);
        return result;
    }

//    @Override
//    public int join(MemberDTO memberDTO) {
//
//        log.info("====================================");
//        log.info("BbsServiceImpl >> regist(bbsDto : " + memberDTO.toString());
//
//        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
//        // vo.setUserId(dto.getUserId()) 이런 작업 대신에 해주는 것
//        int result = memberMapper.join(memberVO);
//
//        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
//        log.info("MemberServiceImpl >> result : " + result);
//        log.info("====================================");
//        return result;
//    }

}
