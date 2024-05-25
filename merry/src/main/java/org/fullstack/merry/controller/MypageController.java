package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.service.LoginServiceIf;
import org.fullstack.merry.service.MypageServiceIf;
import org.fullstack.merry.service.TeacherServiceIf;
import org.fullstack.merry.utils.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="mypage")
@RequiredArgsConstructor
public class MypageController {
    private final MypageServiceIf mypageService;
    private final TeacherServiceIf teacherService;
    @GetMapping("/profile")
    public void profileGET() {
        log.info("=========================");
        log.info("MypageController >> profileGET()");
        log.info("=========================");
    }

    @GetMapping("/write")
    public void writeGET() {
        log.info("=========================");
        log.info("MypageController >> writeGET()");
        log.info("=========================");
    }

    @GetMapping("/qna")
    public void qnaGET() {
        log.info("=========================");
        log.info("MypageController >> qnaGET()");
        log.info("=========================");
    }

    @GetMapping("/zzim")
    public void zzimGET() {
        log.info("=========================");
        log.info("MypageController >> zzimGET()");
        log.info("=========================");
    }

    @GetMapping("/cart")
    public void cartGET() {
        log.info("=========================");
        log.info("MypageController >> cartGET()");
        log.info("=========================");
    }

    @GetMapping("/payment")
    public void paymentGET() {
        log.info("=========================");
        log.info("MypageController >> paymentGET()");
        log.info("=========================");
    }
    @ResponseBody
    @PostMapping("/addcart")
    public void addcart(@RequestParam(value = "lec_idx") int lecIdx,
                        HttpSession session){
        String member_id = (String)session.getAttribute("member_id");
        mypageService.addcart(member_id, lecIdx);
    }
    @ResponseBody
    @PostMapping("/addzzim")
    public void addzzim(@RequestParam(value = "lec_idx") int lecIdx,
                        HttpSession session){
        String member_id = (String)session.getAttribute("member_id");
        List<Integer> zzimlist = teacherService.zzimList(member_id);
        log.info(zzimlist.contains(lecIdx));
        if(zzimlist.contains(lecIdx)){
            mypageService.deletezzim(member_id, lecIdx);
        }else {
            mypageService.addzzim(member_id, lecIdx);
        }
    }
}