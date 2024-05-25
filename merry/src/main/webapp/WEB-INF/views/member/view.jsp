<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <title>Member >> View</title>
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
    <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">Mypage</h1>
    <form name="frmLeave" id="frmLeave" method="post" action="/member/modify">
        <div class="list-group w1024">
            <div class="list-group-item list-group-item-action" style="margin-bottom: 24px;" aria-current="true">
                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                    <div class="mb-1">
                        <div class="mb-3" >
                            <div class="input-group">
                                <span class="input-group-text">아이디</span>
                                <input type="text" name="user_id" id="user_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${memberDTO.user_id}" readonly />
                            </div>
                            <div id="div_err_user_id" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">이름</span>
                                <input type="text" name="name" id="name" value="${memberDTO.name}" maxlength="20" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly>
                            </div>
                            <div id="div_err_name" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text">패스워드</span>
                                <input type="password" name="pwd" id="pwd" maxlength="100" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div id="div_err_pwd" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="text" class="form-control" name="phone_0" id="phone_0" aria-label="email_id" value="${memberDTO.phone_0}">
                                <span class="input-group-text">-</span>
                                <input type="text" class="form-control" name="phone_1" id="phone_1"  aria-label="email_domain" value="${memberDTO.phone_1}">
                                <span class="input-group-text">-</span>
                                <input type="text" class="form-control" name="phone_2" id="phone_2"  aria-label="email_domain" value="${memberDTO.phone_2}">
                            </div>
                            <div id="div_err_phone" style="display: none"></div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="text" class="form-control" name="email_id" id="email_id" placeholder="이메일 아이디" aria-label="email_id" value="${memberDTO.email_id}">
                                <span class="input-group-text">@</span>
                                <input type="text" class="form-control" name="email_domain" id="email_domain"  placeholder="도메인 이름" aria-label="email_domain" value="${memberDTO.email_domain}">
                            </div>
                            <div id="div_err_email" style="display: none"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <button type="submit" class="btn btn-outline-primary btn-sm" id="btnModify" disabled>변경하기</button>
                <button type="reset" class="btn btn-outline-secondary btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-danger btn-sm" id="btnLeave">회원탈퇴</button>
            </div>
        </div>
    </form>
    <%@ include file="/WEB-INF/common/footer.jsp" %>
</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
    if (${!empty err}) alert("${err}")
    if (${!empty result}) alert("${result}")

    const btnModify = document.getElementById("btnModify");
    const btnLeave = document.getElementById("btnLeave");

    const pwdDOM = document.getElementById("pwd");

    const pwd_reg = /^[a-z0-9!@#$%^*+=-]+$/;

    pwdDOM.addEventListener("keyup", function(e){
        if(!pwd_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9!@#$%^*+=-]/g, '');
            alert("영문 소문자+숫자+특수문자 조합으로 최소 8자리 이상만 허용됩니다.");
        }
    });

    pwdDOM.addEventListener("input", function(e) {
        if (e.target.value.length < 8) btnModify.disabled = true;
        else btnModify.disabled = false;
    }, false)

    btnLeave.addEventListener("click", function(e) {
        let confirm_flag = confirm("정말 탈퇴하시겠습니까?")
        if (confirm_flag) {
            location.href = "/member/leave";
        }
    }, false)
</script>
</body>
</html>
