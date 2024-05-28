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
                    <c:choose>
                        <c:when test="${present >= 1}">
                            <li><a class="nav-link black-text<c:if test="${param.menu eq 'modify'}"> active</c:if>" href="/teacher/manage/info/modify">선생님 정보 수정하기</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="nav-link black-text<c:if test="${param.menu eq 'regist'}"> active</c:if>" href="/teacher/manage/info/regist">선생님 정보 등록하기</a></li>

                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'lec'}"> active</c:if> " href="/teacher/manage/list">선생님 강의</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'noti'}"> active</c:if> " href="/teacher/manage/notice">선생님 공지사항</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'qna'}"> active</c:if> " href="/teacher/manage/qna">선생님 Q&A</a></li>
                    <li class="nav-item"><a class="nav-link black-text<c:if test="${param.menu eq 'materials'}"> active</c:if> " href="/teacher/manage/materials">선생님 자료실</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>