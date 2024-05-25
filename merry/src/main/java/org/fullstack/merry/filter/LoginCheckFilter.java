package org.fullstack.merry.filter;

import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*", "/mypage/*", "/lecture/view", "/lecture/modify", "/lecture/regist", "/member/modify", "/member/view", "/myedu/*", "/teacher/manage/*"})
public class LoginCheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        if(session.getAttribute("member_id") == null || session.getAttribute("member_id") == "") {
            resp.sendRedirect("/login/login");
            return;
        }
        chain.doFilter(req,resp);

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}



