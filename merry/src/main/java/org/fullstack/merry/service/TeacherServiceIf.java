package org.fullstack.merry.service;

import org.fullstack.merry.domain.GradeVO;
import org.fullstack.merry.domain.TeacherVO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;

import java.util.List;

public interface TeacherServiceIf {
    List<NoticeDTO> noticeList(String memberIdx);
    List<TeacherDTO> teacherlist();
    PageResponseDTO<TeacherDTO> teacherPageList(PageRequestDTO pageRequestDTO);
    List<LectureDTO> lectureList(String teacherIdx);
    List<DataDTO> dataList(String teacherIdx);
    List<QnaDTO> qnaList(String teacher_idx);
    List<Integer> cartList(String member_id);
    List<Integer> zzimList(String member_id);

    int teacherGradeRegist(GradeDTO gradeDTO);
    PageResponseDTO<GradeDTO> gradeList(PageRequestDTO pageRequestDTO);

    int teacherInfoRegist(TeacherDTO teacherDTO);
    int teacherInfoModify(TeacherDTO teacherDTO);
    int infoPresent(int member_idx);
    TeacherDTO viewInfo(int member_idx);

    List<Integer> order_list(String member_id);
}
