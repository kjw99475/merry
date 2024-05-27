package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
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
import org.springframework.web.multipart.MultipartFile;
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

    @GetMapping("/manage/qna")
    public void qna(@RequestParam(value = "teacheridx", defaultValue = "0") String teacheridx,
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

    @GetMapping("/manage/main")
    public void teacherMain(HttpSession session, Model model) {
        int member_idx = (int) session.getAttribute("member_idx");
        int present = teacherService.infoPresent(member_idx);
        model.addAttribute("present", present);
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


    @GetMapping("/manage/info/regist")
    public void infoRegistGET() {

    }

    @PostMapping("/manage/info/regist")
    public String infoRegistPOST(@Valid TeacherDTO teacherDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           @RequestParam("teacherImg") MultipartFile teacherImg,
                           HttpSession session,
                           Model model) {

        //        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("lectureDTO", lectureDTO);
//            log.info("valid 오류");
//            return "redirect:/lecture/regist";
//        }

        String teachImg = "";
        if (teacherImg != null && !teacherImg.isEmpty()) {
            teachImg = FileUploadUtil.saveFile(teacherImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\assets\\img");
            teacherDTO.setTeacher_image(teachImg);
        }

        int registResult = teacherService.teacherInfoRegist(teacherDTO);

        if(registResult > 0) {
            return "redirect:/teacher/manage/main";
        }
        else {
            return "redirect:/teacher/manage/info/regist";
        }

    }

    @GetMapping("/manage/info/modify")
    public void infoModifyGET(HttpSession session, Model model) {
        int member_idx = (int) session.getAttribute("member_idx");
        TeacherDTO teacherDTO = teacherService.viewInfo(member_idx);
        model.addAttribute("teacherDTO", teacherDTO);
    }

    @PostMapping("/manage/info/modify")
    public String infoModifyPOST(@Valid TeacherDTO teacherDTO,
                                 BindingResult bindingResult,
                                 RedirectAttributes redirectAttributes,
                                 @RequestParam("teacherImg") MultipartFile teacherImg,
                                 @RequestParam(value = "upload", defaultValue = "") String upload,
                                 HttpSession session,
                                 Model model) {


        String teachImg = "";
        if (teacherImg != null && !teacherImg.isEmpty()) {
            teachImg = FileUploadUtil.saveFile(teacherImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\assets\\img");
            FileUploadUtil.deleteFile(upload, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\assets\\img");
            teacherDTO.setTeacher_image(teachImg);
        }
        else {
            teacherDTO.setTeacher_image(upload);
        }

        int modifyResult = teacherService.teacherInfoModify(teacherDTO);

        if (modifyResult > 0) {
            return "redirect:/teacher/manage/main";
        }
        else {
            return "redirect:/teacher/manage/info/modify";
        }

    }
}
