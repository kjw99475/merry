package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.lecture.ChapterServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class rimTest {
    @Autowired(required = false)
    private LectureServiceIf lectureService;
    @Autowired(required = false)
    private ChapterServiceIf chapterService;

    @Test
    public void testLectureRegist() {
        LectureDTO lectureDTO = LectureDTO.builder()
                .lec_title("강의 제목 테스트")
                .lec_content("강의 내용 테스트")
                .member_idx(1)
                .member_name("test")
                .lec_img("테스트.png")
                .build();
        log.info(lectureService.regist(lectureDTO));
    }

    @Test
    public void testLectureModify() {
        LectureDTO lectureDTO = LectureDTO.builder()
                .lec_idx(2)
                .lec_title("강의 제목 테스트 수정")
                .lec_content("강의 내용 테스트 수정")
                .lec_img("테스트수정.png")
                .build();
        log.info(lectureService.modify(lectureDTO));
    }

    @Test
    public void testLectureView() {
        LectureDTO lectureDTO = lectureService.view(1);
        log.info(lectureDTO);
    }

//    @Test
//    public void testLecAndChapterRegister() {
//        LectureDTO lectureDTO = LectureDTO.builder()
//                .lec_title("강의 제목 테스트")
//                .lec_content("강의 내용 테스트")
//                .member_idx(1)
//                .member_name("test")
//                .lec_img("테스트.png")
//                .lec_price(1000)
//                .lec_subject("수학")
//                .build();
//
//        ChapterDTO[] chapterDTOS = new ChapterDTO[2];
//        for (ChapterDTO dto : chapterDTOS) {
//            dto = ChapterDTO.builder()
//                    .lec_idx(lectureDTO.getLec_idx())
//                    .chap_title("테스트")
//                    .chap_video("테스트")
//                    .chap_min("60")
//                    .chap_second("40")
//                    .build();
//        }
//
//        log.info(lectureService.registLecAndChap(lectureDTO, chapterDTOS));
//    }
}
