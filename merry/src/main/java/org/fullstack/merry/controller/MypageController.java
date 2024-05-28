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
            HttpSession session,
            Model model
    ) {
        int member_idx = (int)session.getAttribute("member_idx");
        int total_count = mypageService.qnaTotalCount(member_idx);
        List<QnaDTO> qnaList = mypageService.qnaList(member_idx);
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("total_count", total_count);
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
        List<Integer> orderlist = teacherService.order_list(member_id);
        if(cartlist.contains(lecIdx)){
            return 0;
        }else{
            if(orderlist.contains(lecIdx)){
                return 2;
            }
            else {
                mypageService.addcart(member_id, lecIdx);
                return 1;
            }
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