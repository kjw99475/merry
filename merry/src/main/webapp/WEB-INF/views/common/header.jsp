<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <div class="site-logo">
                        <a href="/main/main">
                            <img src="/resources/assets/img/merry_logo.png" style="height: 40px;" alt="">
                        </a>
                    </div>
                    <nav class="main-menu">
                        <ul>
                            <li><a href="/teacher/list">선생님</a></li>
                            <li><a href="/lecture/list">강의</a></li>

                            <li><a href="#">커뮤니티</a>
                                <ul class="sub-menu">
                                    <li><a href="/notice/list">공지사항</a></li>
                                    <li><a href="/info/list">교육정보</a></li>
                                    <li><a href="/data/list">자료실</a></li>
                                    <li><a href="/qna/list">QnA</a></li>
                                    <li><a href="/board/list">자유게시판</a></li>
                                </ul>
                            </li>
                            <c:choose>
                                <c:when test="${!empty sessionScope.member_id}">
                                    <c:if test="${sessionScope.member_type eq 'A'}">
                                        <li><a href="/admin/member/list"><i class="fas fa-user"></i> 관리자페이지</a></li>
                                        <li><a href="/login/logout"><small style="text-decoration: underline">로그아웃</small></a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.member_type eq 'B'}">
                                        <li><a href="">나의 학습방</a>
                                            <ul class="sub-menu">
                                                <li><a href="/myedu/lecture/list">나의 강의실</a></li>
                                                <li><a href="/myedu/write/list">내가 쓴 글</a></li>
                                                <li><a href="/myedu/grade/list">성적표</a></li>
                                                <li><a href="/myedu/plan/list">학습 계획표</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/member/view"><i class="fas fa-user"></i> 마이페이지</a></li>
                                        <li><a href="/login/logout"><small style="text-decoration: underline">로그아웃</small></a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.member_type eq 'T'}">
                                        <li><a href="/teacher/manage/main"><i class="fas fa-user"></i> 선생님페이지</a></li>
                                        <li><a href="/login/logout"><small style="text-decoration: underline">로그아웃</small></a></li>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${sessionScope.member_id == null}">
                                        <li><a href="/login/login"><small style="text-decoration: underline">로그인</small></a></li>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <li>
                                <div class="header-icons">
                                    <a class="shopping-cart" href="/mypage/cart"><i class="fas fa-shopping-cart"></i></a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div class="mobile-menu"></div>
                </div>
            </div>
        </div>
    </div>
</div>