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

<!-- 선생님 섹션 -->
<div class="container pt-100 mb-5">
    <div class="mt-5">
        <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">강의 자료실</h1>
    </div>
    <c:if test="${lectureDTO.member_idx eq sessionScope.member_idx}">
        <div class="col-lg-12 text-right mt-3">
            <a href="/lecture/data/regist?lec_idx=${lec_idx}" class="boxed-btn">글작성</a>
        </div>
    </c:if>
    <table class="table">
        <colgroup class="w-100">
            <col class="w-5">
            <col class="w-70">
            <col class="w-10">
            <col class="w-15">
        </colgroup>

        <thead>
        <tr>
            <th>no</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${dataList}" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>
                    <c:set var="dtitle" value="${list.data_title}"/>
                    <c:choose>
                        <c:when test="${fn:length(dtitle) > 10}">
                            <a href="/lecture/data/view?data_idx=${list.data_idx}"><strong>${fn:substring(dtitle, 0, 10)}</strong> <c:if test="${list.data_org_file_name != null and list.data_org_file_name != '' }" ><i class="fa-solid fa-paperclip"></i></c:if></a>
                        </c:when>
                        <c:otherwise>
                            <a href="/lecture/data/view?data_idx=${list.data_idx}"><strong>${list.data_title}</strong><c:if test="${list.data_org_file_name != null and list.data_org_file_name != '' }" ><i class="fa-solid fa-paperclip"></i></c:if> </a>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${list.member_name}</td>
                <td>${list.data_reg_date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="btn-toolbar justify-content-center" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group">
            <button type="button" class="btn btn-outline-merry">1</button>
        </div>
    </div>
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
<script src="https://kit.fontawesome.com/be97bd8e1b.js" crossorigin="anonymous"></script>


</body>
</html>