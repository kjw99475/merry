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
강의 이미지 가져와주세여 ㅜㅜ lec_img 가져오시면 됩니다!
찜버튼이랑 구매 버튼이랑 장바구니 버튼만 만들어 주시면 제가 이동 붙일게요!

소개 / 목차 / qna / 자료실 버튼 만들어주시면 제가 이동 붙일게요!


${lectureDTO.lec_idx}<br>
${lectureDTO.lec_title}<br>
${lectureDTO.lec_content}<br>
${lectureDTO.lec_status}<br>

${lectureDTO.lec_reg_date}<br>
${lectureDTO.lec_modify_date}<br>
${lectureDTO.member_idx}<br>
${lectureDTO.lec_img}<br>
${lectureDTO.member_name}<br>
<ul>
<c:forEach items="${ChapterList}" var="chapDTO">
    <li>${chapDTO.chap_idx} ${chapDTO.chap_title} ${chapDTO.chap_video} ${chapDTO.chap_time} ${chapDTO.chap_status}</li>
</c:forEach>
</ul>

<button type="button" onclick="location.href='/lecture/modify?lec_idx=${lectureDTO.lec_idx}'">수정하기</button>

<c:if test="${lectureDTO.lec_status eq 'Y'}">
<form action="/lecture/delete" id="frmDelete" method="post">
    <input type="hidden" name="lec_idx" value="${lectureDTO.lec_idx}">
    <button type="button" onclick="deleteOK()">삭제하기</button>
</form>
</c:if>
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

<script>
    function deleteOK() {
        const frmDelete = document.querySelector("#frmDelete");
        let deleteYN = confirm("정말 삭제하시겠습니까? \n 삭제하시면 리스트에 나타나지 않습니다.");
        if (deleteYN) {
            frmDelete.submit();
        }
    }
</script>

</body>
</html>
