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
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/login")
public class LoginController {
    private final LoginServiceIf loginService;

    @GetMapping("/login")
    public void loginGET(
            HttpServletRequest req,
            Model model
    ) {
        model.addAttribute("acc_url", req.getHeader("Referer"));
        String save_id = CookieUtil.readCookie(req, "save_id");
        if (save_id != null) {
            model.addAttribute("save_id", save_id);
        }
    }

    @PostMapping("/login")
    public String loginPOST(
            MemberDTO memberDTO,
            @RequestParam(name = "acc_url", defaultValue = "/") String acc_url,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletRequest req,
            HttpServletResponse res) throws ParseException, NullPointerException {

        if (memberDTO.getMember_id() == null || memberDTO.getMember_id().isEmpty()) {
            redirectAttributes.addFlashAttribute("err", "아이디를 입력해주세요.");
            return "redirect:/login/login";
        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("err", "아이디 또는 비밀번호 정보가 맞지 않습니다.");
            return "redirect:/login/login";
        }

        MemberDTO loginMemberDTO = loginService.login_info(memberDTO.getMember_id(), memberDTO.getPwd());
        if (loginMemberDTO != null) {
            if (loginMemberDTO.getMember_state().equals("N")) {
                redirectAttributes.addFlashAttribute("err", "탈퇴 처리된 회원입니다. 탈퇴를 해제하고 싶으면 관리자에게 문의하세요.");
                return "redirect:/login/login";
            }

            String save_id = req.getParameter("save_id");
            if (save_id != null && save_id.equals("on")) {
                CookieUtil.setCookie(res, "save_id", loginMemberDTO.getMember_id(), 60 * 60 * 24);
            } else {
                CookieUtil.removeCookie(res, "save_id");
            }

            MemberDTO dto = new MemberDTO();
            dto.setMember_id(loginMemberDTO.getMember_id());
            dto.setName(loginMemberDTO.getName());
            model.addAttribute("loginInfo", dto);

            HttpSession session = req.getSession();
            session.setAttribute("member_idx", loginMemberDTO.getMember_idx());
            session.setAttribute("member_id", loginMemberDTO.getMember_id());
            session.setAttribute("name", loginMemberDTO.getName());
            session.setAttribute("member_type", loginMemberDTO.getMember_type());
            session.setAttribute("member_state", loginMemberDTO.getMember_state());
        } else {
            redirectAttributes.addFlashAttribute("err", "아이디 또는 비밀번호 정보가 맞지 않습니다.");
            return "redirect:/login/login";
        }

        if (acc_url.contains("join") || acc_url.contains("login")) {
            return "redirect:/";
        }
        return "redirect:"+ acc_url;
    }

//    @GetMapping("/google")
//    public String getGoogleAuthUrl(HttpServletResponse resp) throws Exception {
//        log.info("google hi!");
//        LoginInfo loginInfo = new LoginInfo();
//        String id = loginInfo.getClient_id();
//        String pwd = loginInfo.getClient_pwd();
//        String key = loginInfo.getApi_key();
//        String redirectUrl = loginInfo.getRedirect_url();
//
//        String url = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + id + "&redirect_uri=" + redirectUrl + "&response_type=code" + "&scope=email profile";
//
//        return "redirect:" + url;
//    }



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}