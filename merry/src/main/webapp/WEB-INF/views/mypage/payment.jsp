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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <title>Mypage >> payment</title>

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
<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>마이페이지</p>
                    <h1>결제내역</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end breadcrumb section -->
<div>
    <div class="container">
        <div class="row" style="display: grid;grid-template-columns: 280px 1fr;">
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="payment"/>
            </jsp:include>
            <div class="checkout-section mt-80 mb-150">
                <div class="col-auto" style="margin: 0 auto;">
                    <form id="frmSearch" name="frmSearch" method="get" action="/mypage/payment">
                        <div class="row mx-5 justify-content-center">
                            <div class="col-auto d-flex justify-content-center">
                                <input type="date" class="form-control col-4 mr-3" name="search_date1" value="${responseDTO.search_date1}">
                                ~
                                <input type="date" class="form-control col-4 ml-3" name="search_date2" value="${responseDTO.search_date2}">
                                <div>
                                    <button class="btn orange-btn bordered-btn ml-1" type="submit">검색</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="container">
                    <div class="row col-auto justify-content-center" style="margin: 0 auto;">
                        <div>
                            <form class="cart-table-wrap" action="/mypage/payment">
                                <table class="cart-table">
                                    <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th>No</th>
                                        <th>결제일</th>
                                        <th class="product-image">강의이미지</th>
                                        <th>강의정보</th>
                                        <th>가격</th>
                                        <th>상태</th>
                                        <th>구매확정</th>
                                        <th>환불</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty responseDTO && responseDTO.total_count > 0}">
                                            <c:forEach items="${responseDTO.dtoList}" var="list" varStatus="loop">
                                                <tr class="table-body-row text-center">
                                                    <td class="p-2">${responseDTO.total_count - loop.index}</td>
                                                    <td class="p-2">${list.order_date}</td>
                                                    <td class="p-2"><a href="/mypage/paymentView?order_idx=${list.order_idx}">1</a></td>
                                                    <td class="p-2">${fn:substring(list.order_date, 0, 10)}</td>
                                                    <td class="p-2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.order_total}" /></td>
                                                    <c:if test="${list.order_state == 'A'}">
                                                        <td class="p-2">결제완료</td>
                                                        <td class="p-2"><button class="btn orange-outline-btn bordered-btn" type="button" onclick="confirmOK(${list.order_idx})">신청</button></td>
                                                        <td class="p-2"><button class="btn red-outline-btn bordered-btn" type="button">요청</button></td>
                                                    </c:if>
                                                    <c:if test="${list.order_state == 'B'}">
                                                        <td class="p-2">구매확정</td>
                                                        <td class="p-2"><button class="btn orange-btn bordered-btn" type="button" disabled>완료</button></td>
                                                        <td class="p-2"><button class="btn red-btn bordered-btn" type="button" disabled>불가</button></td>
                                                    </c:if>
                                                    <c:if test="${list.order_state == 'C'}">
                                                        <td class="p-2">환불요청</td>
                                                        <td class="p-2"><button class="btn orange-btn bordered-btn" type="button" disabled>불가</button></td>
                                                        <td class="p-2"><button class="btn red-btn bordered-btn" type="button" disabled>진행중</button></td>
                                                    </c:if>
                                                    <c:if test="${list.order_state == 'D'}">
                                                        <td class="p-2">환불완료</td>
                                                        <td class="p-2"><button class="btn orange-btn bordered-btn" type="button" disabled>불가</button></td>
                                                        <td class="p-2"><button class="btn red-btn bordered-btn" type="button" disabled>완료</button></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="table-body-row text-center">
                                                <td class="p-2" colspan="8">결제 내역이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
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
        function confirmOK(order_idx) {
            let confirmYN = confirm("구매를 확정하면 환불을 요청할 수 없습니다. 구매를 확정하시겠습니까?");
            if (confirmYN) {
                changeState(order_idx);
            }
        }

        function changeState(order_idx){
            event.preventDefault();
            event.stopPropagation();
            $.ajax({
                url:'/mypage/orderUpdateState', //Controller에서 요청 받을 주소
                type:'post', //POST 방식으로 전달
                data:{order_idx},
                success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다
                    window.location.reload();
                    console.log(result);
                },
                error : function(xhr, status, error) {
                    console.error("AJAX 요청 실패!");
                    console.error("상태 코드: " + xhr.status); // HTTP 상태 코드
                    console.error("상태 텍스트: " + xhr.statusText); // 상태 텍스트
                    console.error("응답 텍스트: " + xhr.responseText); // 서버에서 반환된 응답 텍스트
                    console.error("오류: " + error); // 오류 메시지
                }
            })

        }


    </script>
</body>
</html>