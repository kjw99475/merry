<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<!-- hero area -->
<!-- end hero area -->

<!-- 선생님 섹션 -->
<div class="container pt-100 mb-5">
    <div class="mt-5">
        <h1 style="width: 75%; margin: 0 auto 20px; text-align: center;">강의 Q&A</h1>
    </div>
    <div class="row">
        <div class="col-xl">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="mb-3"></div>
                    <div class="mb-3">
                        <label class="form-label" for="basic-default-fullname">작성자</label>
                        <input type="text" readonly class="form-control" id="member_id" name="member_id"
                               value="${qnaDTO.qna_member_name}"/>
                    </div>
                    <input type="hidden" name="qna_category" value="qna">
                    <div class="mb-3"></div>
                    <div class="mb-3">
                        <label class="form-label" for="basic-default-fullname">문의 제목</label>
                        <input type="text" readonly class="form-control" id="qna_title" name="qna_title"
                               value="${qnaDTO.qna_title}"/>

                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="basic-default-fullname">등록일</label>
                        <input type="text" readonly class="form-control" id="qna_reg_date"
                               name="qna_title"
                               value="${fn:substring(qnaDTO.qna_reg_date, 0, 10)} / ${fn:substring(qnaDTO.qna_reg_date, 11, 20)}"/>

                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="basic-default-company">문의 내용</label>
                        <textarea style="resize:none;" class="form-control" readonly name="qna_content"
                                  rows="10" id="qna_content">${qnaDTO.qna_content}</textarea>

                    </div>
                    <c:if test="${qnaDTO.qna_answer_yn eq 'N' and (qnaDTO.member_idx eq sessionScope.member_idx)}">
                        <button type="submit" class="btn btn-primary"
                                onclick="location.href='/lecture/qna/modify?qna_idx=${qnaDTO.qna_idx}'">수정하기
                        </button>
                        <button type="button" id="deleteA" onclick="qnaDelete(${qnaDTO.qna_idx})"
                                class="btn btn-danger">글 삭제
                        </button>

                    </c:if>
                    <button type="reset" class="btn btn-secondary" onclick="location.href='/lecture/qna/list?lec_idx=${qnaDTO.qna_lec_idx}'">
                        QnA 게시판으로
                    </button>


                    <c:if test="${qnaDTO.qna_answer_yn eq 'N'}">
                        <c:if test="${sessionScope.member_idx eq qnaDTO.qna_answer_idx}">
                            <button type="button" class="btn btn-primary"
                                    onclick="location.href='/lecture/qna/teacherWrite?qna_idx=${qnaDTO.qna_idx}'">
                                답변달기
                            </button>
                        </c:if>
                    </c:if>
                </div>

            </div>
            <c:if test="${qnaDTO.qna_answer_yn eq 'Y'}">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">답변</h5>
                        <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                        <input type="hidden" name="member_id" value="abc01">
                        <input type="hidden" name="qna_category" value="one">
                        <div class="mb-3"></div>

                        <div class="mb-3">
                            <label class="form-label" for="basic-default-fullname">등록일</label>
                            <input type="text" readonly class="form-control" id="qna_answer_date"
                                   name="qna_answer_date"
                                   value="${fn:substring(qnaDTO.qna_answer_reg_date, 0, 10)} / ${fn:substring(qnaDTO.qna_answer_reg_date, 11, 20)}"/>

                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-default-company">답변 내용</label>
                            <textarea style="resize:none;" class="form-control" readonly rows="10"
                                      name="qna_answer" id="qna_answer">${qnaDTO.qna_answer}</textarea>

                        </div>
                        <c:if test="${sessionScope.member_idx eq qnaDTO.qna_answer_idx}">
                            <button type="button" id="adminDelete" class="btn btn-primary">답변삭제</button>
                            <button type="button" class="btn btn-primary"
                                    onclick="location.href='/lecture/qna/teacherWrite?qna_idx=${qnaDTO.qna_idx}'">
                                답변수정
                            </button>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>

    </div>

</div>
<!-- //커뮤니티 섹션 -->

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
    const serverValidResult = {}; //JSON 객체 빈값으로 선언
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(serverValidResult);


    document.getElementById("adminDelete").addEventListener("click", () => {
        let yn = confirm("답변을 삭제 하시겠습니까?");
        if (yn) {
            location.href = "/lecture/qna/teacherDelete?qna_idx=${qnaDTO.qna_idx}";
        }

    });

    function qnaDelete(qna_idx) {
        let yn = confirm("문의글을 삭제 하시겠습니까?");
        if (yn) {
            location.href = "/lecture/qna/delete?qna_idx=" + qna_idx;
        }

    }
</script>

</body>
</html>