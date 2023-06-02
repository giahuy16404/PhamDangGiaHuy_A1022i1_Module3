<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 6/1/2023
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #f2f2f2;
            padding: 20px;
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            padding: 5px;
            margin-right: 10px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<header>
    <h1>Tiêu đề của trang</h1>
    <form action="/UserRoleServlet?action=showBy" method="post">
    <input type="number" placeholder="Tìm kiếm..." name="idShowBy" value="0">
    <input type="text" placeholder="Tìm kiếm..." name="nameShowBy">
        <br>
        <br>
        <input type="submit" value="Tim">
    </form>
    <br><br>
    <a href="/UserRoleServlet?action=showCreate">
        <button>Add User</button>
    </a>
</header>

<table>
    <tr>
        <th>Cột 1</th>
        <th>Cột 2</th>
        <th>Cột 3</th>
        <th>Cột 4</th>
        <th>Cột 5</th>
        <th>Cột 6</th>
        <th>Cột 7</th>
        <th>Cột 8</th>
    </tr>
    <c:forEach items="${showList}" var="list">
        <tr>
            <td>${list.getUser().getId()}</td>
            <td>${list.getUser().getName()}</td>
            <td>${list.getUser().getCode()}</td>
            <td>${list.getUser().getBirthday()}</td>
            <td>${list.getUser().getThoiGianKhoiTao()}</td>
            <td>${list.getRole().getName()}</td>
            <td><a href="/UserRoleServlet?action=showEdit&id=${list.getUser().getId()}">
                <button>Edit</button>
            </a></td>
            <td><a href="/UserRoleServlet?action=doRemove&id=${list.getUser().getId()}">
                <button>Remove</button>
            </a></td>
        </tr>
    </c:forEach>
</table>



</body>
</html>