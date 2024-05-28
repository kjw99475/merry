<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>강의 영상 재생</title>

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<%--    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
<%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">--%>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="ibox float-e-margins">
<%--                <div class="ibox-title">--%>
<%--                    <h5>Video description</h5></div>--%>
<%--                <div class="ibox-content profile-content">--%>
<%--                    <h4><strong>Bootdey responsive video snippet</strong></h4>--%>
<%--                    <p><i class="fa fa-clock-o"></i> Uploaded on Jan 27, 2016</p>--%>
<%--                    <h5> Science and Technology</h5>--%>
<%--                    <p> Lorem ipsum dolor sit amet, et singulis eleifend concludaturque cum. Ne solet eleifend prodesset sed. Iusto deleniti--%>
<%--                        <br>--%>
<%--                        <br> <small>Lorem ipsum dolor sit amet, et singulis eleifend concludaturque cum. Ne solet eleifend prodesset</small>--%>
<%--                        <br>--%>
<%--                        <br> Lorem ipsum dolor sit amet, et singulis eleifend concludaturque cum. Ne solet eleifend prodesset sed. Iusto deleniti mandamus has ut, vim ut omnium ponderum tractatos, oratio nostrud no mea. Dolorum assentior sed cu</p>--%>
<%--                    <div class="row m-t-md">--%>
<%--                        <div class="col-md-3">--%>
<%--                            <h5><strong>169</strong> Likes</h5></div>--%>
<%--                        <div class="col-md-9">--%>
<%--                            <h5><strong>28</strong> Comments</h5></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <jsp:include page="/WEB-INF/views/common/myeduLecture_sidebar.jsp">
                    <jsp:param name="menuGubun" value="list"/>
                </jsp:include>
                <c:forEach items="${chapterDTOList}" var="chapList">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="/myedu/qna/list" class="nav-link black-text <c:if test="${fn:contains(param.menuGubun, 'qna')}">active</c:if>">${chapList.chap_title}</a>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Video window</h5></div>
                <div class="ibox-content">
                    <figure>
<%--                        <iframe src="https://www.youtube.com/embed/ESXgJ9-H-2U" frameborder="1" allowfullscreen="" data-aspectratio="0.8211764705882353" style="width: 523px; height: 429.475px;"></iframe>--%>
                        <embed src="http://localhost:8080/uploads/lecture/${chapterDTO.chap_video}" frameborder="1" allowfullscreen="true" data-aspectratio="0.8211764705882353" style="width: 523px; height: 429.475px;"></embed>
<%--                        <video src="C:/HK/merry/merry/src/main/webapp/resources/uploads/lecture/${chapterDTO.chap_video}" frameborder="1" allowfullscreen="true" data-aspectratio="0.8211764705882353" style="width: 523px; height: 429.475px;"></video>--%>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
