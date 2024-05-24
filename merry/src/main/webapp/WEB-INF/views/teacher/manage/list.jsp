<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <div class="row mt-5">
        <div class="col-lg-8 offset-lg-2 text-center">
            <div class="section-title">
                <h3>선생님</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <c:forEach var="list" items="${lecturelist}">
            <div class="col-lg-3 col-md-6">
                <div class="single-latest-news">
                    <a href="manage/list?teacheridx=${list.member_idx}"><div class="latest-news-bg news-bg-1" style="background: url('/resources/assets/img/${list.lec_img}'); background-size: 100% 100%">
                    </div></a>
                    <div class="news-text-box">
                        <h3><a href="#">${list.lec_title}</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-book-open"></i> ${list.lec_subject}</span>
                            <span class="cart"><i class="fas fa-shopping-cart"></i>장바구니</span>
                            <span class="cart"><i class="fas fa-heart"></i>찜하기</span>
                        </p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
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

</body>
</html>