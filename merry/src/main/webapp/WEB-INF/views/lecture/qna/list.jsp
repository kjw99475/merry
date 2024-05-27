<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <!-- title -->
    <title>Merry</title>

    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="/resources/assets/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
    <!-- animate css -->
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <!-- mean menu css -->
    <link rel="stylesheet" href="/resources/assets/css/meanmenu.min.css">
    <!-- main style -->
    <link rel="stylesheet" href="/resources/assets/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="/resources/assets/css/responsive.css">

</head>
<body>

<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 end =================-->

<!--================ 본문 start =================-->
<!-- hero area -->
<!-- end hero area -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p><a href="/lecture/view?lec_idx=${lectureDTO.lec_idx}"> ${lectureDTO.lec_title}</a> </p>
                    <h1>강의 QnA</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 선생님 섹션 -->
<div class="container pt-100 mb-5">

    <c:if test="${not empty sessionScope.member_idx}">
        <div class="col-lg-12 text-right mt-3">
            <a href="/lecture/qna/regist?lec_idx=${lec_idx}" class="boxed-btn">글작성</a>
        </div>
    </c:if>
    <table class="table">
        <colgroup class="w-100">
            <col class="w-5">
            <col class="w-5">
            <col class="w-65">
            <col class="w-10">
            <col class="w-15">
        </colgroup>

        <thead>
        <tr>
            <th>no</th>
            <th>답변여부</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty qnaList}">
                <c:forEach var="list" items="${qnaList}" varStatus="i">
                    <tr>
                        <td>${i.count}</td>
                        <td><c:if test="${list.qna_answer_yn eq 'Y'}">답변완료</c:if>
                            <c:if test="${list.qna_answer_yn eq 'N'}">답변대기</c:if></td>
                        <td>
                            <c:set var="title" value="${list.qna_title}"/>
                            <c:choose>
                                <c:when test="${fn:length(title) > 10}">
                                    <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${fn:substring(title, 0, 10)}...</strong></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${list.qna_title}</strong></a>
                                </c:otherwise>
                            </c:choose></td>
                        <td>${list.qna_member_name}</td>
                        <td>${fn:substring(list.qna_reg_date, 0, 10)} / ${fn:substring(list.qna_reg_date, 11, 20)}</td>
                    </tr>
                    <c:if test="${list.qna_answer_yn eq 'Y'}">
                        <tr>
                            <td></td>
                            <td class="text-nowrap"><span class="badge bg-label-info me-1">답변</span>
                            </td>
                            <td class="text-nowrap">
                                <c:set var="answer" value="${list.qna_answer}"/>
                                <c:choose>
                                    <c:when test="${fn:length(answer) > 10}">
                                        <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${fn:substring(answer, 0, 10)}</strong></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${list.qna_answer}</strong></a>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td class="text-nowrap"><strong>${list.qna_answer_name}</strong></td>
                            <td>
                                <strong>${fn:substring(list.qna_answer_reg_date, 0, 10)} / ${fn:substring(list.qna_answer_reg_date, 11, 20)}</strong>
                            </td>
                            <td></td>

                        </tr>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                등록된 게시글이 없습니다.
            </c:otherwise>
        </c:choose>

        </tbody>
    </table>

</div>
<!-- //커뮤니티 섹션 -->

<!--================ 본문 end =================-->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<!-- jquery -->
<script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
<!-- bootstrap -->
<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<!-- count down -->
<script src="/resources/assets/js/jquery.countdown.js"></script>
<!-- isotope -->
<script src="/resources/assets/js/jquery.isotope-3.0.6.min.js"></script>
<!-- waypoints -->
<script src="/resources/assets/js/waypoints.js"></script>
<!-- owl carousel -->
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<!-- magnific popup -->
<script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
<!-- mean menu -->
<script src="/resources/assets/js/jquery.meanmenu.min.js"></script>
<!-- sticker js -->
<script src="/resources/assets/js/sticker.js"></script>
<!-- main js -->
<script src="/resources/assets/js/main.js"></script>

</body>
</html>