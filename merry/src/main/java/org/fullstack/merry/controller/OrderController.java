package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.OrderServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/order")
public class OrderController {
    private final OrderServiceImpl orderService;
    @GetMapping("/order")
    public void order(@RequestParam(value = "lec_idx", defaultValue = "") String lec_idx,
                      HttpServletRequest request,
                      HttpSession session,
                      Model model){
        String url = request.getHeader("referer");
        log.info("referer: " + url);
        session.setAttribute("referer", url);
        List<LectureDTO> orderlist = orderService.orderlist(lec_idx);
        int order_total = orderService.order_total(lec_idx);
        model.addAttribute("lec_idx",lec_idx);
        model.addAttribute("orderlist", orderlist);
        model.addAttribute("order_total", order_total);
    }
    @PostMapping("/order")
    public void Postorder(@RequestParam(value = "lec_idx", defaultValue = "") String lec_idx,
                            HttpSession session,
                            ServletRequest request,
                            ServletResponse response,
                            Model model) throws IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String member_id = (String)session.getAttribute("member_id");
        String referer = (String)session.getAttribute("referer");

        session.removeAttribute("referer");
        if(referer != null) {
            int order_total = orderService.order_total(lec_idx);
            orderService.order(member_id, order_total, lec_idx);

            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = res.getWriter();
            out.println("<script>alert('결제가 완료되었습니다.'); location.href='" + referer + "';</script>");
            out.close();
        }else{
            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = res.getWriter();
            out.println("<script>alert('결제를 실패하였습니다.'); location.href='/';</script>");
            out.close();
        }
    }
}
