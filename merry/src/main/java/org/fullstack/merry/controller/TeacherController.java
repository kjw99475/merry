package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.dto.NoticeDTO;
import org.fullstack.merry.service.TeacherServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/teacher")
public class TeacherController {
    private final TeacherServiceImpl teacherService;
    @GetMapping("/notice")
    public void notice(HttpSession session,
                       Model model){
//        String memberIdx = (String)session.getAttribute("memberIdx");
        String memberIdx = "1";
        List<NoticeDTO> noticeList = teacherService.noticeList(memberIdx);
        log.info("noticeList : {}", noticeList);
        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/qna")
    public void qna(HttpSession session,
                       Model model){
//        String memberIdx = (String)session.getAttribute("memberIdx");
        String memberIdx = "1";
        List<NoticeDTO> noticeList = teacherService.noticeList(memberIdx);
        log.info("noticeList : {}", noticeList);
        model.addAttribute("noticeList", noticeList);
    }
    @GetMapping("/list")
    public void list(Model model){
        List<MemberDTO> memberList = teacherService.memberList();
        model.addAttribute("memberList", memberList);
    }
    @GetMapping("/manage/list")
    public void manageList(Model model){

    }
}
