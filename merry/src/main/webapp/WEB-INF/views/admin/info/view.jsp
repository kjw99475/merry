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
        <jsp:include page="/WEB-INF/views/common/admin_sidebar.jsp">
            <jsp:param name="menuGubun" value="bbs_info"/>
        </jsp:include>
        <!--================ 사이드바 end =================-->


        <div>
            <div class="container">

                <div class="row mt-5">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="form-title">
                            <h2></h2>

                        </div>
                        <div id="form_status"></div>
                        <div class="contact-form">
                            <form id="frm_" name="frm_" method="post" action="/admin/info/delete">
                                    <input type="hidden" name="info_idx" value="${infoDTO.info_idx}">
<%--                                <label for="info_title">제목</label>--%>
                                <div><span class="font-weight-bold">제목 : </span>${infoDTO.info_title}</div>

                                <div class="overflow-auto mt-4" style="max-height: 500px;">${infoDTO.info_content}</div>

                                <c:if test="${infoDTO.info_org_file_name != null and infoDTO.info_org_file_name != '' }" >
                                    <div class="mt-4">
                                        <label>첨부파일 : </label>
                                        <span><a href="/admin/info/download?info_idx=${infoDTO.info_idx}" target="_blank">${infoDTO.info_org_file_name}</a></span>
                                    </div>
                                </c:if>

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
                                        <button type="button" class="btn btn-outline-merry" onclick="location.href='/admin/info/list'">목록</button>
                                        <button type="button" class="btn btn-merry" onclick="location.href='/admin/info/modify?info_idx=${infoDTO.info_idx}'">수정</button>
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