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
    <title>Merry</title>

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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>관리자페이지</p>
                    <h1>선생님 관리</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row" style="display: grid;grid-template-columns: 280px 1fr;">
            <jsp:include page="/WEB-INF/views/common/admin_sidebar.jsp">
                <jsp:param name="menuGubun" value="teacher"/>
            </jsp:include>
            <div class="checkout-section mt-80 mb-150">
                <div style="margin: 0 auto;">
                    <form role="search" id="frmSearch" action="/admin/teacher/list">
                        <div class="row mx-5 mb-5 justify-content-center">
                            <div class="col-8">
                                <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-merry" >검색</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="container">
                    <div style="margin: 0 auto;">
                        <div class="col-auto">
                            <table class="cart-table">
                                <thead>
                                <tr>
                                    <th>no</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>회원구분</th>
                                    <th>등록일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty responseDTO.dtoList}">
                                        <c:set value="${responseDTO.total_count}" var="total_count" />
                                        <c:forEach items="${responseDTO.dtoList}" var="memberDTO" varStatus="loop">
                                            <tr>
                                                <th>${total_count -responseDTO.page_skip_count -loop.index}</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${memberDTO.member_state eq 'N'}">
                                                            <span style="text-decoration:line-through; color:red">${memberDTO.member_id} </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${memberDTO.member_id}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${memberDTO.member_state eq 'N'}">
                                                            <span style="text-decoration:line-through; color:red">${memberDTO.name} </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${memberDTO.name}</span>
                                                            <button onclick="deleteOK('${memberDTO.member_id}')" class="btn red-outline-btn">회원탈퇴</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><c:out value="${memberDTO.member_type == 'T' ? '선생님' : '일반회원'}"/> </td>
                                                <td>${memberDTO.reg_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="bg-white text-center">
                                            <td colspan="3">등록된 선생님이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="pagination-wrap">
                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                            <c:if test="${responseDTO.page<=10}">
                            <li class="page-item disabled">
                                </c:if>
                                <c:if test="${responseDTO.page>10}">
                            <li class="page-item">
                                </c:if>
                                <a class="page-link" href="/admin/board/list${responseDTO.linked_params}&page=${responseDTO.page_block_end-10}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${responseDTO.page_block_start}"
                                       end="${responseDTO.page_block_end}"
                                       var="page_num">
                                <c:choose>
                                    <c:when test="${responseDTO.page == page_num}">
                                        <li class="page-item active">
                                            <a href="#" class="page-link">${page_num}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a href="${responseDTO.linked_params}&page=${page_num}" class="page-link">${page_num}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${(responseDTO.page_block_start+10)>(responseDTO.total_page)}">
                            <li class="page-item disabled">
                                </c:if>
                                <c:if test="${(responseDTO.page_block_start+10)<=(responseDTO.total_page)}">
                            <li class="page-item">
                                </c:if>
                                <a class="page-link" href="/admin/board/list${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
    function deleteOK(member_id) {
        let deleteYN = confirm("정말 삭제하시겠습니까?");
        if (deleteYN) {
            deleteMember(member_id);
        }
    }

    function deleteMember(member_id){
        event.preventDefault();
        event.stopPropagation();
        $.ajax({
            url:'/admin/member/delete', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{member_id},
            dataType : 'text',
            success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다
                window.location.reload();
                console.log(result);
            },
            error : function(xhr, status, error) {
                console.error("AJAX 요청 실패!");
                console.error("상태 코드: " + xhr.status); // HTTP 상태 코드
                console.error("상태 텍스트: " + xhr.statusText); // 상태 텍스트
                console.error("응답 텍스트: " + xhr.responseText); // 서버에서 반환된 응답 텍스트
                console.error("오류: " + error); // 오류 메시지
            }
        })

    }
</script>
</body>
</html>