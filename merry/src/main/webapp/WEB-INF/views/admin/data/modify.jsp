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

    <script src="https://cdn.tiny.cloud/1/wjuflumw0txwktnvnufwfo5lj04kqmup66rnaj1jf6pnwv5d/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea#content',
            plugins: [
                'advlist','autolink',
                'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks'
                ,'fullscreen','insertdatetime','media','table','help','wordcount'
            ],
            toolbar: 'undo redo | formatpainter casechange blocks | bold italic backcolor | ' +
                'alignleft aligncenter alignright alignjustify | ' +
                'bullist numlist checklist outdent indent | removeformat | a11ycheck code table help'
        });
    </script>
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
            <jsp:param name="menuGubun" value="bbs_data"/>
        </jsp:include>
        <!--================ 사이드바 end =================-->


        <div>
            <div class="container">

                <div class="row mt-5">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="form-title">
                            <h2></h2>

                        </div>
                        <div class="contact-form">
                            <form id="frm_" name="frm_" method="post" action="/admin/data/modify" enctype="multipart/form-data">
                                <input type="hidden" name="data_idx" value="${dataDTO.data_idx}" id="data_idx">

<%--                                <label for="data_title">제목</label>--%>
                                <input type="text" class="form-control" placeholder="제목을 입력해주세요" name="data_title" id="data_title" value="${dataDTO.data_title}">

                                <textarea class="mt-3" name="data_content" id="content" >${dataDTO.data_content}</textarea>

                                <c:if test="${dataDTO.data_org_file_name != null and dataDTO.data_org_file_name != '' }">
                                    <div class="mt-4">
                                        <span id="fileView">
                                            <label>첨부파일 : </label>${dataDTO.data_org_file_name}<button class="btn text-danger" type="button" id="btnDelete" onclick="askDelete()">X</button>
                                        </span>
                                        <input type="hidden" name="upload" id="upload" value="${dataDTO.data_org_file_name}">
                                        <input type="hidden" name="upload2" id="upload2" value="${dataDTO.data_save_file_name}">
                                    </div>
                                </c:if>
                                <script>
                                    function askDelete() {
                                        let deleteYN = confirm("파일을 정말 삭제하시겠습니까? 삭제 후 취소를 원할 시 재업로드 하셔야 합니다.");
                                        if (deleteYN) {
                                            deleteShare();
                                        }
                                    }

                                    function deleteShare(){
                                        event.preventDefault();
                                        event.stopPropagation();
                                        var data_idx = $('#data_idx').val();
                                        var spanInner = $('#fileView');

                                        $.ajax({
                                            url:'/admin/data/deleteFile',
                                            type:'post',
                                            data:{data_idx:data_idx},
                                            dataType : 'text',
                                            success:function(result){
                                                spanInner.remove();
                                                $('#upload').val('');
                                                $('#upload2').val('');
                                                console.log("upload : " + upload);
                                                console.log("upload2 : " + upload2);
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

                                <div class="col-lg-12 mt-4">
                                    <label for="content">파일 재업로드</label>
                                    <input type="file" name="file" id="file" class="form-control" multiple>
                                </div>


                                <div class="row justify-content-between mt-3">
                                    <button type="button" class="btn btn-outline-merry" onclick="location.href='/admin/data/list'">목록</button>
                                    <div>
                                        <button type="button" class="btn btn-outline-merry" onclick="location.href='/admin/data/view?data_idx=${dataDTO.data_idx}'">취소</button>
                                        <button type="submit" class="btn btn-merry">수정 완료</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>





            </div>
        </div>

    </div>





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

</body>
</html>