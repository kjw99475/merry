package org.fullstack.merry.service;

import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO view(String member_id);
    int modify(MemberDTO memberDTO);
    int leave(String member_id);
    PageResponseDTO<MemberDTO> memberList(PageRequestDTO pageRequestDTO);
    int registTeacher(int member_idx);
}