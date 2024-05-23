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
    <title>Login >> modifyPwd</title>
    <style>
        #container {
            height: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .w1024 {width: 1024px; margin: 0 auto;}
    </style>
</head>
<body>
<div id="container">
    <%@ include file="/WEB-INF/common/header.jsp" %>
    <form name="frmModifyPwd" id="frmModifyPwd" method="post" action="/login/modifyPwd">
        <input type="hidden" name="user_id" id="user_id" value="${user_id}"/>
        <div class="list-group text-center w1024">
        <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">개인정보 보호를 위해 패스워드를 변경해주세요.</h1>
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <div class="input-group mb-5">
                                <span class="input-group-text">이전 패스워드</span>
                                <input type="password" name="past_pwd" id="past_pwd" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" maxlength="100">
                            </div>
                            <div class="input-group mb-5">
                                <span class="input-group-text">새 패스워드</span>
                                <input type="password" name="pwd" id="pwd" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" maxlength="100">
                            </div>
                            <div class="input-group mb-5">
                                <span class="input-group-text">패스워드 확인</span>
                                <input type="password" name="pwd_confirm" id="pwd_confirm" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" maxlength="100">
                            </div>
                            <p class="mb-5">
                                ※ 8자 이상의 영문 소문자, 숫자, 특수문자를 모두 조합하여 설정하여 주세요.<br>
                                ※ 이전 패스워드와 같은 패스워드로는 변경할 수 없습니다.
                            </p>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary btn-sm" id="btnModify" disabled>변경하기</button>
                                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/login/login'">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>

    if (${!empty err}) alert("${err}")

    const btnModify = document.getElementById("btnModify");
    const frm = document.getElementById("frmModifyPwd");

    const pastPwdDOM = document.getElementById("past_pwd");
    const newPwdDOM = document.getElementById("pwd");
    const pwdConfirmDOM = document.getElementById("pwd_confirm");

    const pwd_reg = /^[a-z0-9!@#$%^*+=-]+$/;

    newPwdDOM.addEventListener("keyup", function(e){
        if(!pwd_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9!@#$%^*+=-]/g, '');
            alert("영문 소문자+숫자+특수문자 조합으로 최소 8자리 이상만 허용됩니다.");
        }
    });

    pwdConfirmDOM.addEventListener("keyup", function(e){
        if(!pwd_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9!@#$%^*+=-]/g, '');
            alert("영문 소문자+숫자+특수문자 조합으로 최소 8자리 이상만 허용됩니다.");
        }
    });

    pastPwdDOM.addEventListener("input", function(e) {
        if (e.target.value.length < 8) btnModify.disabled = true;
        else btnModify.disabled = false;
    }, false)

    newPwdDOM.addEventListener("input", function(e) {
        if (e.target.value.length < 8) btnModify.disabled = true;
        else btnModify.disabled = false;
    }, false)

    pwdConfirmDOM.addEventListener("input", function(e) {
        if (e.target.value.length < 8) btnModify.disabled = true;
        else btnModify.disabled = false;
    }, false)
</script>
</body>
</html>
