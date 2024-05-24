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
    <link rel="shortcut icon" type="image/png" href="/resources/assets/img/favicon.png">
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



<div>

    <div class="row" style="display: grid;
    grid-template-columns: 280px 1fr;
    height: 100vh;">

        <!--================ 사이드바 start =================-->

        <div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">

            <ul class="nav nav-pills flex-column mb-auto">

                <li class="nav-item">
                    <a href="/admin/member/list" class="nav-link orange-text">회원 관리</a>
                </li>

                <li class="nav-item">
                    <a href="/admin/teacher/list" class="nav-link orange-text">선생님 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/qna/list" class="nav-link orange-text">1:1 문의 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/lecture/list" class="nav-link orange-text">강의 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/notice/list" class="nav-link orange-text">공지사항 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/info/list" class="nav-link orange-text">교육정보 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/data/list" class="nav-link orange-text">자료실 관리</a>
                </li>
                <li class="nav-item">
                    <a href="/admin/board/list" class="nav-link active">자유게시판 관리</a>
                </li>

            </ul>

        </div>
        <!--================ 사이드바 end =================-->


        <div>
            <div class="container">

                <div>
                    <!--================ 검색 start =================-->
                    <div>
                        <form>
                            <div class="row">
                                <select name="type" class="form-control col-1" >
                                    <option value="0">제목</option>
                                    <option value="1" >내용</option>
                                    <option value="2" >작성자</option>
                                </select>

                                <div class="col-8">
                                    <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" >
                                </div>
                                <div class="col-3">
                                    <button type="submit" class="btn btn-merry" >검색</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--================ 검색 end =================-->
                    <div class="row justify-content-end">
                        <input type="button" class="btn btn-merry" onclick="location.href='/admin/board/regist'" value="등록">
                    </div>
                </div>




                <table class="table w-100">

                    <thead>
                    <tr>
                        <th class="w-10">no</th>
                        <th class="w-50">제목</th>
                        <th class="w-30">작성자</th>
                        <th class="w-10">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${!empty responseDTO.dtoList}">
                            <c:set value="${responseDTO.total_count}" var="total_count" />
                            <c:forEach items="${responseDTO.dtoList}" var="bbsDTO" varStatus="loop">
                                <tr>
                                    <th>${total_count -responseDTO.page_skip_count -loop.index}</th>
                                    <td><a href="/admin/board/view?board_idx=${bbsDTO.board_idx}">${bbsDTO.board_title}</a></td>
                                    <td>${bbsDTO.board_writer}</td>
                                    <td>${bbsDTO.board_reg_date}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr class="bg-white text-center">
                                <td colspan="4">등록된 글이 없습니다.</td>
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
                            <a class="page-link" href="/admin/board/list${responseDTO.linked_params}&page=${responseDTO.page_block_end-10}" aria-label="Previous">
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
                            <a class="page-link" href="/bbs/boardList${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
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