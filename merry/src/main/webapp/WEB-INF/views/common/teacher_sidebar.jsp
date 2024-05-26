<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/mypage/write" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'writeBbs')}">active</c:if>">강의정보</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/writeReply" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'writeReply')}">active</c:if>">공지사항</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/qna/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'qna')}">active</c:if>">QNA</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/zzim" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'zzim')}">active</c:if>">자료실</a>
        </li>
        <li class="nav-item">
            <a href="/teacher/manage/grade" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'grade')}">active</c:if>">성적 입력</a>
        </li>
    </ul>
</div>