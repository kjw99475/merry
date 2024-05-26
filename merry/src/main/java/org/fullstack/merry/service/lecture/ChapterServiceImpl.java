package org.fullstack.merry.service.lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.mapper.ChapterMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class ChapterServiceImpl implements ChapterServiceIf{
    private final ChapterMapper chapterMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(ChapterDTO chapterDTO) {
        int result = chapterMapper.regist(chapterDTO);
        return result;
    }

    @Override
    public int modify(ChapterDTO chapterDTO) {
        int result = chapterMapper.modify(chapterDTO);
        return result;
    }

    @Override
    public int modifyAndDelete(int lec_idx) {
        return chapterMapper.modifyAndDelete(lec_idx);
    }

    @Override
    public int delete(int chap_idx) {
        int result = chapterMapper.delete(chap_idx);
        return result;
    }

    @Override
    public ChapterVO view(int chapter_idx) {
        ChapterVO chapterVO = chapterMapper.view(chapter_idx);
        return chapterVO;
    }

//    @Override
//    public List<ChapterDTO> chapterList(int lec_idx) {
//        List<ChapterVO> voList = chapterMapper.chapterList(lec_idx);
//        List<ChapterDTO> dtoList = voList.stream()
//                .map(vo->modelMapper.map(vo, ChapterDTO.class))
//                .collect(Collectors.toList());
//        log.info(voList);
//        log.info(dtoList);
//        return dtoList;
//    }

    @Override
    public List<ChapterVO> chapterList(int lec_idx) {
        List<ChapterVO> voList = chapterMapper.chapterList(lec_idx);

        return voList;
    }

    @Override
    public int totalChapter(int lec_idx) {
        return chapterMapper.totalChapter(lec_idx);
    }

    @Override
    public int realDelete(int chap_idx){
        return chapterMapper.realDelete(chap_idx);
    }
}
