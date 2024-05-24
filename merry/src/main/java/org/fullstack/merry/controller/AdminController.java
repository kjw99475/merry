package org.fullstack.merry.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.BoardDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.service.BoardServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {
    private final BoardServiceIf boardServiceIf;

    @GetMapping("/member/list")
    public void GETmemberList() {

    }

    @GetMapping("/teacher/list")
    public void GETteacherList() {

    }

    @GetMapping("/qna/list")
    public void GETqnaList() {

    }

    @GetMapping("/lecture/list")
    public void GETlectureList() {

    }

    @GetMapping("/notice/list")
    public void GETnoticeList() {

    }

    @GetMapping("/info/list")
    public void GETinfoList() {

    }

    @GetMapping("/data/list")
    public void GETdataList() {

    }

    @GetMapping("/board/list")
    public void GETboardList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("dataController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<BoardDTO> responseDTO = boardServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/board/view")
    public void GETboardView(@RequestParam(name="board_idx") int board_idx,
                             Model model
    ) {
        BoardDTO boardDTO = boardServiceIf.view(board_idx);
        model.addAttribute("boardDTO", boardDTO);
        log.info("boardDTO >> " + boardDTO);
    }

    @GetMapping("/board/regist")
    public void GETboardRegist(
    ) {

    }

    @PostMapping("/board/regist")
    public String POSTboardregist(@Valid BoardDTO boardDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("BoardController >> list Error");
            redirectAttributes.addFlashAttribute("boardDTO", boardDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/board/regist";
        }
        int result = boardServiceIf.regist(boardDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/admin/board/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/admin/board/regist";
        }
    }

    @GetMapping("/board/modify")
    public void GETboardModify(@RequestParam(name="board_idx") int board_idx,
            Model model
    ) {
        BoardDTO boardDTO = boardServiceIf.view(board_idx);
        model.addAttribute("boardDTO", boardDTO);
        log.info("boardDTO >> " + boardDTO);
    }

    @PostMapping("/board/modify")
    public String POSTboardModify(@Valid BoardDTO boardDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("BoardController >> list Error");
            redirectAttributes.addFlashAttribute("boardDTO", boardDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/admin/board/modify?board_idx=" + boardDTO.getBoard_idx();
        }
        int result = boardServiceIf.modify(boardDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/admin/board/view?board_idx=" + boardDTO.getBoard_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/admin/board/modify?board_idx=" + boardDTO.getBoard_idx();
        }
    }

    @PostMapping("/board/delete")
    public String POSTboardDelete(int board_idx) {
        int result = boardServiceIf.delete(board_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/admin/board/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/admin/board/view?board_idx=" + board_idx;
        }

    }
}
