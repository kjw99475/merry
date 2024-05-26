<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

<!--================ breadcrumble start =================-->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>커뮤니티</p>
                    <h1>자유게시판</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================ breadcrumble end =================-->

<!--================ 본문 start =================-->

        <div>
            <div class="container mb-5">

                <div class="row mt-5">
                    <div class="col-lg-10 mb-5 mb-lg-0">
                        <div class="form-title">
                            <h2></h2>

                        </div>
                        <div id="form_status"></div>
                        <div class="contact-form">
                            <form id="frm_" name="frm_" method="post" action="/board/delete">
                                    <input type="hidden" name="board_idx" value="${boardDTO.board_idx}">
<%--                                <label for="board_title">제목</label>--%>
                                <div><span class="font-weight-bold">제목 : </span>${boardDTO.board_title}</div>

                                <div class="overflow-auto mt-4" style="max-height: 500px;">${boardDTO.board_content}</div>

                                <div class="row justify-content-between mt-3">
                                    <div>
                                        <c:if test="${sessionScope.member_idx eq boardDTO.member_idx}">
                                        <button type="button" class="btn btn-outline-merry" onclick="delete_();">삭제</button>
                                        <script>
                                            const frm = document.querySelector("#frm_");
                                            function delete_() {
                                                let chk_del = confirm("삭제하시겠습니까?");
                                                if(chk_del) {
                                                    frm.submit();
                                                }
                                            }
                                        </script>
                                        </c:if>
                                    </div>
                                    <div>
                                        <button type="button" class="btn btn-outline-merry" onclick="location.href='/board/list'">목록</button>
                                        <c:if test="${sessionScope.member_idx eq boardDTO.member_idx}">
                                        <button type="button" class="btn btn-merry" onclick="location.href='/board/modify?board_idx=${boardDTO.board_idx}'">수정</button>
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>





            </div>
        </div>

    </div>





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