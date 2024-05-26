<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-25
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <title>Mypage >> qna</title>

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
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>마이페이지</p>
                    <h1>1:1 문의</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid;
    grid-template-columns: 280px 1fr;
    height: 100vh;">
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="qna"/>
            </jsp:include>
            <div class="checkout-section mt-80 mb-150">
                <div style="margin: 0 auto;">
                    <form id="frmSearch" name="frmSearch" method="get" action="/mypage/payment">
                        <div class="row mx-5 justify-content-center">
                            <div class="col-auto d-flex justify-content-center">
                                <input type="date" class="form-control col-4 mr-3" name="search_start_date" value="${responseDTO.search_word}">
                                ~
                                <input type="date" class="form-control col-4 ml-3" name="search_end_date" value="${responseDTO.search_word}">
                                <div>
                                    <button class="btn orange-btn bordered-btn ml-1" type="submit">검색</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="container">
                    <div style="margin: 0 auto;">
                        <div class="col-auto">
                    <div class="mb-1 text-right">
                        <button class="btn orange-btn bordered-btn ml-1" type="button" onclick="location.href='/mypage/qna/regist';">문의하기</button>
                    </div>
                            <form class="cart-table-wrap" action="/mypage/payment">
                                <table class="cart-table">
                                    <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th>No</th>
                                        <th>제목</th>
                                        <th>상태</th>
                                        <th>작성일</th>
                                        <th>답변일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-body-row">
                                        <td class="p-2">2</td>
                                        <td class="p-2"><a href="/mypage/qnaView?qna_type=M&qna_idx=1">강의가 재생되지 않아요.</a></td>
                                        <td class="p-2">답변전</td>
                                        <td class="p-2">2024-03-04</td>
                                        <td class="p-2">-</td>
                                    </tr>
                                    <tr class="table-body-row">
                                        <td class="p-2">1</td>
                                        <td class="p-2"><a href="/mypage/qnaView?qna_type=M&qna_idx=1">환불 관련 문의합니다.</a></td>
                                        <td class="p-2">답변완료</td>
                                        <td class="p-2">2024-03-01</td>
                                        <td class="p-2">2024-03-02</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
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
                                <a class="page-link" href="/admin/board/list${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!--================ 푸터 End =================-->
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
