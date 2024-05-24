package org.fullstack.merry.service.lecture;

import org.fullstack.merry.dto.lecture.ChapterDTO;

import java.util.List;

public interface ChapterServiceIf {
    int regist(ChapterDTO chapterDTO);
    int modify(ChapterDTO chapterDTO);
    int delete (int chap_idx);
    ChapterDTO view(int chapter_idx);
    List<ChapterDTO> chapterList(int lec_idx);
    int totalChapter(int lec_idx);
}
