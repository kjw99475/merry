package org.fullstack.merry.service;

import org.fullstack.merry.dto.MemberDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO view(String member_id);
    int modify(MemberDTO memberDTO);
    int leave(String member_id);
}
