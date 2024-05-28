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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <title>Mypage >> zzim</title>

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
                    <h1>찜 한 강의</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid;grid-template-columns: 280px 1fr;">
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="zzim"/>
            </jsp:include>
            <div class="cart-section mt-80 mb-150">
                <div class="container">
                    <div>
                        <div style="margin: 0 auto;">
                            <form class="cart-table-wrap" action="/mypage/payment">
                                <table class="cart-table">
                                    <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove">선택</th>
                                        <th class="product-image">강의이미지</th>
                                        <th>강의제목</th>
                                        <th>가격</th>
                                        <th>장바구니</th>
                                        <th>찜 삭제</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty responseDTO && responseDTO.total_count > 0}">
                                            <c:forEach items="${responseDTO.dtoList}" var="list" varStatus="loop">
                                                <tr class="table-body-row text-center">
                                                    <td><input type="checkbox"/></td>
                                                    <td class="p-2 product-image"><img src="/resources/uploads/lecture/${list.lec_img}" width="50px"></td>
                                                    <td class="p-2"><a href="/lecture/view?lec_idx=${list.lec_idx}">${list.lec_title}</a></td>
                                                    <td class="p-2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.lec_price}" /></td>
                                                    <td class="p-2"><button class="btn orange-outline-btn bordered-btn" type="button" onclick="addcart(${list.lec_idx})">추가</button></td>
                                                    <td class="p-2"><button class="btn red-outline-btn bordered-btn" type="button" onclick="deleteMyZzim(${list.lec_idx})">삭제</button></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="table-body-row text-center">
                                                <td class="p-2" colspan="6">찜 내역이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="d-flex col-10 justify-content-between" style="margin: 0 auto;">
                            <div class="cart-buttons">
                                <button class="btn btn-lg orange-outline-btn bordered-btn" type="button">선택 추가</button>
                                <button class="btn btn-lg orange-btn bordered-btn" type="button">전체 추가</button>
                            </div>
                            <div class="cart-buttons">
                                <button class="btn btn-lg red-outline-btn bordered-btn" type="button">선택 삭제</button>
                                <button class="btn btn-lg red-btn bordered-btn" type="button">전체 삭제</button>
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

    <script>
        function deleteMyZzim(lec_idx) {
            const flag = confirm("찜에서 삭제하시겠습니까?");

            if(flag) {
                $.ajax({
                    url: "/mypage/deletezzim/",
                    type: "POST",
                    data: {
                        lec_idx: lec_idx,
                        member_id: "${member_id}"
                    },
                    success: function(result) {
                        if(result != "fail") {
                            window.location.reload(result);
                        } else {
                            alert("찜 삭제 실패");
                        }
                    }
                });
            }
        }
    </script>
</body>
</html>