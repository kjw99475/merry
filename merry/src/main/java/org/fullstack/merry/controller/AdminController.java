package org.fullstack.merry.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

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

}
