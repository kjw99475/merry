<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-05-24(Fri)
  Time: AM 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
${lectureDTO.lec_idx}<br>
${lectureDTO.lec_title}<br>
${lectureDTO.lec_content}<br>
${lectureDTO.lec_status}<br>
${lectureDTO.lec_reg_date}<br>
${lectureDTO.lec_modify_date}<br>
${lectureDTO.member_idx}<br>
${lectureDTO.lec_img}<br>
${lectureDTO.member_name}<br>
<ul>
<c:forEach items="${ChapterList}" var="chapDTO">
    <li>${chapDTO.chap_idx} ${chapDTO.chap_title} ${chapDTO.chap_video} ${chapDTO.chap_time} ${chapDTO.chap_status}</li>
</c:forEach>
</ul>
</body>
</html>
