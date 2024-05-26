package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.GradeVO;
import org.fullstack.merry.dto.PageRequestDTO;

import java.util.List;

public interface GradeMapper {

    List<GradeVO> gradeList(PageRequestDTO pageRequestDTO);
    int totalGrade(PageRequestDTO pageRequestDTO);
}
