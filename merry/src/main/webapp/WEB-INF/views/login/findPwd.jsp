<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-14
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <title>Login >> findPwd</title>
    <style>
        #container {
            height: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .w1024 {width: 1024px; margin: 50px auto;}
    </style>
</head>
<body>
<div id="container">
    <form name="frmFindPwd" id="frmFindPwd" method="post" action="/login/findPwd">
        <div class="list-group text-center w1024">
        <a href="/"><img class="mb-4" src="/resources/img/header_logo.png" height="57"></a>
        <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">패스워드를 잊으셨나요?</h1>
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <p>본인인증을 진행하기 위해 아이디를 입력하여 주세요.</p>
                            <div class="input-group mb-5">
                                <span class="input-group-text">아이디</span>
                                <input type="text" name="user_id" id="user_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" maxlength="20">
                            </div>
                            <p class="mb-5">
                                ※ 아이디 입력 후, 임시비밀번호 발송 버튼을 눌러주세요.<br>
                                ※ 가입하신 이메일 주소로 임시비밀번호가 발송됩니다.<br>
                                메일 서비스에 따라 다소 시간이 걸릴 수 있습니다.<br>
                                ※ 임시비밀번호는 발송 후, 1시간 내에만 유효합니다.
                            </p>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary btn-sm">임시비밀번호 발송</button>
                                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/login/login'">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>

    if (${!empty err}) alert("${err}")

    const idDOM = document.getElementById(("user_id"));
    const id_reg = /^[a-z0-9]+$/;

    idDOM.addEventListener("keyup", function(e){
        if(!id_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9]/g, '');
            alert("영어 소문자 및 숫자만 입력이 가능합니다.");
        }
    });

</script>
</body>
</html>
