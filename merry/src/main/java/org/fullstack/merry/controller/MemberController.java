package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.MemberDTO;
import org.fullstack.merry.service.MemberServiceIf;
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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/member")
public class MemberController {
    private final MemberServiceIf memberService;

    @GetMapping("/join")
    public void joinGET(
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("MemberController >> joinGET()");
        log.info("===============================");
    }

    @PostMapping("/join")
    public String joinPOST(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            Model model, RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/member/join";
        }
        memberDTO.setPhone(memberDTO.getPhone_0(), memberDTO.getPhone_1(), memberDTO.getPhone_2());
        memberDTO.setEmail(memberDTO.getEmail_id(), memberDTO.getEmail_domain());
        int result = memberService.join(memberDTO);
        if (result > 0) {
            return "redirect:/login/login";
        } else {
            return "redirect:/member/join";
        }
    }

    @GetMapping("/view")
    public void viewGET(
            HttpSession session,
            Model model
    ) {
        MemberDTO memberDTO = memberService.view((String)session.getAttribute("member_id"));
        memberDTO.setEmail_id(memberDTO.getEmail_id(memberDTO.getEmail()));
        memberDTO.setEmail_domain(memberDTO.getEmail_domain(memberDTO.getEmail()));
        memberDTO.setPhone_0(memberDTO.getPhone_0(memberDTO.getPhone()));
        memberDTO.setPhone_1(memberDTO.getPhone_1(memberDTO.getPhone()));
        memberDTO.setPhone_2(memberDTO.getPhone_2(memberDTO.getPhone()));
        model.addAttribute("memberDTO", memberDTO);
    }

    @PostMapping("/pwdCheck")
    public String pwdCheckPOST(
            @RequestParam(value = "pwd") String pwd,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        MemberDTO memberDTO = memberService.view((String)session.getAttribute("member_id"));
        if (pwd.equals(memberDTO.getPwd())) {
            return "redirect:/member/modify";
        }
        else {
            redirectAttributes.addFlashAttribute("err", "비밀번호가 맞지 않습니다.");
            return "redirect:/member/view";
        }
    }

    @PostMapping("/pwdCheck2")
    public String pwdCheck2POST(
            @RequestParam(value = "pwd2") String pwd2,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        MemberDTO memberDTO = memberService.view((String)session.getAttribute("member_id"));
        if (pwd2.equals(memberDTO.getPwd())) {
            return "redirect:/member/leave";
        }
        else {
            redirectAttributes.addFlashAttribute("err", "비밀번호가 맞지 않습니다.");
            return "redirect:/member/view";
        }
    }

    @GetMapping("/modify")
    public void modifyGET(
            HttpSession session,
            Model model
    ) {
        MemberDTO memberDTO = memberService.view((String)session.getAttribute("member_id"));
        memberDTO.setEmail_id(memberDTO.getEmail_id(memberDTO.getEmail()));
        memberDTO.setEmail_domain(memberDTO.getEmail_domain(memberDTO.getEmail()));
        memberDTO.setPhone_0(memberDTO.getPhone_0(memberDTO.getPhone()));
        memberDTO.setPhone_1(memberDTO.getPhone_1(memberDTO.getPhone()));
        memberDTO.setPhone_2(memberDTO.getPhone_2(memberDTO.getPhone()));
        model.addAttribute("memberDTO", memberDTO);
    }
    @PostMapping("/modify")
    public String modifyPOST(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            Model model, RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/member/modify";
        }
        memberDTO.setPhone(memberDTO.getPhone_0(), memberDTO.getPhone_1(), memberDTO.getPhone_2());
        memberDTO.setEmail(memberDTO.getEmail_id(), memberDTO.getEmail_domain());
        int result = memberService.modify(memberDTO);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("result", "개인정보 수정이 완료되었습니다.");
            return "redirect:/member/view";
        } else {
            return "redirect:/member/modify";
        }

    }

    @GetMapping("/leave")
    public String leaveGET(
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("MemberController >> leaveGET()");

        String member_id = (String)session.getAttribute("member_id");
        int result = memberService.leave(member_id);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("result", "정상적으로 탈퇴 처리되었습니다.");
            session.invalidate();
            return "redirect:/";
        }
        else {
            return "/member/view";
        }
    }



}