<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-05-25
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <title>Mypage >> qna >> view</title>

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
    <script src="https://cdn.tiny.cloud/1/wjuflumw0txwktnvnufwfo5lj04kqmup66rnaj1jf6pnwv5d/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea#content',
            plugins: [
                'advlist','autolink',
                'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks'
                ,'fullscreen','insertdatetime','media','table','help','wordcount'
            ],
            toolbar: 'undo redo | formatpainter casechange blocks | bold italic backcolor | ' +
                'alignleft aligncenter alignright alignjustify | ' +
                'bullist numlist checklist outdent indent | removeformat | a11ycheck code table help'
        });
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
                    <h1>1:1 문의</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid; grid-template-columns: 280px 1fr;">
            <jsp:include page="/WEB-INF/views/common/mypage_sidebar.jsp">
                <jsp:param name="menuGubun" value="qna"/>
            </jsp:include>
            <div class="checkout-section mt-80 mb-150">
                <div class="container">
                    <div style="margin: 0 auto;">
                        <div class="col-auto">
                            <div class="row text-left">
                                <div class="full-width site-content col-md-12">
                                    <div>
                                        <div>
                                            <table class="table no-wrap user-table mb-0 text-lg-start">
                                                <tr class="table-light">
                                                    <th style="width: 120px;">제목<span class="fas fa-pencil-alt"></span></th>
                                                    <td>${qnaDTO.qna_title}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>작성일<span class="fas fa-calendar"></span></th>
                                                    <td>${fn:substring(qnaDTO.qna_reg_date, 0, 10)}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>내용<span class="fas fa-book"></span></th>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="p-3" style="min-height: 20vh;">
                                            ${qnaDTO.qna_content}
                                        </div>
                                        <c:if test="${!empty qnaDTO.qna_answer}">
                                            <div>
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr class="table-light">
                                                        <th>답변<span class="fas fa-book"></span></th>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="p-3" style="min-height: 20vh;">
                                                    ${qnaDTO.qna_answer}
                                            </div>
                                        </c:if>
                                        <div class="row justify-content-end mt-3">
                                            <div>
                                                <button type="button" class="btn black-outline-btn" onclick="location.href='/mypage/qna/list'">목록</button>
                                                <c:if test="${empty qnaDTO.qna_answer}">
                                                    <button type="button" class="btn orange-outline-btn" onclick="location.href='/mypage/qna/modify?qna_idx=${qnaDTO.qna_idx}'">수정</button>
                                                    <button type="button" class="btn red-outline-btn" onclick="location.href='/mypage/qna/delete?qna_idx=${qnaDTO.qna_idx}'">삭제</button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!--================ 푸터 End =================-->
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
