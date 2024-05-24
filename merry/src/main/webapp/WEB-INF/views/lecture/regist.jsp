<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        tinymce.init({
            selector: 'textarea#content',
            plugins: [
                'advlist', 'autolink',
                'lists', 'link', 'image', 'charmap', 'preview', 'anchor', 'searchreplace', 'visualblocks'
                , 'fullscreen', 'insertdatetime', 'media', 'table', 'help', 'wordcount'
            ],
            toolbar: 'undo redo | formatpainter casechange blocks | bold italic backcolor | ' +
                'alignleft aligncenter alignright alignjustify | ' +
                'bullist numlist checklist outdent indent | removeformat | a11ycheck code table help',
            paste_data_images: true, // 이미지 붙여넣기 설정 활성화
            file_picker_types: 'image', // TinyMCE에서 이미지를 선택할 때, 이미지 파일만 선택 (옵션 : media, file 등)
            images_upload_handler(blobInfo, success) { // 이미지를 업로드하는 핸들러 함수            blobInfo : TinyMCE에서 이미지 업로드 시 사용되는 정보를 담고 있는 객체
                const file = new File([blobInfo.blob()], blobInfo.filename());
                const fileName = blobInfo.filename();
                if (fileName.includes("blobid")) {
                    success(URL.createObjectURL(file));
                } else {
                    imageFiles.push(file);
                    success(URL.createObjectURL(file)); // Blob 객체의 임시 URL을 생성해 이미지 미리보기 적용
                }
            }
        });
    </script>

</head>
<body class="pt-150">

<!--================ 헤더 start =================-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--================ 헤더 end =================-->

<div class="contact-form spad">
    <div class="container">
        <div class="row">
            <form action="/lecture/regist" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="${sessionScope.name}" name="member_name">
                    <input type="hidden" value="${sessionScope.member_idx}" name="member_idx">

                <div class="col-lg-12 col-md-12">
                    <label>제목 : </label>
                    <input type="text" name="lec_title" id="title" value="[${subject}]"><br>
                </div>
                <label>카테고리</label>

                <label>내용 </label>
                <textarea name="lec_content" id="content"></textarea><br>
                <div id="orgImg"></div>
                <label>썸네일 : </label>
                <input type="file" accept="image/png, image/jpeg" name="lecImg" onchange="readURL(this)"><br>
                <label>가격 : </label>
                <input type="text" name="lec_price"><br>

                목차<br>
                <div id="chap">
                    <div>
                        <label>목차 제목 : </label>
                        <input type="text" name="chapters[0].chap_title"> <br>
                        <label>동영상 : </label>
                        <input type="file" accept="video/*" name="chapVideos"><br>
                        <label>동영상 길이 (대략)</label>
                        <select name="chapters[0].chap_time">
                            <option value="10분 이내">10분 이내</option>
                            <option value="20분 이내">20분 이내</option>
                            <option value="30분 이내">30분 이내</option>
                            <option value="40분 이내">40분 이내</option>
                            <option value="50분 이내">50분 이내</option>
                            <option value="60분 이내">60분 이내</option>
                            <option value="60분 이내">60분 이상</option>
                        </select>
                    </div>
                </div>

                <button type="button" onclick="createChap()">목차 추가</button>
                <button type="button" onclick="deleteChap()">목차 삭제</button>

                <button type="submit">등록하기</button>

            </form>
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
    //사진 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                if (document.getElementById("preview") != null) {
                    document.getElementById("preview").remove();
                }
                document.getElementById("orgImg");
                let img = document.createElement("img");
                img.height = 100;
                img.width = 200;
                img.alt = "미리보기";
                img.id = "preview";
                orgImg.append(img);

                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    //목차 추가
    let chapterIndex = 1;

    function createChap() {
        let chapMake = document.createElement("div");
        chapMake.innerHTML = " <label>목차 제목 : </label>" + "<input type='text' name='chapters[" + chapterIndex + "].chap_title'> <br>" + " <label>동영상 : </label>"
            + "<input type='file' accept='video/*' name='chapVideos'><br>"
            + "<label>동영상 길이 (대략)</label>"
            + "<select name='chapters[" + chapterIndex + "].chap_time'>"
            + "<option value='10분 이내'>10분 이내</option>"
            +  "<option value='20분 이내'>20분 이내</option>"
            +  "<option value='30분 이내'>30분 이내</option>"
            +  "<option value='40분 이내'>40분 이내</option>"
            +  "<option value='50분 이내'>50분 이내</option>"
            +  "<option value='60분 이내'>60분 이내</option>"
            +  "<option value='60분 이상'>60분 이상</option>"
            + "</select>";

        let chap = document.getElementById("chap");
        chap.append(chapMake);
        chapterIndex++;
    }

    //목차 삭제
    function deleteChap() {
        event.preventDefault();
        let list = document.querySelectorAll("#chap div");
        let target = list.length;
        if (target < 2) {
            alert("no");
            return;
        }
        list[target - 1].remove();
        chapterIndex--;
    }

    <%--//유효성--%>
    <%--const errors = ${errors};--%>
    <%--console.log("errors : {}", errors);--%>

    <%--let errMsg = "";--%>
    <%--if (errors) {--%>
    <%--    for (let i =0; i<errors.length; i++) {--%>
    <%--        errMsg += `${errors[i].defaultMessage}\n`;--%>
    <%--    }--%>
    <%--    alert(errMsg);--%>
    <%--}--%>

    <%--//동영상 유효성--%>
    <%--const errorVideo = ${errorVideo};--%>
    <%--console.log(errorVideo);--%>
    <%--if (errorVideo) {--%>
    <%--    alert(errorVideo);--%>
    <%--}--%>

</script>
</body>
</html>
