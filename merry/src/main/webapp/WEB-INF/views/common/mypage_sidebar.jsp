<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/mypage/profile" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'profile')}">active</c:if>">개인정보</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/write" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'write')}">active</c:if>">작성글</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/qna" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'qna')}">active</c:if>">1:1문의</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/zzim" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'zzim')}">active</c:if>">찜한 강의</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/cart" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'cart')}">active</c:if>">장바구니</a>
        </li>
        <li class="nav-item">
            <a href="/mypage/payment" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'payment')}">active</c:if>">결제내역</a>
        </li>
    </ul>
</div>