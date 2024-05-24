<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

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

    <script src="/resources/assets/js/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.tiny.cloud/1/wjuflumw0txwktnvnufwfo5lj04kqmup66rnaj1jf6pnwv5d/tinymce/7/tinymce.min.js"
            referrerpolicy="origin"></script>
</head>
<body class="pt-100">
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--================ 헤더 end =================-->

<form role="search" id="frmSearch">
    <div class="mb-3 row">
        <label class="col-sm-2 col-form-label">검색 범위</label>
        <div class="col-sm-2">
            <input class="form-check-input" type="checkbox" name="search_type" id="search_type1" value="t" <c:if test="${responseDTO['search_type_st'].contains('t')}">checked</c:if>>
            <label class="form-check-label" for="search_type1">제목</label>
            <input class="form-check-input" type="checkbox" name="search_type" id="search_type2" value="u" <c:if test="${responseDTO['search_type_st'] != 'null' && responseDTO['search_type_st'].contains('u')}">checked</c:if>>
            <label for="search_type2">선생님</label>
        </div>
        <div class="col">
            <input class="form-check-label" type="search" name="search_word"  id="search_word" placeholder="Search" aria-label="Search" value="${responseDTO.search_word}">
        </div>
    </div>

    <div class="col-sm-2">
        <button class="btn btn-outline-success" id="btnSearch" type="submit">Search</button>
        <button class="btn btn-outline-success" id="btnReset" type="reset" onclick="location.href='/lecture/list'">reset</button>
    </div>

    <ul>
        <li><button type="button" name="" onclick="location.href='/lecture/list'">전체</button></li>
        <li><button name="subject_code" value="국어" <c:if test="${responseDTO.subject_code eq '국어'}">style="background-color: red;" </c:if>>국어</button></li>
        <li><button name="subject_code" value="영어" <c:if test="${responseDTO.subject_code eq '영어'}">style="background-color: red;" </c:if>>영어</button></li>
        <li><button name="subject_code" value="수학" <c:if test="${responseDTO.subject_code eq '수학'}">style="background-color: red;" </c:if>>수학</button></li>
        <li><button name="subject_code" value="사회" <c:if test="${responseDTO.subject_code eq '사회'}">style="background-color: red;" </c:if>>사회</button></li>
        <li><button name="subject_code" value="과학" <c:if test="${responseDTO.subject_code eq '과학'}">style="background-color: red;" </c:if>>과학</button></li>
    </ul>
</form>
<ul>
    <c:forEach var="lectureDTO" items="${responseDTO.dtoList}">
        <c:if test="${lectureDTO.lec_status eq 'Y'}">
            <li onclick="location.href='/lecture/view?lec_idx=${lectureDTO.lec_idx}'">${lectureDTO.lec_title}</li>
        </c:if>
    </c:forEach>
</ul>

<c:if test="${sessionScope.member_type != 'B'}">
    <button onclick="location.href='/lecture/regist'">
        강의 등록하기
    </button>
</c:if>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <li class="page-item<c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
            <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>
        </li>
        <c:forEach begin="${responseDTO.page_block_start}"
                   end="${responseDTO.page_block_end}"
                   var="page_num">
            <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if>">
                <a class="page-link" data-num="${page_num}"
                   href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
            </li>
        </c:forEach>
        <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
        </li>
    </ul>
</nav>


<!--================ 본문 end =================-->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
