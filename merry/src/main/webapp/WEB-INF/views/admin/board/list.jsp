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

    <title>Admin >> board</title>

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
                    <p>관리자페이지</p>
                    <h1>자유게시판 관리</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div>
        <div class="container">
            <div class="row" style="display: grid;grid-template-columns: 280px 1fr;">
                <jsp:include page="/WEB-INF/views/common/admin_sidebar.jsp">
                    <jsp:param name="menuGubun" value="bbs_board"/>
                </jsp:include>
                <div class="checkout-section mt-80 mb-150">
                    <div style="margin: 0 auto;">
                        <div class="mt-5">
                            <div>
                                <form>
                                    <div class="row mx-5 justify-content-center">
                                        <select name="type" class="form-control col-1" >
                                            <option value="0" <c:if test="${responseDTO.type == 0}">selected</c:if>>제목</option>
                                            <option value="1" <c:if test="${responseDTO.type == 1}">selected</c:if>>내용</option>
                                            <option value="2" <c:if test="${responseDTO.type == 2}">selected</c:if>>작성자</option>
                                        </select>
                                        <div class="col-8">
                                            <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                                        </div>
                                        <div>
                                            <button type="submit" class="btn orange-btn" >검색</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row justify-content-end m-3">
                            <input type="button" class="btn orange-outline-btn" onclick="location.href='/admin/board/regist'" value="등록">
                        </div>
                    </div>
                    <div class="container">
                        <div style="margin: 0 auto;">
                            <div class="col-auto cart-table-wrap">
                                <table class="cart-table">
                                    <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="w-10">No</th>
                                        <th class="w-50">제목</th>
                                        <th class="w-20">작성자</th>
                                        <th class="w-20">작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty responseDTO.dtoList}">
                                            <c:set value="${responseDTO.total_count}" var="total_count" />
                                            <c:forEach items="${responseDTO.dtoList}" var="bbsDTO" varStatus="loop">
                                                <tr class="table-body-row text-center">
                                                    <td>${total_count -responseDTO.page_skip_count -loop.index}</td>
                                                    <td class="p-2"><a href="/admin/board/view?board_idx=${bbsDTO.board_idx}" class="black-text">${bbsDTO.board_title}</a>
                                                        <c:if test="${bbsDTO.reply_count ne 0}"><span style="font-size: small; color: #6c757d">(${bbsDTO.reply_count})</span></c:if>
                                                    </td>
                                                    <td class="p-2">${bbsDTO.board_writer}</td>
                                                    <td class="p-2">${bbsDTO.board_reg_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="table-body-row text-center">
                                                <td class="p-2" colspan="4">등록된 글이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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