<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/lecture/notice/list?lec_idx=${lec_idx}" class="nav-link black-text">공지사항</a>
        </li>
        <li class="nav-item">
            <a href="/lecture/qna/list?lec_idx=${lec_idx}" class="nav-link black-text">QNA</a>
        </li>
        <li class="nav-item">
            <a href="/lecture/data/list?lec_idx=${lec_idx}" class="nav-link black-text">자료실</a>
        </li>
    </ul>
</div>