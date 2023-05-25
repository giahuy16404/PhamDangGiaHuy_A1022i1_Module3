<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/23/2023
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Muon Sach</h1>
<form method="post" action="/SachServlet?action=addTheMuonSach">

    <table>
        <tr>
            <td>${errorSoLuong}</td>
        </tr>
        <tr>
            <td>Ma Muon Sach:</td>
            <td><input type="text" name="maMuonSach"></td>
        </tr>
        <tr>
            <td>Ten Sach:</td>
            <td><input type="text" value="${tenSach}" readonly name="tenSach"></td>
        </tr>
        <tr>
            <td>Ten Hoc Sinh:</td>
            <td>
                <select name="tenHocSinh">
                    <c:forEach items="${hocSinhList}" var="list">
                        <option>${list.hoTen}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>Ngay Muon Sach:</td>
            <td><input type="text" value="${ngayMuon}" readonly name="ngayMuonSach"></td>
        </tr>
        <tr>
            <td>Ngay Tra Sach:</td>
            <td><input type="date" value="${ngayMuon}" name="ngayTraSach"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Muon Sach"></td>
            <td><a href="/SachServlet?action=null"><input type="button" value="Huy"></a></td>
        </tr>
    </table>
</form>

</body>
</html>
