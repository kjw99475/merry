package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.service.MypageServiceIf;
import org.fullstack.merry.service.TeacherServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Log4j2
@Controller
@RequestMapping(value="/mypage")
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
    @GetMapping("/writeReply")
    public void writeReplyGET() {
        log.info("=========================");
        log.info("MypageController >> writeReplyGET()");
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

    @ResponseBody
    @PostMapping("/addcart")
    public int addcart(@RequestParam(value = "lec_idx") int lecIdx,
                        HttpSession session){
        String member_id = (String)session.getAttribute("member_id");
        List<Integer> cartlist = teacherService.cartList(member_id);
        if(cartlist.contains(lecIdx)){
            return 0;
        }else{
            mypageService.addcart(member_id, lecIdx);
            return 1;
        }
    }
    @ResponseBody
    @PostMapping("/addzzim")
    public void addzzim(@RequestParam(value = "lec_idx") int lecIdx,
                        HttpSession session){
        String member_id = (String)session.getAttribute("member_id");
        List<Integer> zzimlist = teacherService.zzimList(member_id);
        if(zzimlist.contains(lecIdx)){
            mypageService.deletezzim(member_id, lecIdx);
        }else {
            mypageService.addzzim(member_id, lecIdx);
        }
    }

    @GetMapping("/payment")
    public void paymentGET() {
        log.info("=========================");
        log.info("MypageController >> paymentGET()");
        log.info("=========================");
    }

    @GetMapping("/paymentView")
    public void paymentVIEWGET() {
        log.info("=========================");
        log.info("MypageController >> paymentGET()");
        log.info("=========================");
    }

}