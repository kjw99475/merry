package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
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
    @GetMapping("/manage/notice")
    public void notice(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
                       Model model){
        teacheridx = "3";
        List<NoticeDTO> noticeList = teacherService.noticeList(teacheridx);
        log.info("noticeList : {}", noticeList);
        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/manage/qna")
    public void qna(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
                       Model model){
        List<QnaDTO> qnaList = teacherService.qnaList(teacheridx);
        log.info("qnaList : {}", qnaList);
        model.addAttribute("qnaList", qnaList);
    }
    @GetMapping("/list")
    public void list(Model model){
        List<TeacherDTO> teacherlist = teacherService.teacherlist();
        model.addAttribute("teacherlist", teacherlist);
    }
    @GetMapping("/manage/list")
    public void manageList(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
                           Model model){
        List<LectureDTO> lecturelist = teacherService.lectureList(teacheridx);
        log.info("lecturelist : {}", lecturelist);
        model.addAttribute("lecturelist", lecturelist);
        model.addAttribute("teacheridx", teacheridx);
    }
    @GetMapping("/manage/materials")
    public void materials(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
                          Model model){
//        List<DataDTO> dataList = teacherService.
    }
}
