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

    <title>Order</title>

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
                    <p>주문 페이지</p>
                    <h1>주문 상세</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-12 col-lg-9 col-xl-7">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="2">상품 정보</th>
                            <th scope="col">가격</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderlist}" var="list">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center mt-2">
                                            <img src="/resources/uploads/lecture/${list.lec_img}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                        </div>
                                    </th>
                                    <td class="py-5">${list.lec_title}</td>
                                    <td class="py-5">${list.lec_price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-5">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th scope="row">
                                </th>
                                <td class="py-5">
                                    <p class="mb-0 text-dark text-uppercase py-3">TOTAL</p>
                                </td>
                                <td class="py-5"></td>
                                <td class="py-5"></td>
                                <td class="py-5">
                                    <div class="py-3 border-bottom border-top">
                                        <p class="mb-0 text-dark">${order_total}</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                </th>
                                <td class="py-5">
                                    <p class="mb-0 text-dark py-4">결제 수단</p>
                                </td>
                                <td colspan="5" class="py-5">
                                    <div class="py-3">
                                        <select class="form-select" >
                                            <option>선택</option>
                                            <option>무통장 입금</option>
                                            <option disabled>카드결제(불가)</option>
                                            <option disabled>간편결제(불가)</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <form method="post" action="/order/order">
                        <input type="hidden" name="lec_idx" id="lec_idx" value="${lec_idx}"/>
                        <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                            <button class="btn orange-btn btn-lg w-100" type="submit">결제하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
    if (${!empty result}) alert("${result}")
    if (${!empty err}) alert("${err}")
</script>

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