<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-lg-3">
    <div class="row g-4">
        <div class="col-lg-12 sidebar_menu" >
            <div class="mb-3">
                <h4>Categories</h4>
                <div class="empty"></div>
                <ul class="list-unstyled ps-0 fruite-categorie M01" >
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'lec'}"> active</c:if> " href="/teacher/manage/list">선생님 강의</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'noti'}"> active</c:if> " href="/teacher/manage/notice">선생님 공지사항</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'qna'}"> active</c:if> " href="/teacher/manage/qna">선생님 Q&A</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'materials'}"> active</c:if> " href="/teacher/manage/materials">선생님 자료실</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>