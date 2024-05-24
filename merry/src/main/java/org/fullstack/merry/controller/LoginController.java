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
    public void loginPOST(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletRequest req,
            HttpServletResponse res) throws ParseException, NullPointerException {

        log.info("===============================");
        log.info("LoginController >> loginPOST()");
        log.info("memberDTO : " + memberDTO.toString());

        }



//    @GetMapping("/findPwd")
//    public void findPwdGET(
//            HttpServletRequest req,
//            Model model
//    ) {
//        log.info("===============================");
//        log.info("LoginController >> findPwdGET()");
//        log.info("===============================");
//    }
//
//    @PostMapping("/findPwd")
//    public String findPwdPOST(
//            @Valid MemberDTO memberDTO,
//            BindingResult bindingResult,
//            RedirectAttributes redirectAttributes
//    ) {
//
//        if (memberDTO.getMember_id() == null || memberDTO.getMember_id().isEmpty()) {
//            redirectAttributes.addFlashAttribute("err", "아이디를 입력해주세요.");
//            return "redirect:/login/findPwd";
//        }
//
//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            return "redirect:/login/findPwd";
//        }
//
//        int result = loginService.update_tmp_pwd(memberDTO.getMember_id());
//        if (result > 0) {
//            String tmp_pwd = loginService.get_tmp_pwd(memberDTO.getMember_id());
//            redirectAttributes.addAttribute("tmp_pwd", tmp_pwd);
//            return "redirect:/login/findPwdSuccess?id=" + memberDTO.getMember_id();
//        } else {
//            redirectAttributes.addFlashAttribute("err", "일치하는 아이디가 없습니다.");
//            return "redirect:/login/findPwd";
//        }
//    }
//
//    @GetMapping("/findPwdSuccess")
//    public void findPwdSuccessGET(
//            @RequestParam(name = "id", defaultValue = "") String id,
//            RedirectAttributes redirectAttributes
//    ) {
//        log.info("===============================");
//        log.info("LoginController >> findPwdSuccessGET()");
//        redirectAttributes.addAttribute("id", id);
//        log.info("===============================");
//    }
//
//    @GetMapping("/modifyPwd")
//    public void modifyPwdGET(
//            Model model,
//            @RequestParam(name = "member_id", defaultValue = "") String member_id
//    ) {
//        log.info("===============================");
//        log.info("LoginController >> modifyPwdGET()");
//        model.addAttribute("member_id", member_id);
//        log.info("===============================");
//    }
//
//    @PostMapping("/modifyPwd")
//    public String modifyPwdPOST(
//            @Valid MemberDTO memberDTO,
//            @RequestParam(name="past_pwd", defaultValue = "") String past_pwd,
//            HttpServletResponse resp,
//            BindingResult bindingResult,
//            RedirectAttributes redirectAttributes
//    ) throws IOException {
//        log.info("===============================");
//        log.info("LoginController >> modifyPwdPOST()");
//        log.info("memberDTO : " + memberDTO);
//        resp.setCharacterEncoding("UTF-8");
//        resp.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = resp.getWriter();
//
//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            log.info("에러!!");
//            return "redirect:/login/modifyPwd";
//        }
//
//        int result = loginService.change_pwd(memberDTO.getMember_id(), memberDTO.getPwd());
//        if (result > 0) {
//            // 임시 비밀번호 리셋
//            loginService.reset_tmp_pwd(memberDTO.getMember_id());
//            out.println("<script>alert('패스워드가 정상적으로 변경되었습니다.'); window.location.href='/';</script>");
//            out.close();
//            return "redirect:/";
//        } else {
//            out.close();
//            redirectAttributes.addFlashAttribute("err", "기존과 동일한 패스워드는 사용할 수 없습니다.");
//            return "/login/modifyPwd";
//        }
//    }
//
//
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/";
//    }

}
