package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.domain.NoticeVO;
import org.fullstack.merry.domain.QnaVO;
import org.fullstack.merry.domain.TeacherVO;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.dto.QnaDTO;

import java.util.List;

public interface TeacherMapper {
    List<NoticeDTO> noticeList(String M_Idx);
    List<TeacherVO> teacherlist();
    List<LectureVO> lecturelist(String teacherIdx);
    List<QnaVO> qnaList(String teacher_idx);
    List<Integer> cartList(String member_id);
    List<Integer> zzimList(String member_id);
}
