package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.DataServiceIf;
import org.fullstack.merry.service.InfoServiceIf;
import org.fullstack.merry.service.NoticeServiceIf;
import org.fullstack.merry.service.TeacherServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/main")
public class MainpageController {
    private final TeacherServiceIf teacherServiceif;
    private final LectureServiceIf lectureServiceif;
    private final NoticeServiceIf noticeServiceif;
    private final InfoServiceIf infoServiceif;
    private final DataServiceIf dataServiceIf;

    @GetMapping("/main")
    public void getListst(Model model) {
        //선생님 list
        List<TeacherDTO> teacherlist = teacherServiceif.teacherlist();
        Collections.shuffle(teacherlist);
        teacherlist.stream()
                .limit(6)
                .collect(Collectors.toList());
        model.addAttribute("teacherlist", teacherlist);

        //강의 list
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .type2("0")
                .page_size(3)
                .build();
        PageResponseDTO<LectureDTO> lecturelist = lectureServiceif.lectureList(pageRequestDTO);
        model.addAttribute("lecturelist", lecturelist);

        //게시판 list
        PageResponseDTO<NoticeDTO> noticelist = noticeServiceif.ListByPage(pageRequestDTO);
        model.addAttribute("noticelist", noticelist);
        PageResponseDTO<InfoDTO> infolist = infoServiceif.ListByPage(pageRequestDTO);
        model.addAttribute("infolist", infolist);
        PageResponseDTO<DataDTO> datalist = dataServiceIf.ListByPage(pageRequestDTO);
        model.addAttribute("datalist", datalist);

    }
}
