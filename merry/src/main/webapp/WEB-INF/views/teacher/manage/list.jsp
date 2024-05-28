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
<div class="container-fluid">
    <div class="container pt-100 mb-5">
        <div class="row mt-5">
            <jsp:include page="/WEB-INF/views/common/teacher_sidebar.jsp"/>
            <div class="col-lg-9 text-center">
                <div class="section-title">
                    <h3>선생님 강의</h3>
                </div>
                <div class="row g-4">
                    <c:forEach var="list" items="${lecturelist}">
                        <div class="single-latest-news col-lg-4">
                            <a href="manage/list?teacheridx=${list.member_idx}"><div class="latest-news-bg news-bg-1" style="background: url('/resources/uploads/lecture/${list.lec_img}'); background-size: 100% 100%">
                            </div></a>
                            <div class="news-text-box">
                                <h3><a href="#">${list.lec_title}</a></h3>
                                <p class="blog-meta border-bottom pb-1">
                                    <span class="author"><i class="fas fa-book-open"></i> ${list.lec_subject}</span>
                                    <span class="cart" onclick="addcart(${list.lec_idx})">
                                        <i class="fas fa-shopping-cart" id="cart${list.lec_idx}" <c:if test="${fn:contains(cartlist, list.lec_idx)}"> style="color: blue" </c:if>> </i>장바구니
                                    </span>
                                    <span class="zzim" onclick="addzzim(${list.lec_idx})">
                                        <i class="fas fa-heart" id="zzim${list.lec_idx}" <c:if test="${fn:contains(zzimlist, '28')}"> style="color:red" </c:if>></i>찜하기
                                    </span>
                                </p>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="btn-toolbar justify-content-center" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group">
                <button type="button" class="btn btn-outline-merry">1</button>
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
<script src="/resources/assets/js/jquery-3.7.1.min.js"></script>
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

<script>
    function addcart(lecIdx){
        if(lecIdx != 0) {
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/mypage/addcart",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx: lecIdx,
                    member_id: "${member_id}"
                },            // Json 형식의 데이터이다.
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(result == 0){
                        if(confirm("장바구니에 상품이 존재합니다.\n장바구니로 이동하시겠습니까?")){
                            window.location.href="/mypage/cart"
                        }
                    }else if(result == 1){
                        if (confirm("장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?")) {
                            window.location.href = "/mypage/cart"
                        }
                    }else{
                        alert("결제한 이력이 있는 강의 입니다.");
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }
    }
    function addzzim(lecIdx){
        if(lecIdx != 0) {
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/mypage/addzzim",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx: lecIdx
                },            // Json 형식의 데이터이다.
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    let color =  document.getElementById("zzim"+lecIdx).style.color;
                    if(color == "red"){
                        document.getElementById("zzim"+lecIdx).style.color="";
                    }else{
                        document.getElementById("zzim"+lecIdx).style.color="red";
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }
    }
</script>
</body>
</html>