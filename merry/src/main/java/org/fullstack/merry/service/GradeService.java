package org.fullstack.merry.service;

import org.fullstack.merry.dto.GradeDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;

public interface GradeService {
    PageResponseDTO<GradeDTO> gradeList(PageRequestDTO pageRequestDTO);
}
