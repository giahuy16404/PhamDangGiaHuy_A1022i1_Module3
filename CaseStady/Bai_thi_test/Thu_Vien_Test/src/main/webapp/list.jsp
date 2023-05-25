<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/23/2023
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sach sach</h1>
<table>
  <tr>
    <th>Ma sach</th>
    <th>Ten Sach</th>
    <th>Tac Gia</th>
    <th>So Luong</th>
    <th>Mo Ta</th>
  </tr>
 <c:forEach items="${sachList}" var="list">
   <tr>
     <td>${list.maSach}</td>
     <td>${list.tenSach}</td>
     <td>${list.tacGia}</td>
     <td>${list.moTa}</td>
     <td>${list.soLuong}</td>
     <td><a href="/SachServlet?action=muon&id=${list.maSach}&tenSach=${list.tenSach}&soLuong=${list.soLuong}"><input type="button" value="Muon"> </a></td>
   </tr>
 </c:forEach>
</table>

</body>
</html>
