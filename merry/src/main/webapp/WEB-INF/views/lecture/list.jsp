<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-05-24(Fri)
  Time: AM 1:15
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
<ul>
    <c:forEach var="lectureDTO" items="${responseDTO.dtoList}">
        <ul onclick="location.href='/lecture/view?lec_idx=${lectureDTO.lec_idx}'">${lectureDTO.lec_title}</ul>
    </c:forEach>
</ul>

</body>
</html>
