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
        log.info("===============================");
        log.info("LoginController >> loginGET()");

//        model.addAttribute("acc_url", req.getHeader("referer"));
        String save_id = CookieUtil.readCookie(req, "save_id");
        if (save_id != null) {
            model.addAttribute("save_id", save_id);
        }
        log.info("===============================");
    }

    @PostMapping("/login")
    public String loginPOST(
            @Valid MemberDTO memberDTO,
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
        }

        return "redirect:/";
    }

    @GetMapping("/findPwd")
    public void findPwdGET(
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("LoginController >> findPwdGET()");
        log.info("===============================");
    }

    /* 비밀 번호 찾기 구현,,? */

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
