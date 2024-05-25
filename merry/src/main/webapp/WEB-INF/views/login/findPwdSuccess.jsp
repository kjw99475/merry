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
    <div class="list-group text-center w1024">
        <a href="/"><img class="mb-4" src="/resources/img/header_logo.png" height="57"></a>
        <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">임시 비밀번호 확인</h1>
        <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
            <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                <div class="mb-1">
                    <div class="mb-3" >
                        <p>임시 비밀번호로 로그인 후, 비밀번호를 변경해주세요.</p>
                        <div class="input-group mb-5">
                            <span class="input-group-text">임시 비밀번호</span>
                            <input type="text" name="tmp_pwd" id="tmp_pwd" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${param.tmp_pwd}" maxlength="20">
                        </div>
                        <div class="text-center">
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/login/login?id=${param.id}'">로그인 하러가기</button>
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
