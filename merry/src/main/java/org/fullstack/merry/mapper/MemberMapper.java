package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.MemberVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

public interface MemberMapper {
    int join(MemberVO memberVO);
    MemberVO view(String member_id);
    int modify(MemberVO memberVO);
    int leave(String member_id);
    List<MemberVO> memberList(PageRequestDTO pageRequestDTO);
    int totalMember(PageRequestDTO pageRequestDTO);
    int registTeacher(int member_idx);
}