package org.fullstack.merry.mapper;

import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.dto.lecture.ChapterDTO;

import java.util.List;

public interface ChapterMapper {
    int regist(ChapterDTO chapterDTO);
    int modify(ChapterDTO chapterDTO);
    int modifyAndDelete(int lec_idx);
    int delete(int chap_idx);
    ChapterVO view(int chap_idx);
    List<ChapterVO> chapterList(int lec_idx);
    int totalChapter(int lec_idx);
    int realDelete(int chap_idx);
}
