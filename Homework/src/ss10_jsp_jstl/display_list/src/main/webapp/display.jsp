<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/10/2023
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh Sach Khach Hang</h1>
<br>
<table >
    <tr>
        <td>Tên</td>
        <td>Ngày Sinh</td>
        <td>Địa chỉ</td>
        <td>Ảnh</td>
    </tr>
    <c:forEach items="${entities}" var="ent" varStatus="a">
        <tr>
            <td>${ent.name}</td>
            <td>${ent.birthday}</td>
            <td>${ent.location}</td>
            <td><img src="${ent.pictures}" width="40px" height="40px" ></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
