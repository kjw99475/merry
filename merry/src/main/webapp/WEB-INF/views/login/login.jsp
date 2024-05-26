<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-13
  Time: 오후 5:25
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
    <title>Login</title>

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

</head>
<body>
<div class="text-center d-flex align-items-center pt-100">
    <main class="form-signin" style="width: 100%; max-width: 330px; margin: 50px auto;">
        <form name="frmLogin" id="frmLogin" method="post" action="/login/login">
            <input type="hidden" name="acc_url" id="acc_url" value="${acc_url}" />
            <a href="/"><img class="mb-4" src="/resources/assets/img/merry_logo.png" height="57"></a>
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title mb-5">
                    <h3>Login</h3>
                </div>
            </div>
            <div class="form-floating d-flex">
                <label for="member_id"><i class="fas fa-user mr-2" style="line-height: 33px;"></i></label>
                <c:choose>
                    <c:when test="${!empty param.id}">
                        <input type="text" class="form-control" name="member_id" id="member_id" value="${param.id}" maxlength="50" placeholder="아이디를 입력해주세요."/>
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="form-control" name="member_id" id="member_id" value="${save_id}" maxlength="50" placeholder="아이디를 입력해주세요."/>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-floating d-flex my-3">
                <label for="pwd"><i class="fas fa-key mr-2" style="line-height: 33px;"></i></label>
                <input type="password" class="form-control" name="pwd" id="pwd" value="" maxlength="100" placeholder="비밀번호를 입력해주세요."/>
            </div>
            <div class="checkbox mb-3">
                <label style="margin-right: 10%"><input type="checkbox" name="save_id" id="save_id"
                        <c:out value="${!empty save_id ? 'checked' : ''}" />/> 아이디저장</label>
            </div>
            <button class="w-100 btn btn-lg orange-btn mb-3 bordered-btn" type="submit" id="btnLogin" disabled>로그인</button>
            <a href="/member/join" style="color: inherit; opacity: .65" ><span style="text-decoration: underline">회원가입</span></a>
        </form>
    </main>
</div>
<script>
    if (${!empty result}) alert("${result}")
    if (${!empty err}) alert("${err}")

    const btnLogin = document.getElementById("btnLogin");
    const frm = document.getElementById("frmLogin");
    const idDOM = document.getElementById(("member_id"));
    const pwdDOM = document.getElementById("pwd");

    // const id_reg = /^[a-z0-9]+$/;
    // const pwd_reg = /^[a-zA-Z0-9!@#$%^*+=-]+$/;
    //
    // idDOM.addEventListener("keyup", function(e){
    //     if(!id_reg.test(this.value)){
    //         this.value = this.value.replace(/[^a-z0-9]/g, '');
    //         alert("영어 소문자 및 숫자만 입력이 가능합니다.");
    //     }
    // });
    //
    // pwdDOM.addEventListener("keyup", function(e){
    //     if(!pwd_reg.test(this.value)){
    //         this.value = this.value.replace(/[^a-zA-Z0-9!@#$%^*+=-]/g, '');
    //         alert("영어+숫자+특수문자 조합으로 최소 8자리 이상만 허용됩니다.");
    //     }
    // });

    pwdDOM.addEventListener("input", function(e) {
        if (e.target.value.length > 8) btnLogin.disabled = false;
        else btnLogin.disabled = true;
    }, false)

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