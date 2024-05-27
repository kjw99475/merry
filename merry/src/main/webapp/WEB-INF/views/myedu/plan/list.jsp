<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>학습 계획표</title>

    <link rel="shortcut icon" type="image/png" href="/resources/assets/img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/css/all.min.css">
    <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet" href="/resources/assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="/resources/assets/css/main.css">
    <link rel="stylesheet" href="/resources/assets/css/responsive.css">

    <script src="/resources/assets/js/jquery-1.11.3.min.js"></script>
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/jquery.countdown.js"></script>
    <script src="/resources/assets/js/jquery.isotope-3.0.6.min.js"></script>
    <script src="/resources/assets/js/waypoints.js"></script>
    <script src="/resources/assets/js/owl.carousel.min.js"></script>
    <script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/assets/js/jquery.meanmenu.min.js"></script>
    <script src="/resources/assets/js/sticker.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>

    <style>
        :root {
            --fc-button-text-color: #fff;
            --fc-button-bg-color: #dda745;
            --fc-button-border-color: #2C3E50;
            --fc-button-hover-bg-color: #a86f0b;
            --fc-button-hover-border-color: #1a252f;
            --fc-button-active-bg-color: #a86f0b;
            --fc-button-active-border-color: #151e27;

            --fc-event-border-color: #000000;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>학습계획표</p>
                    <h1>나의 학습 계획</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 달력 -->
<div id="calendar" class="pt-100 w-75 mx-auto my-3"></div>

<!-- 일정 등록 모달 -->
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">일정 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" class="form-control" id="writer" name="writer" value="${sessionScope.member_id}">

                    <label for="title" class="col-form-label">일정 내용</label>
                    <input type="text" class="form-control" id="title" name="title" maxlength="30">
                    <label for="start" class="col-form-label">시작 날짜</label>
                    <input type="date" class="form-control" id="start" name="start">
                    <label for="end" class="col-form-label">종료 날짜</label>
                    <input type="date" class="form-control" id="end" name="end">
                    <label for="textColor" class="col-form-label">글자 색상</label>
                    <input type="color" class="form-control" id="textColor" name="textColor" value="#ffffff">
                    <label for="backgroundColor" class="col-form-label">배경 색상</label>
                    <input type="color" class="form-control" id="backgroundColor" name="backgroundColor" value="#000000">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- 일정 상세 모달 -->
<div class="modal fade" id="calendarViewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewModalLabel">일정 상세</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" name="id" id="view_id" value="">
                    <label for="div_title" class="col-form-label">일정 내용</label>
                    <div class="form-control" id="div_title"></div>

                    <label for="div_writer" class="col-form-label">작성자</label>
                    <div class="form-control" id="div_writer"></div>

                    <label for="div_start" class="col-form-label">시작 날짜</label>
                    <div class="form-control" id="div_start"></div>

                    <label for="div_end" class="col-form-label">종료 날짜</label>
                    <div class="form-control" id="div_end"></div>

                    <label for="div_textColor" class="col-form-label">글자 색상</label>
                    <input type="color" class="form-control" id="div_textColor" value="" style="background-color: #ffffff;" disabled>

                    <label for="div_backgroundColor" class="col-form-label">배경 색상</label>
                    <input type="color" class="form-control" id="div_backgroundColor" value="" style="background-color: #ffffff;" disabled>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="getModifyCalendar">수정하기</button>
                <button type="button" class="btn btn-danger" id="deleteCalendar">삭제하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="viewModalClose">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 일정 수정 모달 -->
<div class="modal fade" id="calendarModifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modifyModalLabel">일정 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="mTitle" class="col-form-label">일정 내용</label>
                    <input type="text" class="form-control" id="mTitle" name="title" maxlength="30">
                    <label for="mWriter" class="col-form-label">작성자</label>
                    <input type="text" class="form-control" id="mWriter" name="writer">
                    <label for="mStart" class="col-form-label">시작 날짜</label>
                    <input type="date" class="form-control" id="mStart" name="start">
                    <label for="mEnd" class="col-form-label">종료 날짜</label>
                    <input type="date" class="form-control" id="mEnd" name="end">
                    <label for="textColor" class="col-form-label">글자 색상</label>
                    <input type="color" class="form-control" id="mTextColor" name="textColor" value="#ffffff">
                    <label for="backgroundColor" class="col-form-label">배경 색상</label>
                    <input type="color" class="form-control" id="mBackgroundColor" name="backgroundColor" value="#000000">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="modifyCalendar">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modifySettingModalClose">취소</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    // 상세 정보
    let viewId = document.getElementById("view_id");
    let divTitle = document.getElementById("div_title");
    let divWriter = document.getElementById("div_writer");
    let divStart = document.getElementById("div_start");
    let divEnd = document.getElementById("div_end");
    let divTextColor = document.getElementById("div_textColor");
    let divBackgroundColor = document.getElementById("div_backgroundColor");
    // 수정 정보
    let mTitle = document.getElementById("mTitle");
    let mWriter = document.getElementById("mWriter");
    let mStart = document.getElementById("mStart");
    let mEnd = document.getElementById("mEnd");
    let mTextColor = document.getElementById("mTextColor");
    let mBackgroundColor = document.getElementById("mBackgroundColor");

    document.addEventListener("DOMContentLoaded", function() {
        // 일정 목록 가져오기
        let request = $.ajax({
            type: "GET",
            url: "/myedu/plan/calendar",
            dataType: "json"
        });

        // 달력 표시
        request.done(function(data) {
            var calendarEl = document.getElementById("calendar");
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev next today',
                    center: 'title',
                    right: 'addEventButton dayGridMonth,dayGridWeek'
                },
                selectable: true,
                editable: true,
                dayMaxEvents: true, // +more 표시
                events: data,
                eventClick: function(arg) { // 일정 선택했을 때
                    let id = arg.event.id;

                    $("#calendarViewModal").modal("show");

                    // 일정 상세 정보 가져오기
                    $.ajax({
                        url: "/myedu/plan/view",
                        type: "GET",
                        data: {id: id},
                        success: function(data) {
                            viewId.value = data.id;
                            divTitle.innerText = data.title;
                            divWriter.innerText = data.writer;
                            divStart.innerText = data.start;
                            divEnd.innerText = data.end;
                            divTextColor.value = data.textColor;
                            divBackgroundColor.value = data.backgroundColor;
                        }
                    });
                },
                dateClick: function(arg) { // 날짜 클릭했을 때
                    $("#calendarModal").modal("show");
                    document.getElementById("start").value = arg.dateStr;
                },
                eventChange: function(arg) { // 일정 변경됐을 때(옮기거나 늘릴 때)
                    var changeObj = {
                        id: arg.event.id,
                        title: arg.event.title,
                        writer: "${sessionScope.member_id}",
                        start: dateFormat(new Date(arg.event.start)),
                        end: dateFormat(new Date(arg.event.end)),
                        textColor: arg.event.textColor,
                        backgroundColor: arg.event.backgroundColor
                    }

                    $.ajax({
                        type: "POST",
                        url: "/myedu/plan/modify",
                        data: JSON.stringify(changeObj),
                        contentType: "application/json; charset=UTF-8",
                        success: function(data) {
                            console.log(data);
                            if(data != "fail") {
                                window.location.href=data;
                            } else {
                                alert("일정 수정 실패\n다시 수정해주세요.");
                            }
                        }
                    });
                },
                select: function(arg) { // 날짜 드래그 했을 때
                    $("#calendarModal").modal("show");
                    document.getElementById("start").value = arg.startStr;
                    document.getElementById("end").value = arg.endStr;
                },
                customButtons: {
                    addEventButton: {
                        text: "일정 등록",
                        click: function() {
                            $("#calendarModal").modal("show");
                        }
                    }
                }
            });
            calendar.render();
        });
    });

    // 일정 등록
    $("#addCalendar").on("click", function() {
        let title = $("#title").val();
        let writer = $("#writer").val();
        let start = $("#start").val();
        let end = $("#end").val();
        let textColor = $("#textColor").val();
        let backgroundColor = $("#backgroundColor").val();

        let obj = readyToPost(title, writer, start, end, textColor, backgroundColor);

        $.ajax({
            type: "POST",
            url: "/myedu/plan/regist",
            data: JSON.stringify(obj),
            contentType: "application/json; charset=UTF-8",
            success: function(data) {
                if(data != "fail") {
                    window.location.reload(data);
                } else {
                    alert("일정 등록 실패\n재등록해주세요.");
                }
            }
        });
    });

    // 일정 상세 -> 수정 버튼 눌렀을 때
    $("#getModifyCalendar").on("click", function() {
        $("#calendarViewModal").modal("hide");
        $("#calendarModifyModal").modal("show");

        // 일정 수정 -> 선택한 일정 정보 가져오기
        $.ajax({
            url: "/myedu/plan/view",
            type: "GET",
            data: {id: viewId.value},
            success: function(data) {
                mTitle.value = data.title;
                mWriter.value = data.writer;
                mStart.value = data.start;
                mEnd.value = data.end;
                mTextColor.value = data.textColor;
                mBackgroundColor.value = data.backgroundColor;
            }
        });

        // 일정 수정 post
        $("#modifyCalendar").on("click", function() {
            let mObj = readyToPost(mTitle.value, mWriter.value, mStart.value, mEnd.value, mTextColor.value, mBackgroundColor.value);
            mObj.id = viewId.value;

            $.ajax({
                type: "POST",
                url: "/myedu/plan/modify",
                data: JSON.stringify(mObj),
                contentType: "application/json; charset=UTF-8",
                success: function(data) {
                    if(data != "fail") {
                        window.location.reload(data);
                    } else {
                        alert("일정 수정 실패\n다시 수정해주세요.");
                    }
                }
            });
        });
    });

    // 일정 삭제 버튼 클릭했을 때
    $("#deleteCalendar").on("click", function() {
        let confirmFlag = confirm("일정을 삭제하시겠습니까?");

        if(confirmFlag) {
            $.ajax({
                url: "/myedu/plan/delete",
                type: "POST",
                data: {id: viewId.value},
                success: function(data) {
                    if(data != "fail") {
                        window.location.reload(data);
                    } else {
                        alert("일정 삭제 실패\n다시 시도하세요.");
                    }
                }
            });
        }
    });

    function readyToPost(title, writer, start, end, textColor, backgroundColor) {
        if(title == null || title == "") {
            alert("일정 내용을 입력하세요.");
            return;
        }
        if(start == "" || end == "") {
            alert("일정 기간을 입력하세요.");
            return;
        }
        if(new Date(end) - new Date(start) < 0) {
            alert("종료일이 시작일보다 먼저입니다.");
            return;
        }
        var obj = {
            title: title,
            writer: writer,
            start: start,
            end: end,
            textColor: textColor,
            backgroundColor: backgroundColor
        };

        return obj;
    }

    function dateFormat(date) {
        let startDate = date.getFullYear() + "-"
            + (date.getMonth()+1 < 10 ? "0" + (date.getMonth()+1) : (date.getMonth()+1)) + "-"
            + (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());

        return startDate;
    }
</script>

</body>
</html>
