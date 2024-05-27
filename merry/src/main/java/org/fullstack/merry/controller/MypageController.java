package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.BoardServiceIf;
import org.fullstack.merry.service.MypageServiceIf;
import org.fullstack.merry.service.TeacherServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {
    private final MypageServiceIf mypageService;
    private final TeacherServiceIf teacherService;
    private final LectureServiceIf lectureService;

    @GetMapping("/profile")
    public void profileGET() {
        log.info("=========================");
        log.info("MypageController >> profileGET()");
        log.info("=========================");
    }

    @GetMapping("/write")
    public void writeGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BoardDTO> responseDTO = mypageService.writeListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }


    @GetMapping("/writeReply")
    public void writeReplyGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        log.info("=========================");
        log.info("MypageController >> writeReplyGET()");
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<BoardReplyDTO> responseDTO = mypageService.writeReplyListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        log.info("responseDTO : " + responseDTO);
        log.info("=========================");
    }



    /* 1:1 문의 */
    @GetMapping("/qna/list")
    public void qnaListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        log.info("=========================");
        log.info("MypageController >> qnaListGET()");
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        int total_count = mypageService.qnaTotalCount(pageRequestDTO);
        pageRequestDTO.setTotal_count(total_count);
        log.info("total_count : " + total_count);
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<QnaDTO> responseDTO = mypageService.qnaList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        log.info("responseDTO : " + responseDTO);
    }

    @GetMapping("/qna/view")
    public void viewQnaGET(
            @RequestParam(name="qna_idx", defaultValue = "0") int qna_idx,
               Model model
    ) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
        log.info("qnaDTO ; " + qnaDTO);
    }

    @GetMapping("/qna/regist")
    public void registQnaGET() {
    }

    @PostMapping("/qna/regist")
    public String registQnaPOST(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                HttpSession session,
                                Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/mypage/qna/regist?qna_idx="+qnaDTO.getQna_idx();
        }
        qnaDTO.setQna_member_name((String)session.getAttribute("name"));
        int result = mypageService.registQna(qnaDTO);

        if (result > 0) {
            return "redirect:/mypage/qna/list?qna_idx="+qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/mypage/qna/regist?qna_idx="+qnaDTO.getQna_idx();
        }
    }

    @GetMapping("/qna/modify")
    public void modifyQnaGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                          Model model) {
        QnaDTO qnaDTO = mypageService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/modify")
    public String modifyQnaPOST(@Valid QnaDTO qnaDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        log.info("===========MapageController >> modifyQnaPOST =====");
        log.info("qnaDTO : " + qnaDTO);


        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/mypage/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

        int result = lectureService.modifyQna(qnaDTO);

        if (result > 0) {
            return "redirect:/mypage/qna/view?qna_idx=" + qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/mypage/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

    }
    @GetMapping("/qna/delete")
    public String deleteQnaGET(@RequestParam(name="qna_idx", defaultValue = "0") int qna_idx) {
        lectureService.deleteQna(qna_idx);
        return "redirect:/mypage/qna/list";
    }


    @GetMapping("/zzim")
    public void zzimGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<ZzimDTO> responseDTO = mypageService.zzimListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }


    @GetMapping("/cart")
    public void cartGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<CartDTO> responseDTO = mypageService.cartListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
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
    @PostMapping("/deletecart")
    public String deleteCartPOST(
            @RequestParam(name="cart_idx", defaultValue = "0") int cart_idx,
            HttpSession session
    ) {
        String member_id = (String)session.getAttribute("member_id");
        mypageService.deleteCart(member_id, cart_idx);
        return "redirect:/mypage/cart";
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

    @ResponseBody
    @PostMapping("/deletezzim")
    public String deleteZzimPOST(
            @RequestParam(name="zzim_idx", defaultValue = "0") int zzim_idx,
            HttpSession session
    ) {
        String member_id = (String)session.getAttribute("member_id");
        mypageService.deletezzim(member_id, zzim_idx);
        return "redirect:/mypage/zzim";
    }

    @GetMapping("/payment")
    public void paymentGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session,
            Model model
    ) {
        log.info("=========================");
        log.info("MypageController >> paymentGET()");
        if(bindingResult.hasErrors()){
            log.info("MypageController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setMember_id((String)session.getAttribute("member_id"));
        pageRequestDTO.setPage_block_size(10);
        PageResponseDTO<OrderDTO> responseDTO = mypageService.orderListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);

//        int lec_idx = mypageService.getLecIdx(pageRequestDTO);
//        LectureDTO lectureDTO = lectureService.view(lec_idx);
//        model.addAttribute("lectureDTO", lectureDTO);

        log.info("responseDTO : " + responseDTO);
//        log.info("lectureDTO : " + lectureDTO);
        log.info("=========================");
    }

    @PostMapping("/orderUpdateState")
    @ResponseBody
    public String orderUpdateState(
            @RequestParam(name = "order_idx") int order_idx
    ) {
        int result = mypageService.orderUpdateState(order_idx);
        if (result > 0) {
            return "redirect:/mypage/payment";
        }
        else {
            return "redirect:/mypage/payment";
        }
    }

    @GetMapping("/paymentView")
    public void paymentVIEWGET() {
        log.info("=========================");
        log.info("MypageController >> paymentGET()");
        log.info("=========================");
    }

}