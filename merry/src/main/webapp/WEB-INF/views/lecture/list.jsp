<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<body>
<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--================ 헤더 end =================-->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>강의</p>
                    <h1>강의 목록</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container pt-100 mb-5">
    <div class="col">
        <form role="search" id="frmSearch">
            <div class="row mx-5 mb-100 justify-content-center">
                <select name="search_type" id="search_type" class="form-control col-1" >
                    <option value="">선택</option>
                    <option value="t" <c:if test="${responseDTO['search_type_st'] != 'null' && responseDTO['search_type_st'].contains('t')}">selected</c:if>>제목</option>
                    <option value="u" <c:if test="${responseDTO['search_type_st'] != 'null' && responseDTO['search_type_st'].contains('u')}">selected</c:if>>선생님</option>
                </select>

                <div class="col-8">
                    <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                </div>
                <div>
                    <button type="button" class="btn btn-merry" onclick="searchType()" >검색</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/lecture/list'">초기화</button>
                </div>
            </div>
            <div style="display: none">
                <div class="product-filters">
                    <c:if test="${not empty responseDTO.subject_code}">
                    <input type="hidden" value="${responseDTO.subject_code}" name="subject_code">
                    </c:if>
                    
                </div>
            </div>
        </form>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form>
                <div style="display: none" class="row mx-5 mb-100 justify-content-center">
                    <select name="search_type" class="form-control col-1" >
                        <option value="">선택</option>
                        <option value="t" <c:if test="${responseDTO['search_type_st'] != 'null' && responseDTO['search_type_st'].contains('t')}">selected</c:if>>제목</option>
                        <option value="u" <c:if test="${responseDTO['search_type_st'] != 'null' && responseDTO['search_type_st'].contains('u')}">selected</c:if>>선생님</option>
                    </select>

                    <div class="col-8">
                        <input type="text" class="form-control" placeholder="Search" name="search_word" style="width: 100%" value="${responseDTO.search_word}">
                    </div>
                    <div>
                        <button type="button" class="btn btn-merry" onclick="searchType()" >검색</button>
                    </div>
                </div>
            <div class="product-filters">
                <ul>
                    <li class="<c:if test='${empty responseDTO.subject_code}'>active</c:if> p-md-0" data-filter="*"><button onclick="location.href='/lecture/list'" style="background-color: #00ff0000; border: none; padding:10px 30px;">All</button></li>
                    <li class="<c:if test='${ responseDTO.subject_code eq "국어"}'>active</c:if> p-md-0" data-filter=".국어"><button   value="국어" name="subject_code" style="background-color: #00ff0000; border: none; padding:10px 30px;">국어</button></li>
                    <li class="<c:if test='${ responseDTO.subject_code  eq "영어"}'>active</c:if> p-md-0" data-filter=".영어"><button value="영어" name="subject_code" style="background-color: #00ff0000; border: none; padding:10px 30px;">영어</button></li>
                    <li class="<c:if test='${ responseDTO.subject_code  eq "수학"}'>active</c:if> p-md-0" data-filter=".수학"><button value="수학" name="subject_code" style="background-color: #00ff0000; border: none; padding:10px 30px;">수학</button></li>
                    <li class="<c:if test='${ responseDTO.subject_code  eq "사회"}'>active</c:if> p-md-0" data-filter=".사회"><button value="사회" name="subject_code" style="background-color: #00ff0000; border: none; padding:10px 30px;">사회</button></li>
                    <li class="<c:if test='${ responseDTO.subject_code eq "과학"}'>active</c:if> p-md-0" data-filter=".과학"><button value="과학" name="subject_code" style="background-color: #00ff0000; border: none; padding:10px 30px;">과학</button></li>
                </ul>
            </div>
            </form>
        </div>
    </div>


    <div class="row mb-300">
        <div class="col-md-3">
            <c:if test="${sessionScope.member_type == 'T' or sessionScope.member_type=='A'}">
                <button onclick="location.href='/lecture/regist'">
                    강의 등록하기
                </button>
            </c:if>
        </div>
    </div>


    <div class="row">
        <c:forEach var="lectureDTO" items="${responseDTO.dtoList}">
            <c:set var="ltitle" value="${lectureDTO.lec_title}"/>
            <div class="col-lg-3 col-md-6 ${lectureDTO.lec_subject}">
                <div class="single-latest-news">
                    <a href="/lecture/view?lec_idx=${lectureDTO.lec_idx}"><div class="latest-news-bg news-bg-1" style="background: url('/resources/uploads/lecture/${lectureDTO.lec_img}'); background-size: 100% 100%">
                    </div></a>
                    <div class="news-text-box">

                        <h3><a href="/lecture/view?lec_idx=${lectureDTO.lec_idx}">
                            <c:choose>
                                <c:when test="${lectureDTO.lec_status eq 'N'}">
                                    <c:choose>
                                        <c:when test="${fn:length(ltitle) > 20}">
                                            <span style="text-decoration:line-through; color:red">${fn:substring(ltitle, 0, 20)}... </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="text-decoration:line-through; color:red">${ltitle} </span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${fn:length(ltitle) > 20}">
                                            <span>${fn:substring(ltitle, 0, 20)}...</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>${ltitle}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="">
                            </c:if>
                        </a></h3>
                        <p class="blog-meta border-bottom pb-1">
                            <span class="author"><i class="fas fa-book-open"></i> ${lectureDTO.lec_subject}</span>
                            <span class="cart" onclick="addcart(${lectureDTO.lec_idx})">
                                <i class="fas fa-shopping-cart" id="cart${lectureDTO.lec_idx}" <c:if test="${fn:contains(cartlist, lectureDTO.lec_idx)}"> style="color: blue" </c:if>> </i>장바구니
                            </span>
                            <span class="zzim" onclick="addzzim(${lectureDTO.lec_idx})">
                                <i class="fas fa-heart" id="zzim${lectureDTO.lec_idx}" <c:if test="${fn:contains(zzimlist, lectureDTO.lec_idx)}"> style="color:red" </c:if>></i>찜하기
                            </span>
                        </p>

                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
    <div class="row">
        <div class="col-lg-12 text-center">
            <div class="pagination-wrap">
                <ul>
                    <li class="page-item<c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
                        <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
                        <a class="page-link"
                           data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                           href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linked_params}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Prev</a>
                    </li>
                    <c:forEach begin="${responseDTO.page_block_start}"
                               end="${responseDTO.page_block_end}"
                               var="page_num">
                        <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if>">
                            <a class="page-link" data-num="${page_num}"
                               href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linked_params}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                        <a class="page-link"
                           data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                           href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linked_params}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>






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

<script>
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
                    }else if(result == 1){
                        if (confirm("장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?")) {
                            window.location.href = "/mypage/cart"
                        }
                    }else{
                        alert("결제한 이력이 있는 강의 입니다.");
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
                    console.log(result);
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

    function searchType() {
        let selectElement = document.getElementById("search_type"); // select 요소의 id로 변경
        let selectedOption = selectElement.options[selectElement.selectedIndex].value;

        if (selectedOption === "") {
            alert("검색 구분을 선택해 주세요");
        } else {
            document.getElementById("frmSearch").submit();
        }
    }
</script>

</body>
</html>
