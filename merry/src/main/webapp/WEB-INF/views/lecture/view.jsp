<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

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

    <script src="/resources/assets/js/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.tiny.cloud/1/wjuflumw0txwktnvnufwfo5lj04kqmup66rnaj1jf6pnwv5d/tinymce/7/tinymce.min.js"
            referrerpolicy="origin"></script>
</head>
<body >
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--================ 헤더 end =================-->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>강의</p>
                    <h1>${lectureDTO.lec_title}</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- single product -->
<div class="single-product mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="single-product-img">
                    <img src="/resources/uploads/lecture/${lectureDTO.lec_img}" alt="">
                </div>
            </div>
            <div class="col-md-7">
                <div class="single-product-content mb-100">
                    <h3>${lectureDTO.lec_title}<br></h3>
                    <p class="single-product-pricing"><span>${lectureDTO.member_name}</span> $${lectureDTO.lec_price}</p>

                    <div class="single-product-form">

                        <input type="hidden" id="lecIdx" value="${lectureDTO.lec_idx}">
                        <span class="cart" onclick="addcart(${lectureDTO.lec_idx})">
                                <i class="fas fa-shopping-cart" id="cart${lectureDTO.lec_idx}" <c:if test="${fn:contains(cartlist, lectureDTO.lec_idx)}"> style="color: blue" </c:if>> </i>장바구니
                            </span>
                        <span class="zzim" onclick="addzzim(${lectureDTO.lec_idx})">
                                <i class="fas fa-heart" id="zzim${lectureDTO.lec_idx}" <c:if test="${fn:contains(zzimlist, lectureDTO.lec_idx)}"> style="color:red" </c:if>></i>찜하기
                            </span>
                        <a href="javascript:addbuy();" class="cart-btn"> 수강신청</a>

                        <p><strong>Categories: </strong>${lectureDTO.lec_subject}</p>

                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.member_idx eq lectureDTO.member_idx}">
            <div class="col-md-7 mb-80">
                <div class="row">
                <button type="button" onclick="location.href='/lecture/modify?lec_idx=${lectureDTO.lec_idx}'">수정하기</button>

                <c:if test="${lectureDTO.lec_status eq 'Y'}">
                    <form action="/lecture/delete" id="frmDelete" method="post">
                        <input type="hidden" name="lec_idx" value="${lectureDTO.lec_idx}">
                        <button type="button" onclick="deleteOK()">삭제하기</button>
                    </form>
                </c:if>
                </div>
            </div>
            </c:if>
            <div class="col-lg-12">
                <nav>
                    <div class="nav nav-tabs mb-3">
                        <button class="nav-link active border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box1" data-bs-toggle="tab" data-bs-target="#nav-about"
                                aria-controls="nav-about" aria-selected="true">강의 설명</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box2" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">강의 목차</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box3" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">공지사항</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box4" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">QnA</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box6" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">자료실</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box5" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">강의 리뷰</button>

                    </div>
                </nav>
                <div class="tab-content mb-5">
                    <div class="box1" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>강의설명</h4>
                        <br>
                        <p>${lectureDTO.lec_content}</p>
                    </div>
                    <div class="box2" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>강의목차</h4>
                        <br>

                                <c:choose>
                                    <c:when test="${not empty ChapterList}">
                                        <ul>
                                        <c:forEach items="${ChapterList}" var="chapDTO">
                                            <c:choose>
                                                <c:when test="${orderCnt >= 1 or sessionScope.member_idx eq lectureDTO.member_idx}">
                                                    <span><strong>목차를 클릭하여 강의를 수강하세요!</strong></span>
                                                    <li><a class="btn" onclick="javascript:Dalack_lab('/resources/uploads/lecture/${chapDTO.chap_video}')"> ${chapDTO.chap_title} (${chapDTO.chap_time})</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li> ${chapDTO.chap_title} (${chapDTO.chap_time})</li>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        목차가 없습니다.
                                    </c:otherwise>
                                </c:choose>

                    

                    </div>
                    <div class="box3" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>공지사항</h4>
                        <br>
                        <c:choose>
                            <c:when test="${not empty noticeList}">
                                <table class="table">
                                    <colgroup class="w-100">
                                        <col class="w-5">
                                        <col class="w-70">
                                        <col class="w-10">
                                        <col class="w-15">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>no</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${noticeList}" varStatus="i" begin="0" end="1">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td>
                                                <c:set var="ntitle" value="${list.notice_title}"/>
                                                <c:choose>
                                                    <c:when test="${fn:length(ntitle) > 10}">
                                                        <a href="/lecture/notice/view?notice_idx=${list.notice_idx}"><strong>${fn:substring(ntitle, 0, 10)}...</strong></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/lecture/notice/view?notice_idx=${list.notice_idx}"><strong>${list.notice_title}</strong></a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${list.member_name}</td>
                                            <td>${list.notice_reg_date}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <a href="/lecture/notice/list?lec_idx=${lectureDTO.lec_idx}">더보기</a>
                            </c:when>
                            <c:otherwise>
                                공지사항이 없습니다.
                            </c:otherwise>
                        </c:choose>


                    </div>
                    <div class="box4" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>QnA</h4>
                        <br>
                        <c:choose>
                            <c:when test="${not empty qnaList}">
                                <table class="table">
                                    <colgroup class="w-100">
                                        <col class="w-5">
                                        <col class="w-70">
                                        <col class="w-10">
                                        <col class="w-15">
                                    </colgroup>

                                    <thead>
                                    <tr>
                                        <th>no</th>
                                        <th>답변여부</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${qnaList}" varStatus="i" begin="0" end="1">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td><c:if test="${list.qna_answer_yn eq 'Y'}">답변완료</c:if>
                                                <c:if test="${list.qna_answer_yn eq 'N'}">답변대기</c:if></td>
                                            <td>
                                                <c:set var="title" value="${list.qna_title}"/>
                                                <c:choose>
                                                    <c:when test="${fn:length(title) > 10}">
                                                        <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${fn:substring(title, 0, 10)}...</strong></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${list.qna_title}</strong></a>
                                                    </c:otherwise>
                                                </c:choose></td>
                                            <td>${list.qna_member_name}</td>
                                            <td>${fn:substring(list.qna_reg_date, 0, 10)} / ${fn:substring(list.qna_reg_date, 11, 20)}</td>
                                        </tr>
                                        <c:if test="${list.qna_answer_yn eq 'Y'}">
                                            <tr>
                                                <td></td>
                                                <td class="text-nowrap"><span class="badge bg-label-info me-1">답변</span>
                                                </td>
                                                <td class="text-nowrap">
                                                    <c:set var="answer" value="${list.qna_answer}"/>
                                                    <c:choose>
                                                        <c:when test="${fn:length(answer) > 10}">
                                                            <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${fn:substring(answer, 0, 10)}...</strong></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="/lecture/qna/view?qna_idx=${list.qna_idx}"><strong>${list.qna_answer}</strong></a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td class="text-nowrap"><strong>${list.qna_answer_name}</strong></td>
                                                <td>
                                                    <strong>${fn:substring(list.qna_answer_reg_date, 0, 10)} / ${fn:substring(list.qna_answer_reg_date, 11, 20)}</strong>
                                                </td>
                                                <td></td>

                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <a href="/lecture/qna/list?lec_idx=${lectureDTO.lec_idx}">더보기</a>
                            </c:when>
                            <c:otherwise>
                                QnA 게시글이 없습니다.
                            </c:otherwise>
                        </c:choose>

                    </div>

                    <div class="box5" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>자료실</h4>
                        <br>
                        <c:choose>
                            <c:when test="${not empty dataList}">
                                <table class="table">
                                    <colgroup class="w-100">
                                        <col class="w-5">
                                        <col class="w-70">
                                        <col class="w-10">
                                        <col class="w-15">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>no</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${dataList}" varStatus="i" begin="0" end="1">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td>
                                                <c:set var="dtitle" value="${list.data_title}"/>
                                                <c:choose>
                                                    <c:when test="${fn:length(dtitle) > 10}">
                                                        <a href="/lecture/data/view?data_idx=${list.data_idx}"><strong>${fn:substring(dtitle, 0, 10)}...</strong> <c:if test="${list.data_org_file_name != null and list.data_org_file_name != '' }" ><i class="fa-solid fa-paperclip"></i></c:if></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/lecture/data/view?data_idx=${list.data_idx}"><strong>${list.data_title}</strong> <c:if test="${list.data_org_file_name != null and list.data_org_file_name != '' }" ><i class="fa-solid fa-paperclip"></i></c:if></a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${list.member_name}</td>
                                            <td>${list.data_reg_date}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <a href="/lecture/data/list?lec_idx=${lectureDTO.lec_idx}">더보기</a>
                            </c:when>
                            <c:otherwise>
                                자료실의 게시글이 없습니다.
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="box6" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>강의 리뷰</h4>
                        <br>
                        <c:if test="${not empty sessionScope.member_idx and orderCnt >= 1 and reviewCnt < 1}">
                            <%--                            구매조건 추가--%>
                            <form action="/lecture/review/regist" method="post">
                                <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
                                <h4 class="mb-5 fw-bold">리뷰 작성하기</h4>
                                <div class="row g-4">
                                    <input type="hidden" name="lec_idx" value="${lectureDTO.lec_idx}">
                                    <input type="hidden" name="member_idx" value="${sessionScope.member_idx}">
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded">
                                            <input type="text" name="review_writer" id="review_writer" readonly  class="form-control border-0" value="${sessionScope.name}">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                            <textarea name="comment" id="comment" class="form-control border-0" cols="30" rows="8" placeholder="리뷰 내용을 입력하세요 *" spellcheck="false"></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" name="reviewBtn" id="reviewBtn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_regist_btn">작성 완료</button>
                                </div>
                            </form>
                        </c:if>
                        <c:choose>
                            <c:when test="${not empty reviewList}">
                                <c:forEach var="list" items="${reviewList}" varStatus="rev">
                                    <div id="review${rev.index}" >
                                        <div class="col-lg-12">
                                            <div class="border-bottom rounded">
                                                 작성자 : ${list.review_writer}
                                                <c:if test="${sessionScope.member_idx eq list.member_idx}">
                                                    <button type="button" onclick="askDelete(${rev.index}, '${list.review_idx}')">리뷰 삭제하기</button>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="border-bottom rounded my-4">
                                                리뷰 : ${list.comment}
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <br>
                                등록된 리뷰가 없습니다. 첫 리뷰 작성자가 되어보세요!
                            </c:otherwise>
                        </c:choose>

                    </div>


                </div>
            </div>


        </div>
    </div>
