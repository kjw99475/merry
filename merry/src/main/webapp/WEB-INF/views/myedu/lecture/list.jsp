
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>나의 강의실</title>
    <link rel="shortcut icon" type="image/png" href="/resources/assets/img/favicon.png">
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
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>나의 강의실</p>
                    <h1>나의 강의</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="pt-100">
    <div class="container">
        <div class="mt-5">
            <!--================ 검색 start =================-->
            <div>
                <form>
                    <div class="row mx-5 justify-content-center">
                        <select name="search_type" class="form-control col-1" >
                            <option value="t">제목</option>
                        </select>

                        <div class="col-8">
                            <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-merry" >검색</button>
                        </div>
                    </div>
                </form>
            </div>
            <!--================ 검색 end =================-->
        </div>
<%--        <div class="row justify-content-end m-3">--%>
<%--            <input type="button" class="btn btn-merry" onclick="location.href='/admin/board/regist'" value="등록">--%>
<%--        </div>--%>
        <table class="table w-100">
            <thead>
            <tr class="text-center">
                <th class="w-10">no</th>
                <th class="w-50">강의명</th>
                <th class="w-10">강의 가격</th>
                <th class="w-25">선생님</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${!empty responseDTO.dtoList}">
                    <c:set value="${responseDTO.total_count}" var="total_count" />
                    <c:forEach items="${responseDTO.dtoList}" var="lectureDTO" varStatus="loop">
                        <tr class="text-center">
                            <th>${total_count -responseDTO.page_skip_count -loop.index}</th>
                            <td id="lecture_title${lectureDTO.lec_idx}"><a href="#">${lectureDTO.lec_title}</a></td>
                            <td>${lectureDTO.lec_price}</td>
                            <td>${lectureDTO.member_name}</td>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
<c:forEach items="${responseDTO.dtoList}" var="lectureDTO">
    document.getElementById("lecture_title${lectureDTO.lec_idx}").addEventListener("click", function() {
        window.open("/myedu/lecture/view?lec_idx=${lectureDTO.lec_idx}", "_blank");
    });
</c:forEach>
</script>
</body>
</html>
