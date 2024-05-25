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
<body class="pt-100">
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--================ 헤더 end =================-->

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

<%--                        <c:if test="">--%>
                            <a href="javascript:nozzim();" class="cart-btn"><i class="fa-solid fa-heart"></i> 찜</a>
<%--                        </c:if>--%>
<%--                        <c:if test="">--%>
                            <a href="javascript:addzzim();" class="cart-btn"><i class="fa-regular fa-heart"></i> 찜</a>
<%--                        </c:if>--%>
                        <a href="javascript:addcart();" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        <a href="javascript:addbuy();" class="cart-btn"> 수강신청</a>

                        <p><strong>Categories: </strong>${lectureDTO.lec_subject}</p>

                    </div>
                </div>
            </div>
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
                                id="box5" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">강의 리뷰</button>
                        <button class="nav-link border-white border-bottom-0 letsmove" type="button" role="tab"
                                id="box6" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                aria-controls="nav-mission" aria-selected="false">자료실</button>
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
                            <ul>
                                <c:forEach items="${ChapterList}" var="chapDTO">
                                    <li><a onclick="javascript:Dalack_lab('/resources/uploads/lecture/${chapDTO.chap_video}')"> ${chapDTO.chap_title} (${chapDTO.chap_time})</a></li>
                                </c:forEach>
                            </ul>

                    </div>
                    <div class="box3" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>공지사항</h4>
                        <br>

                        <p>${pro_content}</p>
                    </div>
                    <div class="box4" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>QnA</h4>
                        <br>

                        <p>${pro_content}</p>
                    </div>
                    <div class="box5" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>강의 리뷰</h4>
                        <br>


                        <p>${pro_content}</p>
                    </div>
                    <div class="box6" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                        <br>
                        <h4>자료실</h4>
                        <br>
                        <p>${pro_content}</p>
                    </div>

                    <div class="reviewDiv" id="nav-mission" aria-labelledby="nav-mission-tab">
                        <h4>리뷰</h4>
                        <form name="frmDelete" id="frmDelete" method="post" action="/product/reviewDelete">

                            <c:choose>
                                <c:when test="${reviewVO != null}">
                                    <c:forEach var="review" items="${reviewVO}">
                                        <div class="d-flex">
                                            <input type="hidden" name="pro_idx" id="pro_idx" value="${review.pro_idx}"/>
                                            <input type="hidden" name="review_idx" id="review_idx" value="${review.review_idx}"/>

                                            <img src="/resources/resources/uploads/img/member/${review.member_img}" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                            <div class="d-flex">
                                                <div class="">
                                                    <p class="mb-2 text-nowrap" style="font-size: 14px;">${fn:substring(review.review_reg_date, 0, 10)} &nbsp; ${fn:substring(review.review_reg_date, 11, 20)}</p>
                                                    <div class="d-flex">
                                                        <div class="d-flex mb-3">
                                                            <i class="fa fa-star <c:if test='${review.review_star > 0}'>text-secondary</c:if>"></i>
                                                            <i class="fa fa-star <c:if test='${review.review_star > 1}'>text-secondary</c:if>"></i>
                                                            <i class="fa fa-star <c:if test='${review.review_star > 2}'>text-secondary</c:if>"></i>
                                                            <i class="fa fa-star <c:if test='${review.review_star > 3}'>text-secondary</c:if>"></i>
                                                            <i class="fa fa-star <c:if test='${review.review_star > 4}'>text-secondary</c:if>"></i>
                                                        </div>
                                                    </div>
                                                    <h5>${review.member_id}</h5>
                                                    <h5>${review.review_title}</h5>
                                                    <p>${review.review_content}</p>
                                                    <div class="empty"></div>
                                                </div>
                                                <c:if test="${sessionScope.member_id eq review.member_id || sessionScope.member_id eq 'admin'}">
                                                    <button type="submit" onclick="goDelete()" id="review_delete_btn" name="review_delete_btn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_del_btn">삭제</button>
                                                </c:if>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <p>리뷰가 없습니다.</p>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.loginInfo != null}" >
                <form name="frmReview" id="frmReview" action="/product/view" method="post">
                    <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
                    <h4 class="mb-5 fw-bold">리뷰 작성하기</h4>
                    <div class="row g-4">
                        <input type="hidden" name="pro_idx" value="${product.pro_idx}">
                        <div class="col-lg-12">
                            <div class="border-bottom rounded">
                                <input type="text" name="review_title" id="review_title"  class="form-control border-0" placeholder="제목을 입력하세요 *">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="border-bottom rounded my-4">
                                <textarea name="review_content" id="review_content" class="form-control border-0" cols="30" rows="8" placeholder="리뷰 내용을 입력하세요 *" spellcheck="false"></textarea>
                            </div>
                        </div>

                        <br>

                        <div class="rating">

                            <span class="rating__result star_span"></span>
                            <i class="fa fa-star text-secondary first_star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                        </div>
                        <button type="submit" name="reviewBtn" id="reviewBtn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_regist_btn">작성 완료</button>
                        <input type="hidden" name="review_star" id="review_star" class="rating__input" readonly/>
                    </div>
                </form>
            </c:if>

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

    function addcart(){
        let lecIdx = document.getElementById("lecIdx").value ;
        if(${sessionScope.member_id != null}){
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/lecture/addcart",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx:lecIdx
                },
                dataType : 'text',
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(confirm("장바구니에 상품이 담겼습니다 장바구니로 이동하시겠습니까?")){
                        window.location.href="/member/cart";
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }else{
            alert("로그인 후 이용해주세요");
        }
    }

    function addzzim(){
        let lecIdx = document.getElementById("lecIdx").value ;
        if(${sessionScope.member_id != null}){
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/lecture/zzim",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx:lecIdx
                },
                dataType : 'text',
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(confirm("찜 목록에 추가되었습니다. 찜 목록으로 이동하시겠습니까?")){
                        window.location.href="/member/zzim";
                    }
                    window.location.reload();
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }else{
            alert("로그인 후 이용해주세요");
        }
    }

    function nozzim(){
        let lecIdx = document.getElementById("lecIdx").value ;
        if(${sessionScope.member_id != null}){
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/lecture/zzimDelete",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx:lecIdx
                },
                dataType : 'text',
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    alert("찜 목록에서 해제되었습니다.")
                    window.location.reload();
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }else{
            alert("로그인 후 이용해주세요");
        }
    }

    function addbuy(){
        let lecIdx = document.getElementById("lecIdx").value ;
        if(${sessionScope.member_id != null}){
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/lecture/buy",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    lec_idx:lecIdx
                },
                dataType : 'text',
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(confirm("장바구니에 상품이 담겼습니다 장바구니로 이동하시겠습니까?")){
                        window.location.href="/member/buy";
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }else{
            alert("로그인 후 이용해주세요");
        }
    }

    function Dalack_lab(data) {
        let winW=500;
        let winH=650;
        let vodW=400;
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


</script>

</body>
</html>
