<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/myedu/write/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'qna')}">active</c:if>">QNA</a>
        </li>
        <li class="nav-item">
            <a href="/myedu/review/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'review')}">active</c:if>">강의 후기</a>
        </li>
    </ul>
</div>