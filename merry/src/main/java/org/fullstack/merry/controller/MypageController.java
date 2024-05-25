package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.service.LoginServiceIf;
import org.fullstack.merry.utils.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;

@Log4j2
@Controller
@RequestMapping(value="mypage")
@RequiredArgsConstructor
public class MypageController {
//    private final MypageServiceIf mypageService;
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
}