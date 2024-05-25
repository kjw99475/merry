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
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="profile"/>
            </jsp:include>
            <div>
                <div class="container">
                    <div class="checkout-section mt-80 mb-150">
                        <div class="list-group w1024">
                            <div style="margin-bottom: 24px;" aria-current="true">
                                <div class="d-flex w-100 justify-content-center" style="margin-bottom: 8px; padding-bottom: 4px;">
                                    <div class="mb-1">
                                        <div class="mb-3" >
                                            <div class="input-group">
                                                <span class="input-group-text">아이디</span>
                                                <input type="text" name="member_id" id="member_id" class="form-control" readonly value="${memberDTO.member_id}">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">이름</span>
                                                <input type="text" name="name" id="name" value="${memberDTO.name}" readonly class="form-control">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">이메일</span>
                                                <input type="text" class="form-control" name="email_id" id="email_id" placeholder="아이디" aria-label="email_id" value="${memberDTO.email_id}" readonly>
                                                <span class="input-group-text">@</span>
                                                <input type="text" class="form-control" name="email_domain" id="email_domain" value="${memberDTO.email_domain}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">생년월일</span>
                                                <input type="date" class="form-control" name="birthday" id="birthday" value="${memberDTO.birthday}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">핸드폰번호</span>
                                                <input type="text" class="form-control" name="phone_0" id="phone_0" value="${memberDTO.phone_0}" readonly/>
                                                <span class="input-group-text">-</span>
                                                <input type="text" class="form-control" name="phone_1" id="phone_1" value="${memberDTO.phone_1}" readonly/>
                                                <span class="input-group-text">-</span>
                                                <input type="text" class="form-control" name="phone_2" id="phone_2" value="${memberDTO.phone_2}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">우편번호</span>
                                                <input type="text" class="form-control" name="zipcode" id="zipcode" value="${memberDTO.zipcode}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">주소</span>
                                                <input type="text" class="form-control" name="addr" id="addr" value="${memberDTO.addr}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">상세주소</span>
                                                <input type="text" class="form-control" name="addr_detail" id="addr_detail" value="${memberDTO.addr_detail}" readonly/>
                                            </div>
                                        </div>
                                        <div class="mb-3" id="pwdCheck" style="display: none">
                                            <form method="post" action="/member/pwdCheck">
                                                <div class="input-group">
                                                    <span class="input-group-text">비밀번호</span>
                                                    <input type="password" name="pwd" id="pwd" class="form-control">
                                                    <button class="btn orange-btn bordered-btn ml-1" type="submit">확인</button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="mb-3" id="pwdCheck2" style="display: none">
                                            <form method="post" action="/member/pwdCheck2">
                                                <div class="input-group">
                                                    <span class="input-group-text">비밀번호</span>
                                                    <input type="password" name="pwd2" id="pwd2" class="form-control">
                                                    <button class="btn orange-btn bordered-btn ml-1" type="submit">확인</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="checkbox mb-3 text-center">
                                    <button class="btn orange-btn bordered-btn" type="button" id="btnModify">수정</button>
                                    <button class="btn red-outline-btn" type="button" id="btnLeave">회원탈퇴</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        if (${!empty result}) alert("${result}")
        if (${!empty err}) alert("${err}")

        const btnModify = document.getElementById("btnModify");
        const btnLeave = document.getElementById("btnLeave");
        const pwdCheckDOM = document.getElementById("pwdCheck");
        const pwdCheck2DOM = document.getElementById("pwdCheck2");

        btnModify.addEventListener("click", function (e) {
            pwdCheck2DOM.style.display = "none";
            pwdCheckDOM.style.display = "block";
        }, false);

        btnLeave.addEventListener("click", function (e) {
            const doubleCheck = confirm("정말로 탈퇴하시겠습니까?");
            if (doubleCheck) {
                pwdCheckDOM.style.display = "none";
                pwdCheck2DOM.style.display = "block";
            }
        }, false);
    </script>

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
</body>
</html>