</div>
<!-- end single product -->


<!--================ 본문 end =================-->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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

<script src="https://kit.fontawesome.com/be97bd8e1b.js" crossorigin="anonymous"></script>



<script>
    function deleteOK() {
        const frmDelete = document.querySelector("#frmDelete");
        let deleteYN = confirm("정말 삭제하시겠습니까? \n 삭제하시면 리스트에 나타나지 않습니다.");
        if (deleteYN) {
            frmDelete.submit();
        }
    }

    const btnArr = document.getElementsByClassName('letsmove');

    for(let i = 0; i < btnArr.length; i++){

        btnArr[i].addEventListener('click',function(e){
            e.preventDefault();
            document.querySelector('.box' + (i + 1)).scrollIntoView(true);
        });

    }

    function addcart(lecIdx){
        if(lecIdx != 0) {
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/mypage/addcart",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx: lecIdx,
                    member_id: "${member_id}"
                },            // Json 형식의 데이터이다.
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(result == 0){
                        if(confirm("장바구니에 상품이 존재합니다.\n장바구니로 이동하시겠습니까?")){
                            window.location.href="/mypage/cart"
                        }
                    }else {
                        if (confirm("장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?")) {
                            window.location.href = "/mypage/cart"
                        }
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }
    }
    function addzzim(lecIdx){
        if(lecIdx != 0) {
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/mypage/addzzim",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx: lecIdx
                },            // Json 형식의 데이터이다.
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    let color =  document.getElementById("zzim"+lecIdx).style.color;
                    if(color == "red"){
                        document.getElementById("zzim"+lecIdx).style.color="";
                    }else{
                        document.getElementById("zzim"+lecIdx).style.color="red";
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }
    }

    function Dalack_lab(data) {
        let winW=1000;
        let winH=650;
        let vodW=1000;
        let vodH=600;
        let size="width="+winW+",height="+winH;
        let popup=window.open("","name",size);
        popup.document.open(); popup.document.write("<html><head>");
        popup.document.write("<title>test video</title>")
        popup.document.write("</head><body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>");
        popup.document.write("<center><embed src='"+data+"' width='"+vodW+"' height='"+vodH+"' name=name></embed>");
        popup.document.write("</center>");
        popup.document.write("</body></html>"); popup.document.close();
    }


    function askDelete(index, review_idx) {
        let deleteYN = confirm("리뷰를 삭제 하시겠습니까?");
        if (deleteYN) {
            deleteReview(index, review_idx);
        }
    }

    function deleteReview(index, review_idx){
        event.preventDefault();
        event.stopPropagation();
        var divInner = $('#review' + index);
        $.ajax({
            url:'/lecture/review/delete', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{review_idx},
            dataType : 'text',
            success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다
                divInner.remove();
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
