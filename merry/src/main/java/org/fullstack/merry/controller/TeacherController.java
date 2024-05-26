package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.MypageServiceImpl;
import org.fullstack.merry.service.TeacherServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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
        teacheridx = "3";
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
                           HttpSession session,
                           Model model){
        String member_id = (String)session.getAttribute("member_id");
        List<Integer> cartlist = teacherService.cartList(member_id);
        List<Integer> zzimlist = teacherService.zzimList(member_id);
        log.info("cartlist : {}", cartlist);
        log.info("zzimlist : {}", zzimlist);
        List<LectureDTO> lecturelist = teacherService.lectureList(teacheridx);
        log.info("lecturelist : {}", lecturelist);
        model.addAttribute("zzimlist", zzimlist);
        model.addAttribute("cartlist", cartlist);
        model.addAttribute("lecturelist", lecturelist);
        model.addAttribute("teacheridx", teacheridx);
    }
    @GetMapping("/manage/materials")
    public void materials(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
                          Model model){
        List<DataDTO> dataList = teacherService.dataList(teacheridx);
    }

    @GetMapping("/manage/main")
    public void teacherMain() {

    }

    @GetMapping("/manage/grade")
    public void teacherGradeList(PageRequestDTO pageRequestDTO, HttpSession session, Model model) {
        pageRequestDTO.setGrade_teacher(session.getAttribute("name").toString());

        PageResponseDTO<GradeDTO> responseDTO = teacherService.gradeList(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/manage/grade/regist")
    public void teacherGradeRegist() {

    }

    @PostMapping("/manage/grade/regist")
    public String teacherGradeRegistPost(@Valid GradeDTO gradeDTO,
                                         BindingResult bindingResult,
                                         RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("gradeDTO", gradeDTO);

            return "redirect:/teacher/manage/grade/regist";
        }

        int result = teacherService.teacherGradeRegist(gradeDTO);

        if(result > 0) {
            return "redirect:/teacher/manage/grade";
        } else {
            return "redirect:/teacher/manage/grade/regist";
        }
    }
}
