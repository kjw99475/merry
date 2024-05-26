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

<!--================ breadcrumble start =================-->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>커뮤니티</p>
                    <h1>자료실</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================ breadcrumble end =================-->

<!--================ 본문 start =================-->

        <div>
            <div class="container mb-5">

                <div class="mt-5">
                    <!--================ 검색 start =================-->
                    <div>
                        <form>
                            <div class="row mx-5">
                                <select name="type" class="form-control col-1" >
                                    <option value="0" <c:if test="${responseDTO.type == 0}">selected</c:if>>제목</option>
                                    <option value="1" <c:if test="${responseDTO.type == 1}">selected</c:if>>내용</option>
                                </select>

                                <div class="col-8">
                                    <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                                </div>
                                <div class="col-3">
                                    <button type="submit" class="btn btn-merry" >검색</button>
                                </div>
                            </div>
                        </form>


                    </div>
                    <!--================ 검색 end =================-->

                </div>

                <div class="row justify-content-end m-3">
<%--                    <input type="button" class="btn btn-merry" onclick="location.href='/data/regist'" value="등록">--%>
                </div>


                <table class="table w-100">

                    <thead>
                    <tr>
                        <th class="w-10">no</th>
                        <th class="w-60">제목</th>
                        <th class="w-30">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${!empty responseDTO.dtoList}">
                            <c:set value="${responseDTO.total_count}" var="total_count" />
                            <c:forEach items="${responseDTO.dtoList}" var="bbsDTO" varStatus="loop">
                                <tr>
                                    <th>${total_count -responseDTO.page_skip_count -loop.index}</th>
                                    <td><a href="/data/view?data_idx=${bbsDTO.data_idx}" class="black-text">${bbsDTO.data_title}</a><c:if test="${bbsDTO.data_org_file_name != null and bbsDTO.data_org_file_name != '' }" ><i class="fas fa-pen"></i></c:if> </td>
                                    <td>${bbsDTO.data_reg_date}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr class="bg-white text-center">
                                <td colspan="3">등록된 글이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>

                <!--================ 페이징 start =================-->
                <div class="pagination-wrap">
                <nav class="blog-pagination justify-content-center d-flex">
                    <ul class="pagination">
                        <c:if test="${responseDTO.page<=10}">
                        <li class="page-item disabled">
                            </c:if>
                            <c:if test="${responseDTO.page>10}">
                        <li class="page-item">
                            </c:if>
                            <a class="page-link" href="/data/list${responseDTO.linked_params}&page=${responseDTO.page_block_end-10}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="${responseDTO.page_block_start}"
                                   end="${responseDTO.page_block_end}"
                                   var="page_num">
                            <c:choose>
                                <c:when test="${responseDTO.page == page_num}">
                                    <li class="page-item active">
                                        <a href="#" class="page-link">${page_num}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a href="${responseDTO.linked_params}&page=${page_num}" class="page-link">${page_num}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${(responseDTO.page_block_start+10)>(responseDTO.total_page)}">
                        <li class="page-item disabled">
                            </c:if>
                            <c:if test="${(responseDTO.page_block_start+10)<=(responseDTO.total_page)}">
                        <li class="page-item">
                            </c:if>
                            <a class="page-link" href="/data/list${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                </div>
                <!--================ 페이징 end =================-->

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