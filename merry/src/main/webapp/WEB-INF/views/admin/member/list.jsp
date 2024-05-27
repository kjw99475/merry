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

<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!--================ 헤더 end =================-->

<!--================ 본문 start =================-->



<div class="pt-100">
    <div class="row" style="display: grid;
    grid-template-columns: 280px 1fr;
    height: 100vh;">

        <!--================ 사이드바 start =================-->
        <jsp:include page="/WEB-INF/views/common/admin_sidebar.jsp">
            <jsp:param name="menuGubun" value="member"/>
        </jsp:include>
        <!--================ 사이드바 end =================-->


        <div>
            <div class="container">

                <div class="mt-5">
                    <!--================ 검색 start =================-->
                    <div>
                        <form role="search" id="frmSearch" action="/admin/member/list">
                            <div class="row mx-5 mb-100 justify-content-center">

<%--                                <input type="hidden" name="member_type" value="B">--%>
                                <div class="col-8">
                                    <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-merry" >검색</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--================ 검색 end =================-->

                </div>

                <table class="table w-100">

                    <thead>
                    <tr>
                        <th class="w-10">no</th>
                        <th class="w-15">아이디</th>
                        <th class="w-15">이름</th>
                        <th class="w-30">회원구분</th>
                        <th class="w-30">등록일</th>
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
                                                <button onclick="deleteOK('${memberDTO.member_id}')" class="btn-danger btn">회원탈퇴</button>
                                                <button onclick="registOK('${memberDTO.member_idx}')" class="btn btn-primary">선생님 등록</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${memberDTO.member_type}</td>
                                    <td>${memberDTO.reg_date}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr class="bg-white text-center">
                                <td colspan="3">등록된 회원이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>

                <!--================ 페이징 start =================-->
                <div class="pagination-wrap">
                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                            <c:if test="${responseDTO.page<=10}">
                            <li class="page-item disabled">
                                </c:if>
                                <c:if test="${responseDTO.page>10}">
                            <li class="page-item">
                                </c:if>
                                <a class="page-link" href="/admin/member/list${responseDTO.linked_params}&page=${responseDTO.page_block_end-10}" aria-label="Previous">
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
                                <a class="page-link" href="/admin/member/list${responseDTO.linked_params}&page=${responseDTO.page_block_start+10}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--================ 페이징 end =================-->

            </div>
        </div>

    </div>





    <!--================ 본문 end =================-->

    <!--================ 푸터 Start =================-->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!--================ 푸터 End =================-->

    <!-- jquery -->
    <script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
    <!-- bootstrap -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- count down -->
    <script src="/resources/assets/js/jquery.countdown.js"></script>
    <!-- isotope -->
    <script src="/resources/assets/js/jquery.isotope-3.0.6.min.js"></script>
    <!-- waypoints -->
    <script src="/resources/assets/js/waypoints.js"></script>
    <!-- owl carousel -->
    <script src="/resources/assets/js/owl.carousel.min.js"></script>
    <!-- magnific popup -->
    <script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
    <!-- mean menu -->
    <script src="/resources/assets/js/jquery.meanmenu.min.js"></script>
    <!-- sticker js -->
    <script src="/resources/assets/js/sticker.js"></script>
    <!-- main js -->
    <script src="/resources/assets/js/main.js"></script>

    <script>
        function deleteOK(member_id) {
            let deleteYN = confirm("정말 탈퇴 시키시겠습니까?");
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

        function registOK(member_idx) {
            let deleteYN = confirm("선생님으로 등록 하시겠습니까?");
            if (deleteYN) {
                registTeacher(member_idx);
            }
        }

        function registTeacher(member_idx){
            event.preventDefault();
            event.stopPropagation();
            $.ajax({
                url:'/admin/member/teacher', //Controller에서 요청 받을 주소
                type:'post', //POST 방식으로 전달
                data:{member_idx},
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