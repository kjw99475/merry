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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public void GETdataList(@Valid PageRequestDTO pageRequestDTO,
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

}
