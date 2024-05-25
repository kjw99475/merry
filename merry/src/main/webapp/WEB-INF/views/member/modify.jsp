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
                        <form name="frmModify" id="frmModify" method="post" action="/member/modify">
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
                                                    <span class="input-group-text">비밀번호</span>
                                                    <input type="password" name="pwd" id="pwd" value="" maxlength="300" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                                </div>
                                                <div id="div_err_pwd" style="display: none"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">이메일</span>
                                                    <input type="text" class="form-control" name="email_id" id="email_id" placeholder="아이디" aria-label="email_id" value="${memberDTO.email_id}">
                                                    <span class="input-group-text">@</span>
                                                    <input type="text" class="form-control" name="email_domain" id="email_domain" value="${memberDTO.email_domain}" readonly/>
                                                    <select class="col-4" name="domain_list" id="domain_list" value="${memberDTO.email_domain}">
                                                        <option value="">선택</option>
                                                        <option value="gmail.com" <c:out value="${memberDTO.email_domain == 'gmail.com' ? 'selected' : ''}" />>gmail.com</option>
                                                        <option value="naver.com" <c:out value="${memberDTO.email_domain == 'naver.com' ? 'selected' : ''}" />>naver.com</option>
                                                        <option value="hanmail.net" <c:out value="${memberDTO.email_domain == 'hanmail.net' ? 'selected' : ''}" />>hanmail.net</option>
                                                        <option value="nate.com" <c:out value="${memberDTO.email_domain == 'nate.com' ? 'selected' : ''}" />>nate.com</option>
                                                        <option value="direct">직접 입력</option>
                                                    </select>
                                                </div>
                                                <div id="div_err_email" style="display: none"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">생년월일</span>
                                                    <input type="date" class="form-control" name="birthday" id="birthday" value="${memberDTO.birthday}"/>
                                                </div>
                                                <div id="div_err_birthday" style="display: none"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">핸드폰번호</span>
                                                    <select class="col-3" name="phone_0" id="phone_0">
                                                        <option value="">선택</option>
                                                        <option value="010" <c:out value="${memberDTO.phone_0 == '010' ? 'selected' : ''}" />>010</option>
                                                        <option value="011" <c:out value="${memberDTO.phone_0 == '011' ? 'selected' : ''}" />>011</option>
                                                        <option value="016" <c:out value="${memberDTO.phone_0 == '016' ? 'selected' : ''}" />>016</option>
                                                        <option value="017" <c:out value="${memberDTO.phone_0 == '017' ? 'selected' : ''}" />>017</option>
                                                        <option value="018" <c:out value="${memberDTO.phone_0 == '018' ? 'selected' : ''}" />>018</option>
                                                    </select>
                                                    <span class="input-group-text">-</span>
                                                    <input type="text" class="form-control" name="phone_1" id="phone_1" value="${memberDTO.phone_1}"/>
                                                    <span class="input-group-text">-</span>
                                                    <input type="text" class="form-control" name="phone_2" id="phone_2" value="${memberDTO.phone_2}"/>
                                                </div>
                                                <div id="div_err_phone" style="display: none"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">우편번호</span>
                                                    <input type="text" class="form-control" name="zipcode" id="zipcode" onclick="address()" value="${memberDTO.zipcode}"/>
                                                </div>
                                                <div id="div_err_zipcode" style="display: none"></div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">주소</span>
                                                    <input type="text" class="form-control" name="addr" id="addr" onclick="address()" value="${memberDTO.addr}"/>
                                                </div>
                                                <span id="div_err_addr"></span>
                                            </div>
                                            <div class="mb-3">
                                                <div class="input-group">
                                                    <span class="input-group-text">상세주소</span>
                                                    <input type="text" class="form-control" name="addr_detail" id="addr_detail" value="${memberDTO.addr_detail}"/>
                                                </div>
                                                <span id="div_err_addr_detail"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="checkbox mb-3 text-center">
                                        <button class="btn orange-btn bordered-btn" type="submit" id="btnModify">수정완료</button>
                                        <button class="btn black-outline-btn" type="reset">초기화</button>
                                        <button class="btn red-outline-btn" type="button" onclick="location.href='/member/view';">수정취소</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        if (${!empty result}) alert("${result}")
        if (${!empty err}) alert("${err}")

        const domainDOM = document.getElementById("email_domain");
        const domainListDOM = document.getElementById("domain_list");

        domainListDOM.addEventListener("change", function(e) {
            if (e.target.value !== "direct") {
                domainDOM.value = e.target.value;
            } else {
                domainDOM.value = "";
                domainDOM.readOnly = false;
            }
        })
    </script>
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