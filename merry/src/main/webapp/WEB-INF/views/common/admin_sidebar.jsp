<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--================ 사이드바 start =================-->

<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >

    <ul class="nav nav-pills flex-column mb-auto">

        <li class="nav-item">
            <a href="/admin/member/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'member')}">active</c:if>">회원 관리</a>
        </li>

        <li class="nav-item">
            <a href="/admin/teacher/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'teacher')}">active</c:if>">선생님 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/qna/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'qna')}">active</c:if>">1:1 문의 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/lecture/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'lecture')}">active</c:if>">강의 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/notice/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'notice')}">active</c:if>">공지사항 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/info/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'info')}">active</c:if>">교육정보 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/data/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'data')}">active</c:if>">자료실 관리</a>
        </li>
        <li class="nav-item">
            <a href="/admin/board/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'board')}">active</c:if>" >자유게시판 관리</a>
        </li>

    </ul>

</div>
<!--================ 사이드바 end =================-->