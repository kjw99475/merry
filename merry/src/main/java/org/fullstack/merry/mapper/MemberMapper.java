package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.MemberVO;

public interface MemberMapper {
    int join(MemberVO memberVO);
    MemberVO view(String member_id);
    int modify(MemberVO memberVO);
    int leave(String member_id);
}