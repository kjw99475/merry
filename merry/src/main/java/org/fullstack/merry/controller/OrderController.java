package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.service.OrderServiceIf;
import org.fullstack.merry.service.OrderServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/order")
public class OrderController {
    private final OrderServiceImpl orderService;
    @GetMapping("/order")
    public void order(@RequestParam(value = "lec_idx") int[] lec_idx){

    }
    @PostMapping("/order")
    public void Postorder(@RequestParam(value = "lec_idx") int[] lec_idx,
                          HttpSession session,
                          Model model){
        String member_id = (String)session.getAttribute("member_id");
        int order_total = orderService.order_total(lec_idx);
        orderService.order(member_id, order_total);
    }
}
