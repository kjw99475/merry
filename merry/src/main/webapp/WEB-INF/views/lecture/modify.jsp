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
                    <h1>강의 수정</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="contact-form spad">
    <div class="container">
        <div class="row">
            <form action="/lecture/modify" method="post" enctype="multipart/form-data">
                <input type="hidden" value="${lectureDTO.member_name}" name="member_name">
                <input type="hidden" value="${lectureDTO.member_idx}" name="member_idx">
                <input type="hidden" value="${lectureDTO.lec_idx}" name="lec_idx">
                    <input type="hidden" value="${lectureDTO.lec_subject}" name="lec_subject">

                <div class="col-lg-12 col-md-12">
                    <label>제목 : </label>
                    <input type="text" name="lec_title" value="${lectureDTO.lec_title}"><br>
                </div>
                <label>내용 </label>
                <textarea name="lec_content" id="content">${lectureDTO.lec_content}</textarea><br>
                <img src="/resources/uploads/lecture/${lectureDTO.lec_img}" class="d-block rounded" height="100"
                     width="100" id="preview"/>
                <label>썸네일 : </label>
                <input type="file" accept="image/png, image/jpeg" name="lecImg" onchange="readURL(this)"><br>
                <input type="hidden" name="upload" value="${lectureDTO.lec_org_img}">
                <input type="hidden" name="upload2" value="${lectureDTO.lec_img}">
                <label>가격 : </label>
                <input type="number" name="lec_price" value="${lectureDTO.lec_price}"><br>


                <div id="chap">
                    <span style="font-size: large">목차</span><hr>
                    <c:if test="${not empty ChapterList}">
                        <c:forEach items="${ChapterList}" var="chapterDTO" varStatus="i">
                            <div>
                                <input type="hidden" value= id="chap_idx${i.index}">
                                <label>목차 제목 : </label>
                                <input type="text" name="chapters[${i.index}].chap_title" value="${chapterDTO.chap_title}" > <c:if test="${i.index != '0'}"> <button type="button" id="btnDeleteChapter" onclick="deleteOK(${chapterDTO.chap_idx});">X</button> </c:if>  <br>
                                <span>현재 동영상 : ${chapterDTO.chap_org_video}</span><br>
                                <label>수정할 동영상 : </label>
                                <input type="file" accept="video/*" name="chapVideos"><br>
                                <label>동영상 길이 (대략)</label>
                                <select name="chapters[${i.index}].chap_time">
                                    <option value="10분 이내" <c:if test="${chapterDTO.chap_time eq '10분 이내'}">selected</c:if>>10분 이내</option>
                                    <option value="20분 이내" <c:if test="${chapterDTO.chap_time eq '20분 이내'}">selected</c:if>>20분 이내</option>
                                    <option value="30분 이내" <c:if test="${chapterDTO.chap_time eq '30분 이내'}">selected</c:if>>30분 이내</option>
                                    <option value="40분 이내" <c:if test="${chapterDTO.chap_time eq '40분 이내'}">selected</c:if>>40분 이내</option>
                                    <option value="50분 이내" <c:if test="${chapterDTO.chap_time eq '50분 이내'}">selected</c:if>>50분 이내</option>
                                    <option value="60분 이내" <c:if test="${chapterDTO.chap_time eq '60분 이내'}">selected</c:if>>60분 이내</option>
                                    <option value="60분 이내" <c:if test="${chapterDTO.chap_time eq '60분 이상'}">selected</c:if>>60분 이상</option>
                                </select>
                                <hr>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div class="row justify-content-between mb-5">
                    <div>
                        <button type="button" onclick="createChap()" class="btn btn-success">목차 추가</button>
                        <button type="button" onclick="deleteChap()" class="btn btn-danger">목차 삭제</button>
                    </div>
                    <div>
                        <button type="button" onclick="location.href='/lecture/list'" class="btn btn-outline-merry">목록으로</button>
                        <button type="submit" class="btn btn-merry">수정완료</button>
                    </div>
                </div>
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
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    //목차 추가

    let len = "${ChapterList.size()}";
    let chapterIndex = len;

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
        if (target <= len) {
            alert("목차는 1개 이상입니다. \n원래 있는 목차를 삭제하시려면 목차 제목 옆의 x 버튼을 눌러주세요.");
            return;
        }
        list[target - 1].remove();
        chapterIndex--;
    }

    function deleteOK(idx) {
        let con = confirm("목차를 삭제하시겠습니까?");
        if (con) {
            deleteC(idx);
        }
    }

    function deleteC(idx){
        event.preventDefault();
        event.stopPropagation();
        var idx = idx; //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/chapter/delete', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{chap_idx:idx},
            dataType : 'text',
            success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다
                console.log(result);
                window.location.reload();
            },
            error : function(xhr, status, error) {
                console.log("xhr! : " + xhr);
                console.log("status! : " + status);
                console.log("error! : " + error);
            }

        })

    }

    //목차 동영상
    <c:if test="${not empty errorVideo}">
    alert("${errorVideo}");
    </c:if>

</script>
</body>
</html>
