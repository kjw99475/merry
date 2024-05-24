package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.NoticeDTO;

import java.util.List;

public interface TeacherMapper {
    List<NoticeDTO> noticeList(String M_Idx);
    List<MemberDTO> memberList();
}
