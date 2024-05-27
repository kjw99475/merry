<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-14
  Time: 오후 5:18
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

  <!-- title -->
  <title>Member >> Join</title>

  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
  <link rel="icon" type="image/x-icon" href="/resources/assets/img/merry_favicon.ico">
  <!-- google font -->
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
<div id="container">
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2 text-center">
          <div class="breadcrumb-text">
            <p>선생님페이지</p>
            <h1>선생님</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <form name="frmJoin" id="frmJoin" method="post" action="/teacher/manage/info/modify" enctype="multipart/form-data">
    <input type="hidden" name="member_idx" value="${teacherDTO.member_idx}">
    <div class="list-group w1024 mt-80 mb-150">
      <div style="margin-bottom: 24px;" aria-current="true">
        <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
          <div class="mb-1">
            <div class="mb-3">
              <div class="input-group">
                <span class="input-group-text">이름</span>
                <input type="text" name="teacher_name" id="teacher_name" readonly value="${teacherDTO.teacher_name}" maxlength="20" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
              </div>
              <div id="div_err_teacher_name" style="display: none"></div>
            </div>
            <div class="mb-3">
              <div class="input-group">
                <span class="input-group-text">과목</span>
                <select name="subject">
                  <option <c:if test="${teacherDTO.subject eq '국어'}"> selected </c:if> value="국어">국어</option>
                  <option <c:if test="${teacherDTO.subject eq '영어'}"> selected </c:if> value="영어">영어</option>
                  <option <c:if test="${teacherDTO.subject eq '수학'}"> selected </c:if> value="수학">수학</option>
                  <option <c:if test="${teacherDTO.subject eq '사회'}"> selected </c:if> value="사회">사회</option>
                  <option <c:if test="${teacherDTO.subject eq '과학'}"> selected </c:if> value="과학">과학</option>
                </select>
              </div>
              <div id="div_err_subject" style="display: none"></div>
            </div>
            <div class="mb-3">
              <div class="input-group">
                <span class="input-group-text">간단 소개글</span>
                <input type="text" id="intro" name="intro" value="${teacherDTO.intro}">
              </div>
              <div id="div_err_intro" style="display: none"></div>
            </div>
            <div class="mb-3">
              <img src="/resources/assets/img/${teacherDTO.teacher_image}" class="d-block rounded" height="100"
                   width="80" id="preview"/>
              <div class="input-group">
                <span class="input-group-text">이미지 사진</span>
                <input type="file" accept="image/png, image/jpeg" name="teacherImg" onchange="readURL(this)">
                <input type="hidden" name="upload" value="${teacherDTO.teacher_image}">
              </div>
            </div>

          </div>
        </div>
        <div class="checkbox mb-3 text-center">
          <button class="btn orange-btn bordered-btn" type="submit" id="btnLogin">등록완료</button>
          <button class="btn black-outline-btn" type="reset" onclick="location.href='/teacher/manage/info/modify?member_idx=${teacherDTO.member_idx}'">초기화</button>
        </div>
      </div>
    </div>
  </form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
  const serverValiseResult = {};
  <c:forEach items="${errors}" var="err">
  if(document.getElementById("div_err_${err.getField()}") != null) {
    document.getElementById("div_err_${err.getField()}").innerHTML = "<small style='color: red'>${err.getField()}필드는 ${err.defaultMessage}</small>";
    document.getElementById("div_err_${err.getField()}").style.display = "block";
  }
  serverValiseResult['${err.getField()}'] = '${err.defaultMessage}';
  </c:forEach>

  console.log(serverValiseResult);

  //사진 미리보기
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById('preview').src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      document.getElementById('preview').src = "";
    }
  }
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