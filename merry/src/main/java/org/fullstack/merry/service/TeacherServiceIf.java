package org.fullstack.merry.service;

import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface TeacherServiceIf {
    List<NoticeDTO> noticeList(String memberIdx);
    List<TeacherDTO> teacherlist();
    List<LectureDTO> lectureList(String teacherIdx);
    List<QnaDTO> qnaList(String teacher_idx);
    List<Integer> cartList(String member_id);
    List<Integer> zzimList(String member_id);
}
