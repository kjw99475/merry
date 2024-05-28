package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.*;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.QnaDTO;

import java.util.List;

public interface TeacherMapper {
    List<NoticeDTO> noticeList(String M_Idx);
    List<TeacherVO> teacherlist();
    List<TeacherVO> teacherPageList(PageRequestDTO pageRequestDTO);
    int totalTeacher();
    List<LectureVO> lecturelist(String teacherIdx);
    List<DataVO> datalist(String lectureIdx);
    List<QnaVO> qnaList(String teacher_idx);
    List<Integer> cartList(String member_id);
    List<Integer> zzimList(String member_id);

    int teacherGradeRegist(GradeVO gradeVO);
    List<GradeVO> gradeList(PageRequestDTO pageRequestDTO);
    int totalGrade(PageRequestDTO pageRequestDTO);

    int teacherInfoRegist(TeacherVO teacherVO);
    int teacherInfoModify(TeacherVO teacherVO);
    int infoPresent(int member_idx);
    TeacherVO viewInfo(int member_idx);

    List<Integer> order_list(String member_id);
}