package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.domain.lecture.LectureVO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.ChapterMapper;
import org.fullstack.merry.mapper.LectureMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class rimTest {
    @Autowired(required = false)
    LectureMapper lectureMapper;

    @Autowired(required = false)
    ChapterMapper chapterMapper;

    @Test
    public void testLectureRegist() {
        LectureVO lectureVO = LectureVO.builder()
                .lec_title("강의 제목 테스트")
                .lec_content("강의 내용 테스트")
                .member_idx(1)
                .member_name("test")
                .lec_img("테스트.png")
                .build();

        int testLectureRegistResult = lectureMapper.regist(lectureVO);
        log.info("testLectureRegistResult:{}", testLectureRegistResult);
    }

    @Test
    public void testLectureView() {
        int lec_idx = 1;
        LectureDTO lectureDTO = lectureMapper.view(lec_idx);
        log.info("lectureDTO:{}", lectureDTO);
    }

    @Test
    public void testLectureModify() {
        LectureVO lectureVO = LectureVO.builder()
                .lec_idx(1)
                .lec_title("강의 제목 테스트 수정")
                .lec_content("강의 내용 테스트 수정")
                .lec_img("테스트수정.png")
                .build();

        int testLectureModify = lectureMapper.modify(lectureVO);
        log.info("testLectureModify:{}", testLectureModify);
    }

    @Test
    public void testLectureDelete() {
        int lec_idx = 1;
        lectureMapper.delete(lec_idx);
    }

    @Test
    public void testBbsListBySearch() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .search_type(new String[]{"t", "u"})
                .search_word("제목")
                .build();
        int total_count = lectureMapper.totalLecture(pageRequestDTO);
        List<LectureVO> lectureVOList = lectureMapper.lectureList(pageRequestDTO);

        log.info("===============================================");
        log.info("total_count : " + total_count);
        lectureVOList.forEach(list->log.info(list));
        log.info("===============================================");
    }

    @Test
    public void testChapterRegist() {
        ChapterDTO chapterDTO = ChapterDTO.builder()
                .chap_title("목차 테스트 제목")
                .chap_video("목차테스트.mp4")
                .chap_min("40")
                .chap_second("00")
                .lec_idx(1)
                .build();

        int testChapterRegistResult = chapterMapper.regist(chapterDTO);
    }

    @Test
    public void testChapterView() {
        int chap_idx = 1;
        ChapterVO chapterVO = chapterMapper.view(chap_idx);
        log.info("chapterVO:{}", chapterVO);
    }

    @Test
    public void testChapterModify() {
        int chapter_idx = 1;
        ChapterDTO chapterDTO = ChapterDTO.builder()
                .chap_idx(chapter_idx)
                .chap_title("목차 제목 수정")
                .chap_video("목차동영상수정.mp4")
                .chap_min("50")
                .chap_second("30")
                .build();

        chapterMapper.modify(chapterDTO);
        log.info("chapterDTO:{}", chapterMapper.view(chapter_idx));
    }

    @Test
    public void testChapterDelete() {
        int chapter_idx = 1;
        chapterMapper.delete(chapter_idx);
        log.info("chapterDTO:{}", chapterMapper.view(chapter_idx));
    }

    @Test
    public void testChapterList() {
        int lec_idx = 1;
        List<ChapterVO> list = chapterMapper.chapterList(lec_idx);
        int total = chapterMapper.totalChapter(lec_idx);
        log.info("list:{}", list);
        log.info("total:{}", total);
    }



}
