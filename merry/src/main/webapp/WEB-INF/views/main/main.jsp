<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <title>Merry</title>

    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/css/all.min.css">
    <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet" href="/resources/assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="/resources/assets/css/main.css">
    <link rel="stylesheet" href="/resources/assets/css/responsive.css">
</head>
<body>

<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 end =================-->

<!--================ 본문 start =================-->
<!-- hero area -->
<div class="hero-area hero-bg pt-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 offset-lg-2 text-center">
                <div class="hero-text">
                    <div class="hero-text-tablecell">
                        <p class="subtitle">지식 plus, 즐거움도 plus!</p>
                        <h1>Will you merry me?</h1>
                        <div class="hero-btns">
                            <a href="/teacher/list" class="boxed-btn">선생님 만나러가기</a>
                            <a href="/lecture/list" class="bordered-btn">강의 보러가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end hero area -->

<!-- 선생님 섹션 -->
<div class="testimonail-section pt-150 pb-150 gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Our</span> Teacher</h3>
                    <p>Merry edu에서 만날 수 있는 선생님을 소개합니다.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10 offset-lg-1 text-center">
                <div class="testimonial-sliders">

                    <c:forEach items="${teacherlist}" var="teacher" varStatus="loop">
                        <div class="single-testimonial-slider">

                                <div class="client-avater">
                                    <img src="/resources/assets/img/${teacher.teacher_image}" alt="teacher_img">
                                </div>
                                <div class="client-meta">
                                    <h3>${teacher.teacher_name} 선생님<span>${teacher.subject}</span></h3>
                                    <p class="testimonial-body">
                                            ${teacher.intro}
                                    </p>
                                    <div class="col-lg-12 text-center mt-3">
                                        <a href="/teacher/manage/list?teacheridx=${teacher.member_idx}" class="boxed-btn"><i class="fas fa-home"></i> ${teacher.teacher_name} 선생님</a>
                                    </div>
                                </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //선생님 섹션 -->

<!-- 강의 섹션 -->
<div class="product-section mt-150 mb-150">
    <div class="container">

        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Our</span> Lectures</h3>
                    <p>Merry edu에서만 만날 수 있는 강의 모음.zip</p>
                </div>
            </div>
        </div>

        <div class="row">
            <c:forEach items="${lecturelist.dtoList}" var="lectureDTO" varStatus="loop">
            <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="/lecture/view?lec_idx=${lectureDTO.lec_idx}"><img src="/resources/uploads/lecture/${lectureDTO.lec_img}" alt="lecture_image" style="max-height: 120px;"></a>
                    </div>
                    <h3>${lectureDTO.lec_title}</h3>
                    <p class="product-price"><span>${lectureDTO.member_name} 선생님</span><fmt:formatNumber type="number" maxFractionDigits="3" value="${lectureDTO.lec_price}" />원</p>
                    <a href="/lecture/view?lec_idx=${lectureDTO.lec_idx}" class="cart-btn">강의 보러가기</a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- //강의 섹션 -->

<!-- 커뮤니티 섹션 -->
<div class="latest-news pt-150 pb-150 gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Our</span> Communities</h3>
                    <p>Merry edu가 제공하는 특별한 정보</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="single-latest-news">
                    <a href="/notice/list"><div class="latest-news-bg news-bg-1">
                    </div></a>
                    <div class="news-text-box">
                        <c:forEach items="${noticelist.dtoList}" var="noticeDTO" varStatus="loop">
                            <h3><a href="/notice/view?notice_idx=${noticeDTO.notice_idx}">${noticeDTO.notice_title}</a></h3>
                            <p class="blog-meta border-bottom pb-1">
                                <span class="author"><i class="fas fa-user"></i>${noticeDTO.notice_member_name}</span>
                                <span class="date"><i class="fas fa-calendar"></i>${noticeDTO.notice_reg_date}</span>
                            </p>
                        </c:forEach>
                        <a href="/notice/list" class="read-more-btn">공지사항 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-latest-news">
                    <a href="/info/list"><div class="latest-news-bg news-bg-2">
                    </div></a>
                    <div class="news-text-box">
                        <c:forEach items="${infolist.dtoList}" var="infoDTO" varStatus="loop">
                            <h3><a href="/info/view?info_idx=${infoDTO.info_idx}">${infoDTO.info_title}</a></h3>
                            <p class="blog-meta border-bottom pb-1">
                                <span class="author"><i class="fas fa-user"></i>관리자</span>
                                <span class="date"><i class="fas fa-calendar"></i>${infoDTO.info_reg_date}</span>
                            </p>
                        </c:forEach>
                        <a href="/info/list" class="read-more-btn">교육정보 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                <div class="single-latest-news">
                    <a href="/data/list"><div class="latest-news-bg news-bg-3">
                    </div></a>
                    <div class="news-text-box">
                        <c:forEach items="${datalist.dtoList}" var="dataDTO" varStatus="loop">
                            <h3><a href="/data/view?data_idx=${dataDTO.data_idx}">${dataDTO.data_title}</a></h3>
                            <p class="blog-meta border-bottom pb-1">
                                <span class="author"><i class="fas fa-user"></i>${dataDTO.data_member_name}</span>
                                <span class="date"><i class="fas fa-calendar"></i>${dataDTO.data_reg_date}</span>
                            </p>
                        </c:forEach>
                        <a href="/data/list" class="read-more-btn">자료실 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
    if (${!empty result}) alert("${result}")
    if (${!empty err}) alert("${err}")
</script>

<script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
<script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.countdown.js"></script>
<script src="/resources/assets/js/jquery.isotope-3.0.6.min.js"></script>
<script src="/resources/assets/js/waypoints.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/assets/js/jquery.meanmenu.min.js"></script>
<script src="/resources/assets/js/sticker.js"></script>
<script src="/resources/assets/js/main.js"></script>
</body>
</html>