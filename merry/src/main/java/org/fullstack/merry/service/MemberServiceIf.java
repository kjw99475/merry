package org.fullstack.merry.service;

public interface MemberServiceIf {
//    int join(MemberDTO memberDTO);

    MemberDTO view(String user_id);
    int modify(MemberDTO memberDTO);
    int leave(String user_id);
}
