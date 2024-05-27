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
                        <form action="/teacher/manage/grade/regist" method="post">
                            <label>시험 제목</label>
                            <input type="text" class="form-control" name="grade_title">
                            <div id="div_err_grade_title" style="display: none"></div>

                            <label>점수</label>
                            <input type="text" class="form-control" name="grade_score">
                            <div id="div_err_grade_score" style="display: none"></div>

                            <label>학생 이름</label>
                            <input type="text" class="form-control" name="grade_student">
                            <div id="div_err_grade_student" style="display: none"></div>

                            <label>선생님 이름</label>
                            <input type="text" class="form-control" name="grade_teacher" value="${sessionScope.name}" readonly>
                            <div id="div_err_grade_teacher" style="display: none"></div>

                            <button type="sumbit" class="btn btn-primary mt-4">성적 등록</button>
                        </form>
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
        const serverValidResult = {};
        <c:forEach items="${errors}" var="err">
            if(document.getElementById("div_err_${err.getField()}") != null) {
                document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red;'>${err.defaultMessage}</span>";
                document.getElementById("div_err_${err.getField()}").style.display = "block";
            }
            serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
        </c:forEach>
    </script>
</body>
</html>
