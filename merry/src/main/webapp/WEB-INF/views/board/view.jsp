<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

<!--================ breadcrumble start =================-->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>커뮤니티</p>
                    <h1>자유게시판</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================ breadcrumble end =================-->

<!--================ 본문 start =================-->

        <div>
            <div class="container mb-5">

                <div class="row mt-5">
                    <div class="col-lg-12 mb-5 mb-lg-0">
                        <div class="form-title">
                            <h2></h2>

                        </div>
                        <div class="contact-form">
                            <form id="frm_" name="frm_" method="post" action="/admin/board/delete">
                                <input type="hidden" name="board_idx" value="${boardDTO.board_idx}">
                                <%--                                <label for="board_title">제목</label>--%>
                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                    <tr class="table-light">
                                        <th style="width: 120px;">제목<span class="fas fa-pencil-alt"></span></th>
                                        <td>${boardDTO.board_title}</td>
                                    </tr>
                                    <tr class="table-light">
                                        <th>작성자<span class="fas fa-user"></span></th>
                                        <td>${boardDTO.board_writer}</td>
                                    </tr>
                                    <tr class="table-light">
                                        <th>작성일<span class="fas fa-calendar"></span></th>
                                        <td>${boardDTO.board_reg_date}</td>
                                    </tr>
                                    <tr class="table-light">
                                        <th>내용<span class="fas fa-book"></span></th>
                                        <td>
                                            <div class="overflow-auto" style="max-height: 500px;">${boardDTO.board_content}</div>
                                        </td>
                                    </tr>
                                </table>

                                <div class="row justify-content-between mt-3">
                                    <button type="button" class="btn btn-outline-merry" onclick="delete_();">삭제</button>
                                    <script>
                                        const frm = document.querySelector("#frm_");
                                        function delete_() {
                                            let chk_del = confirm("삭제하시겠습니까?");
                                            if(chk_del) {
                                                frm.submit();
                                            }
                                        }
                                    </script>
                                    <div>
                                        <button type="button" class="btn btn-outline-merry" onclick="location.href='/board/list'">목록</button>
                                        <button type="button" class="btn btn-merry" onclick="location.href='/board/modify?board_idx=${boardDTO.board_idx}'">수정</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>


                <div class="mt-5 col-12">
                    <h5>댓글 리스트<c:if test="${boardDTO.reply_count ne 0}">(${boardDTO.reply_count})</c:if></h5>
                    <hr>

                    <form action="/board/reply/registReply" id="replyRegist" method="post">
                        <input type="hidden" value="${boardDTO.board_idx}"  name="board_idx">
                        <input type="hidden" value="${sessionScope.member_idx}"  name="member_idx">
                        <input type="hidden" value="${sessionScope.name}"  name="reply_writer">
                        <div class="mb-3">
                            <label class="form-label">댓글 </label>
                            <input type="text" class="form-control" name="reply_comment" id="reply_comment" maxlength="100" placeholder="댓글을 입력하세요">
                            <div id="div_err_reply_comment" style="display: none"></div>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button class="btn btn-merry me-md-2 mb-2" id="replySubmit" onclick="regist_reply(${boardDTO.board_idx})" type="button">댓글등록</button>
                            <script>
                                function regist_reply(board_idx, reply_writer, member_idx) {
                                    let comment = document.getElementById("reply_comment").value;
                                    $.ajax({
                                        type: "POST",            // HTTP method type(GET, POST) 형식이다.
                                        url: "/board/reply/registReply",      // 컨트롤러에서 대기중인 URL 주소이다.
                                        data: {
                                            board_idx: board_idx,
                                            reply_comment: comment
                                        },            // Json 형식의 데이터이다.
                                        success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                                            window.location.reload();
                                        },
                                        error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                                            console.log(error);
                                        }
                                    });
                                }
                            </script>
                        </div>
                    </form>


                    <ul style="list-style: none" class="p-0">
                        <c:choose>
                            <c:when test="${not empty replyDTOList}">
                                <c:forEach items="${replyDTOList}" var="reply" varStatus="status">
                                    <form action="/board/reply/deleteReply" method="post" id="frm_reply_delete">
                                        <input type="hidden" name="board_idx" value="${boardDTO.board_idx}">
                                        <input type="hidden" name="reply_idx" value="${reply.reply_idx}">

                                    <li class="border-top border-bottom">
                                        <span><span class="fas fa-user"></span> ${reply.reply_writer}</span>
                                        <p>${reply.reply_comment}</p>
                                        <span style="font-size: smaller">${reply.reply_reg_date}</span>
                                        <c:if test="${reply.member_idx eq sessionScope.member_idx or sessionScope.member_type eq 'A'}">
                                        <button class="btn-danger" id="btn-danger" onclick="delete_reply(${boardDTO.board_idx}, ${reply.reply_idx})" type="button"> 삭제 </button>
                                            <script>
                                                function delete_reply(board_idx, reply_idx) {
                                                    if (confirm("해당 댓글을 삭제하시겠습니까?")) {
                                                        $.ajax({
                                                            type: "POST",            // HTTP method type(GET, POST) 형식이다.
                                                            url: "/board/reply/deleteReply",      // 컨트롤러에서 대기중인 URL 주소이다.
                                                            data: {
                                                                reply_idx: reply_idx,
                                                                board_idx: board_idx
                                                            },            // Json 형식의 데이터이다.
                                                            success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                                                                window.location.reload();
                                                            },
                                                            error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                                                                console.log(error);
                                                            }
                                                        });
                                                    }
                                                }
                                            </script>
                                        </c:if>
                                    </li>
                                    </form>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <li style="color: rgb(0,0,0,0.5); text-align: center">등록된 댓글이 없습니다.</li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>


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

</body>
</html>