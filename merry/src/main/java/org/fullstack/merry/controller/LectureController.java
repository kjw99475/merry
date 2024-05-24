package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.lecture.ChapterServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/lecture")
public class LectureController {
    private final LectureServiceIf lectureService;
    private final ChapterServiceIf chapterService;

    @GetMapping("/regist")
    public void regist(Model model) {}

    @PostMapping("/regist")
    public String regist(@Valid LectureDTO lectureDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpSession session, Model model) {


        return null;
    }

    @GetMapping("/view")
    public void view(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        log.info("view");
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        List<ChapterDTO> chapterDTOList = chapterService.chapterList(lec_idx);

        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("ChapterList", chapterDTOList);
    }

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes,  Model model) {
        if (bindingResult.hasErrors()) {
            log.info("LectureController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<LectureDTO> responseDTO = lectureService.lectureList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }
}
