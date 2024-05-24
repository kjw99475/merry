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
        <%--모든 선생님을 랜덤으로 보여주기, 자동 슬라이드 적용되어 있음, 클릭 시 해당 선생님 상세로 이동 --%>
        <div class="row">
            <div class="col-lg-10 offset-lg-1 text-center">
                <div class="testimonial-sliders">
                    <div class="single-testimonial-slider">
                        <a href="#">
                            <div class="client-avater">
                                <img src="/resources/assets/img/avaters/avatar1.png" alt="">
                            </div>
                            <div class="client-meta">
                                <h3>김금진 선생님<span>국어</span></h3>
                                <p class="testimonial-body">
                                    " 너의 국어 황금기- ALL 1등급으로 Gold Rush "
                                </p>
                            </div>
                            <div class="col-lg-12 text-center mt-3">
                                <a href="news.html" class="boxed-btn"><i class="fas fa-home"></i> 김금진 선생님</a>
                            </div>
                        </a>
                    </div>
                    <div class="single-testimonial-slider">
                        <a href="#">
                            <div class="client-avater">
                                <img src="/resources/assets/img/avaters/avatar2.png" alt="">
                            </div>
                            <div class="client-meta">
                                <h3>김금진 선생님<span>국어</span></h3>
                                <p class="testimonial-body">
                                    " 너의 국어 황금기- ALL 1등급으로 Gold Rush "
                                </p>
                            </div>
                            <div class="col-lg-12 text-center mt-3">
                                <a href="news.html" class="boxed-btn"><i class="fas fa-home"></i> 김금진 선생님</a>
                            </div>
                        </a>
                    </div>
                    <div class="single-testimonial-slider">
                        <a href="#">
                            <div class="client-avater">
                                <img src="/resources/assets/img/avaters/avatar3.png" alt="">
                            </div>
                            <div class="client-meta">
                                <h3>김금진 선생님<span>국어</span></h3>
                                <p class="testimonial-body">
                                    " 너의 국어 황금기- ALL 1등급으로 Gold Rush "
                                </p>
                            </div>
                            <div class="col-lg-12 text-center mt-3">
                                <a href="news.html" class="boxed-btn"><i class="fas fa-home"></i> 김금진 선생님</a>
                            </div>
                        </a>
                    </div>
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
            <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="single-product.html"><img src="/resources/assets/img/products/product-img-1.jpg" alt=""></a>
                    </div>
                    <h3>강의 제목</h3>
                    <p class="product-price"><span>김금진 선생님</span> 110,000원</p>
                    <%--메인에서도 장바구니에 추가할 수 있게..? 이미지 클릭 시 강의 상세이동? // 아니면 그냥 전체영역 클릭이나 카트 버튼을 상세보기 버튼으로 수정--%>
                    <%--최신 등록순 3개 보여주기, 아니면 슬라이드로 10개 정도 보여주기, < > 로 이동하는.. --%>
                    <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="single-product.html"><img src="/resources/assets/img/products/product-img-2.jpg" alt=""></a>
                    </div>
                    <h3>강의 제목</h3>
                    <p class="product-price"><span>김금진 선생님</span> 110,000원</p>
                    <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                <div class="single-product-item">
                    <div class="product-image">
                        <a href="single-product.html"><img src="/resources/assets/img/products/product-img-3.jpg" alt=""></a>
                    </div>
                    <h3>강의 제목</h3>
                    <p class="product-price"><span>김금진 선생님</span> 110,000원</p>
                    <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <a href="news.html" class="boxed-btn">강의 더보기</a>
            </div>
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae optio.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="single-latest-news">
                    <a href="single-news.html"><div class="latest-news-bg news-bg-1">
                        <%--backgroud-img 추가하면 됨, 대표이미지 같은 것--%>
                    </div></a>
                    <div class="news-text-box">
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <a href="single-news.html" class="read-more-btn">공지사항 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-latest-news">
                    <a href="single-news.html"><div class="latest-news-bg news-bg-2"></div></a>
                    <div class="news-text-box">
                        <h3><a href="single-news.html">A man's worth has its season, like tomato.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <a href="single-news.html" class="read-more-btn">교육정보 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                <div class="single-latest-news">
                    <a href="single-news.html"><div class="latest-news-bg news-bg-3"></div></a>
                    <div class="news-text-box">
                        <h3><a href="single-news.html">Good thoughts bear good fresh juicy fruit.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <h3><a href="single-news.html">You will vainly look for fruit on it in autumn.</a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-user"></i> Admin</span>
                            <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                        </p>
                        <a href="single-news.html" class="read-more-btn">자료실 더보기 <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
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