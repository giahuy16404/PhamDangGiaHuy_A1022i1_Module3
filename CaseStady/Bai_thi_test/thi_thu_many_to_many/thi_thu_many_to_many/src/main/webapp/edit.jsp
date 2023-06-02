<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 6/1/2023
  Time: 6:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/UserRoleServlet?action=doEdit" method="post">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="number" name="idUserUpdate" value="${id}" readonly></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="nameUserUpdate"></td>
        </tr>
        <tr>
            <td>code:</td>
            <td><input type="text" name="codeUserUpdate"></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><input type="date" name="birhtdayUserUpdate"></td>
        </tr>
        <tr>
            <td>Role:</td>
            <td><input type="checkbox" name="roleUpdate" value="1">Admin</td>
            <td><input type="checkbox" name="roleUpdate" value="2">User</td>
        </tr>
        <tr>
            <td><input type="submit" value="Update"></td>
        </tr>
    </table>
</form>
</body>
</html>
