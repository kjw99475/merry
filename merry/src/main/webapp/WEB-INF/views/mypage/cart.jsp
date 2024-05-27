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

    <title>Mypage >> cart</title>

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
                    <h1>장바구니</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid; grid-template-columns: 280px 1fr;">
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="cart"/>
            </jsp:include>
            <div class="cart-section mt-80 mb-150">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="cart-table-wrap" action="/mypage/payment">
                                <table class="cart-table">
                                    <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove">선택</th>
                                        <th class="product-image">강의이미지</th>
                                        <th>강의제목</th>
                                        <th>가격</th>
                                        <th>주문</th>
                                        <th>삭제</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty responseDTO && responseDTO.total_count > 0}">
                                            <c:forEach items="${responseDTO.dtoList}" var="list" varStatus="loop">
                                                <tr class="table-body-row text-center">
                                                    <td><input type="checkbox" name="lec_idx" value="${list_lec_idx}"/></td>
                                                    <td class="p-2 product-image"><img src="/resources/uploads/lecture/${list.lec_img}" width="50px"></td>
                                                    <td class="p-2"><a href="/lecture/view?lec_idx=${list.lec_idx}">${list.lec_title}</a></td>
                                                    <td class="p-2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.lec_price}" /></td>
                                                    <td class="p-2"><button class="btn orange-outline-btn bordered-btn" type="button" onclick="location='/order/order?lec_idx=${list.lec_idx}'">주문</button></td>
                                                    <td class="p-2"><button class="btn red-outline-btn bordered-btn" type="button" onclick="deleteOK(${list.cart_idx})">삭제</button></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="table-body-row text-center">
                                                <td class="p-2" colspan="6">장바구니 내역이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="col-md-4 text-left">
                            <div class="mb-3">
                                <button class="btn btn-lg orange-outline-btn bordered-btn mr-1" type="button" >선택 주문</button>
                                <button class="btn btn-lg orange-btn bordered-btn" type="button" onclick="location='/order/order?lec_idx=25,38,47'">전체 주문</button>
                            </div>
                            <div>
                                <button class="btn btn-lg red-outline-btn bordered-btn mr-1" type="button">선택 삭제</button>
                                <button class="btn btn-lg red-btn bordered-btn" type="button">전체 삭제</button>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="total-section">
                                <table class="total-table">
                                    <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="total-data">
                                        <td><strong>총 상품금액</strong></td>
                                        <td>&#8361; 500</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>총 할인금액</strong></td>
                                        <td>&#8361; 0</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>최종 결제금액</strong></td>
                                        <td>&#8361; 455</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
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
        function deleteOK(cart_idx) {
            let confirmYN = confirm("장바구니를 삭제하시겠습니까?");
            if (confirmYN) {
                deleteCart(cart_idx);
            }
        }

        function deleteCart(cart_idx){
            event.preventDefault();
            event.stopPropagation();
            $.ajax({
                url:'/mypage/deletecart', //Controller에서 요청 받을 주소
                type:'post', //POST 방식으로 전달
                data:{cart_idx},
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