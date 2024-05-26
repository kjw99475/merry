<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-25
  Time: 오전 10:16
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

    <title>Mypage >> profile</title>

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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function address() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById("zipcode").value=data.zonecode;
                    document.getElementById("addr").value = data.address;
                    document.getElementById("addr_detail").focus();
                }
            }).open();
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>마이페이지</p>
                    <h1>개인정보</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid; grid-template-columns: 280px 1fr; height: 100vh;">
            <jsp:include page="/WEB-INF/views/common/teacher_sidebar.jsp">
                <jsp:param name="menuGubun" value="grade"/>
            </jsp:include>
            <div>
                <div class="container">
                    <div class="checkout-section mt-80 mb-150">
                        <button type="button" class="btn-lg btn-primary mb-2" onclick="location.href='/teacher/manage/grade/regist'">등록</button>
                        <table class="table w-100">
                            <thead>
                            <tr class="text-center">
                                <th class="w-10">no</th>
                                <th class="w-50">제목</th>
                                <th class="w-10">점수</th>
                                <th class="w-25">학생 이름</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${!empty responseDTO.dtoList}">
                                    <c:set value="${responseDTO.total_count}" var="total_count" />
                                    <c:forEach items="${responseDTO.dtoList}" var="gradeDTO" varStatus="loop">
                                        <tr class="text-center">
                                            <th>${total_count -responseDTO.page_skip_count -loop.index}</th>
                                            <td>${gradeDTO.grade_title}</td>
                                            <td>${gradeDTO.grade_score}</td>
                                            <td>${gradeDTO.grade_teacher}</td>
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
                                        <a class="page-link" href="/admin/board/list${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
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
