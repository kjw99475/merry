<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p><a href="/lecture/view?lec_idx=${dataDTO.data_lec_idx}"> 강의</a> </p>
                    <h1>강의 자료실</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 선생님 섹션 -->
<div class="container pt-100 mb-5">

    <form action="/lecture/data/modify" method="post" enctype="multipart/form-data">
        <input type="hidden" id="idx" name="data_idx" value="${dataDTO.data_idx}">
        <div class="mb-3"></div>

        <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">자료실 제목</label>
            <input type="text" class="form-control" id="data_title" name="data_title" value="${dataDTO.data_title}"/>
            <div id="div_err_qna_title" style="display: none"></div>
        </div>
        <div class="mb-3">
            <label class="form-label" for="basic-default-company">자료실 내용</label>
            <textarea class="form-control" rows="20" cols="10" name="data_content" id="data_content" >${dataDTO.data_content}</textarea>
            <div id="div_err_qna_content" style="display: none"></div>
        </div>

        <c:if test="${dataDTO.data_org_file_name != null and dataDTO.data_org_file_name != '' }">
            <div class="mt-4">
                <span id="fileView">
                     <label>첨부파일 : </label>${dataDTO.data_org_file_name}<button class="btn text-danger" type="button" id="btnDelete" onclick="askDelete()">X</button>
                </span>
                <input type="hidden" name="upload" id="upload" value="${dataDTO.data_org_file_name}">
                <input type="hidden" name="upload2" id="upload2" value="${dataDTO.data_save_file_name}">
            </div>
        </c:if>
        <div class="mb-3">
            <label>파일 재업로드</label>
            <input type="file" name="file" id="file" class="form-control" multiple>
        </div>

        <button type="submit" class="btn btn-primary">등록하기</button>
        <button type="reset" class="btn btn-secondary"  onclick="location.href='/lecture/data/view?data_idx=${dataDTO.data_idx}'">취소하고 돌아가기</button>
    </form>

</div>
<!-- //커뮤니티 섹션 -->

<!--================ 본문 end =================-->

<!--================ 푸터 Start =================-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!--================ 푸터 End =================-->

<!-- jquery -->
<script src="/resources/assets/js/jquery-3.7.1.min.js"></script>
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


    function askDelete() {
        let deleteYN = confirm("파일을 정말 삭제하시겠습니까? 삭제 후 취소를 원할 시 재업로드 하셔야 합니다.");
        if (deleteYN) {
            deleteShare();
        }
    }

    function deleteShare(){
        event.preventDefault();
        event.stopPropagation();
        var idx = $('#idx').val();
        var spanInner = $('#fileView');
        $.ajax({
            url:'/lecture/data/deleteFile',
            type:'post',
            data:{idx:idx},
            dataType : 'text',
            success:function(result){
                spanInner.remove();
                console.log(result);
            },
            error : function(xhr, status, error) {
                console.log("xhr! : " + xhr);
                console.log("status! : " + status);
                console.log("error! : " + error);
            }
        })
    }
</script>

</body>
</html>