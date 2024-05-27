package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.Calendar;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.service.CalendarService;
import org.fullstack.merry.service.GradeService;
import org.fullstack.merry.service.MyeduService;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/myedu")
public class MyeduController {

    private final CalendarService calendarService;
    private final GradeService gradeService;
    private final MyeduService myeduService;

    @GetMapping("/plan/list")
    public void planList() {
    }

    @ResponseBody
    @GetMapping("/plan/calendar")
    public List<Map<String, Object>> calendar() {
        List<Calendar> calendarList = calendarService.calendarList();

//        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArr = new JSONArray();

        HashMap<String, Object> map = new HashMap<>();

        for(int i=0; i<calendarList.size(); i++) {
            map.put("id", calendarList.get(i).getId());
            map.put("title", calendarList.get(i).getTitle());
            map.put("writer", calendarList.get(i).getWriter());
            map.put("start", calendarList.get(i).getStart());
            map.put("end", calendarList.get(i).getEnd());
            map.put("textColor", calendarList.get(i).getTextColor());
            map.put("backgroundColor", calendarList.get(i).getBackgroundColor());

            JSONObject jsonObject = new JSONObject(map);
            jsonArr.add(jsonObject);
        }

        return jsonArr;
    }

    @ResponseBody
    @PostMapping("/plan/regist")
    public String registCalendar(@RequestBody Calendar calendar) {
        int result = calendarService.calendarRegist(calendar);

        if(result > 0) {
            return "/myedu/plan/list";
        } else {
            return "fail";
        }
    }

    @ResponseBody
    @GetMapping("/plan/view")
    public Calendar viewCalendar(int id) {
        Calendar calendar = calendarService.calendarView(id);

        return calendar;
    }

    @ResponseBody
    @PostMapping("/plan/modify")
    public String modifyCalendar(@RequestBody Calendar calendar) {
        int result = calendarService.calendarModify(calendar);

        if(result > 0) {
            return "/myedu/plan/list";
        } else {
            return "fail";
        }
    }

    @ResponseBody
    @PostMapping("/plan/delete")
    public String deleteCalendar(int id) {
        int result = calendarService.calendarDelete(id);

        if(result > 0) {
            return "/myedu/plan/list";
        } else {
            return "fail";
        }
    }

    @GetMapping("/grade/list")
    public void gradeList(@Valid PageRequestDTO pageRequestDTO,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          HttpSession session,
                          Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if(session.getAttribute("name") != null) {
            pageRequestDTO.setGrade_student(session.getAttribute("name").toString());
            PageResponseDTO<GradeDTO> responseDTO = gradeService.gradeList(pageRequestDTO);

            model.addAttribute("responseDTO", responseDTO);
        }
    }

    @GetMapping("/write/list")
    public void writeList(@Valid PageRequestDTO pageRequestDTO,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          HttpSession session,
                          Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if(session.getAttribute("member_idx") != null) {
            pageRequestDTO.setMember_idx((int)session.getAttribute("member_idx"));
            PageResponseDTO<MyQnaDTO> responseDTO = myeduService.myQnaList(pageRequestDTO);

            log.info("responseDTO : {}", responseDTO);

            model.addAttribute("responseDTO", responseDTO);
        }
    }
}
