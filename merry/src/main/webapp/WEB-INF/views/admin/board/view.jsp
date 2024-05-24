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

<!--================ 본문 start =================-->



<div class="pt-100">

    <div class="row" style="display: grid;
    grid-template-columns: 280px 1fr;
    height: 100vh;">

        <!--================ 사이드바 start =================-->

        <div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" >

            <ul class="nav nav-pills flex-column mb-auto">

                <li class="nav-item">
                    <a href="/admin/member/list" class="nav-link black-text">회원 관리</a>
                </li>

                <li class="nav-item">
                    <a href="/admin/teacher/list" class="nav-link black-text">선생님 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/qna/list" class="nav-link black-text">1:1 문의 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/lecture/list" class="nav-link black-text">강의 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/notice/list" class="nav-link black-text">공지사항 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/info/list" class="nav-link black-text">교육정보 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/data/list" class="nav-link black-text">자료실 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/board/list" class="nav-link active">자유게시판 관리</a>
                </li>

            </ul>

        </div>
        <!--================ 사이드바 end =================-->


        <div>
            <div class="container">

                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="form-title">
                            <h2></h2>

                        </div>
                        <div id="form_status"></div>
                        <div class="contact-form">
                            <form id="frm_" name="frm_" method="post" action="/admin/board/delete">
                                    <input type="hidden" name="board_idx" value="${boardDTO.board_idx}">
<%--                                <label for="board_title">제목</label>--%>
                                <div><span class="font-weight-bold">제목 : </span>${boardDTO.board_title}</div>

                                <div class="overflow-auto mt-4" style="max-height: 500px;">${boardDTO.board_content}</div>

                                <div class="row justify-content-between mt-3">
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
                                    <div>
                                        <button type="button" class="btn btn-outline-merry" onclick="location.href='/admin/board/list'">목록</button>
                                        <button type="button" class="btn btn-merry" onclick="location.href='/admin/board/modify?board_idx=${boardDTO.board_idx}'">수정</button>
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